using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Reflection;
using UnityEditor.PackageManager;
using UnityEditor.PackageManager.Requests;
using UnityEditor.VersionControl;
using UnityEngine;

namespace UnityEditor.Game.AddressableAssets.Settings
{
    using Object = UnityEngine.Object;

    static class AddressableAssetUtility
    {
        internal static bool IsInResources(string path)
        {
            return path.Replace('\\', '/').ToLower().Contains("/resources/");
        }

        internal static bool GetPathAndGUIDFromTarget(Object target, out string path, out string guid, out Type mainAssetType)
        {
            mainAssetType = null;
            guid = string.Empty;
            path = string.Empty;
            if (target == null)
                return false;
            path = AssetDatabase.GetAssetOrScenePath(target);
            if (!IsPathValidForEntry(path))
                return false;
            guid = AssetDatabase.AssetPathToGUID(path);
            if (string.IsNullOrEmpty(guid))
                return false;
            mainAssetType = AssetDatabase.GetMainAssetTypeAtPath(path);
            if (mainAssetType == null)
                return false;
            if (mainAssetType != target.GetType() && !typeof(AssetImporter).IsAssignableFrom(target.GetType()))
                return false;
            return true;
        }
        static HashSet<string> excludedExtensions = new HashSet<string>(new string[] { ".cs", ".js", ".boo", ".exe", ".dll", ".meta" });
        internal static bool IsPathValidForEntry(string path)
        {
            if (string.IsNullOrEmpty(path))
                return false;
            if (!path.StartsWith("assets", StringComparison.OrdinalIgnoreCase) && !IsPathValidPackageAsset(path))
                return false;
            //TODO:macdeng
            /*if (path == CommonStrings.UnityEditorResourcePath ||
                path == CommonStrings.UnityDefaultResourcePath ||
                path == CommonStrings.UnityBuiltInExtraPath)
                return false;*/
            return !excludedExtensions.Contains(Path.GetExtension(path));
        }

        internal static bool IsPathValidPackageAsset(string path)
        {
            string convertPath = path.ToLower().Replace("\\", "/");
            string[] splitPath = convertPath.Split('/');

            if (splitPath.Length < 3)
                return false;
            if (splitPath[0] != "packages")
                return false;
            if (splitPath[2] == "package.json")
                return false;
            return true;
        }

        static HashSet<Type> validTypes = new HashSet<Type>();
        internal static Type MapEditorTypeToRuntimeType(Type t, bool allowFolders)
        {
            //type is valid and already seen (most common)
            if (validTypes.Contains(t))
                return t;

            //removes the need to check this outside of this call
            if (t == null)
                return t;

            ////check for editor type, this will get hit once for each new type encountered
            //if (!t.Assembly.IsDefined(typeof(AssemblyIsEditorAssembly), true) && !Build.BuildUtility.IsEditorAssembly(t.Assembly))
            //{
            //    validTypes.Add(t);
            //    return t;
            //}

            if (t == typeof(DefaultAsset))
                return typeof(DefaultAsset);

            //try to remap the editor type to a runtime type
            return MapEditorTypeToRuntimeTypeInternal(t);
        }

        static Type MapEditorTypeToRuntimeTypeInternal(Type t)
        {
            if (t == typeof(UnityEditor.Animations.AnimatorController))
                return typeof(RuntimeAnimatorController);
            if (t.FullName == "UnityEditor.Audio.AudioMixerController")
                return typeof(UnityEngine.Audio.AudioMixer);
            if (t.FullName == "UnityEditor.Audio.AudioMixerGroupController")
                return typeof(UnityEngine.Audio.AudioMixerGroup);
            return null;
        }

        /// <summary>
        /// Get all types that can be assigned to type T
        /// </summary>
        /// <typeparam name="T">The class type to use as the base class or interface for all found types.</typeparam>
        /// <returns>A list of types that are assignable to type T.  The results are cached.</returns>
        public static List<Type> GetTypes<T>()
        {
            return TypeManager<T>.Types;
        }

        /// <summary>
        /// Get all types that can be assigned to type rootType.
        /// </summary>
        /// <param name="rootType">The class type to use as the base class or interface for all found types.</param>
        /// <returns>A list of types that are assignable to type T.  The results are not cached.</returns>
        public static List<Type> GetTypes(Type rootType)
        {
            return TypeManager.GetManagerTypes(rootType);
        }

        class TypeManager
        {
            public static List<Type> GetManagerTypes(Type rootType)
            {
                var types = new List<Type>();
                try
                {
                    foreach (var a in AppDomain.CurrentDomain.GetAssemblies())
                    {
                        if (a.IsDynamic)
                            continue;
                        foreach (var t in a.ExportedTypes)
                        {
                            if (t != rootType && rootType.IsAssignableFrom(t) && !t.IsAbstract)
                                types.Add(t);
                        }
                    }
                }
                catch (Exception)
                {
                    // ignored
                }

                return types;
            }
        }

        class TypeManager<T> : TypeManager
        {
            // ReSharper disable once StaticMemberInGenericType
            static List<Type> s_Types;
            public static List<Type> Types
            {
                get
                {
                    if (s_Types == null)
                        s_Types = GetManagerTypes(typeof(T));

                    return s_Types;
                }
            }
        }

        internal static bool SafeMoveResourcesToGroup(AddressableAssetSettings settings, AddressableAssetGroup targetGroup, List<string> paths, List<string> guids, bool showDialog = true)
        {
            if (targetGroup == null)
            {
                Debug.LogWarning("No valid group to move Resources to");
                return false;
            }

            if (paths == null || paths.Count == 0)
            {
                Debug.LogWarning("No valid Resources found to move");
                return false;
            }

            if (guids == null)
            {
                guids = new List<string>();
                foreach (var p in paths)
                    guids.Add(AssetDatabase.AssetPathToGUID(p));
            }

            Dictionary<string, string> guidToNewPath = new Dictionary<string, string>();

            var message = "Any assets in Resources that you wish to mark as Addressable must be moved within the project. We will move the files to:\n\n";
            for (int i = 0; i < guids.Count; i++)
            {
                var newName = paths[i].Replace("\\", "/");
                newName = newName.Replace("Resources", "Resources_moved");
                newName = newName.Replace("resources", "resources_moved");
                if (newName == paths[i])
                    continue;

                guidToNewPath.Add(guids[i], newName);
                message += newName + "\n";
            }
            message += "\nAre you sure you want to proceed?";
            if (!showDialog || EditorUtility.DisplayDialog("Move From Resources", message, "Yes", "No"))
            {
                settings.MoveAssetsFromResources(guidToNewPath, targetGroup);
                return true;
            }
            return false;
        }

        static Dictionary<Type, string> s_CachedDisplayNames = new Dictionary<Type, string>();
        internal static string GetCachedTypeDisplayName(Type type)
        {
            string result = "<none>";
            if (type != null)
            {
                if (!s_CachedDisplayNames.TryGetValue(type, out result))
                {
                    var displayNameAtr = type.GetCustomAttribute<DisplayNameAttribute>();
                    if (displayNameAtr != null)
                    {
                        result = (string)displayNameAtr.DisplayName;
                    }
                    else
                        result = type.Name;

                    s_CachedDisplayNames.Add(type, result);
                }
            }

            return result;
        }
        
        internal static bool IsUsingVCIntegration()
        {
            return Provider.isActive && Provider.enabled;
        }

        internal static bool IsVCAssetOpenForEdit(string path)
        {
            AssetList VCAssets = GetVCAssets(path);
            foreach(Asset vcAsset in VCAssets)
            {
                if (vcAsset.path == path)
                    return Provider.IsOpenForEdit(vcAsset);
            }
            return false;
        }

        internal static AssetList GetVCAssets(string path)
        {
            Task op = Provider.Status(path);
            op.Wait();
            return op.assetList;
        }
                
        private static bool MakeAssetEditable(Asset asset)
        {
#if UNITY_2019_4_OR_NEWER
            if(!AssetDatabase.IsOpenForEdit(asset.path))
                return AssetDatabase.MakeEditable(asset.path);
#else
            if(!Provider.IsOpenForEdit(asset))
            {
                CheckoutMode mode = asset.isMeta ? CheckoutMode.Meta : CheckoutMode.Asset;
                Task task = Provider.Checkout(asset, mode);
                task.Wait();
                return task.success;
            }
#endif
            return false;
        }

        internal static bool OpenAssetIfUsingVCIntegration(Object target, bool exitGUI = false)
        {
            if (!IsUsingVCIntegration() || target == null)
                return false;
            return OpenAssetIfUsingVCIntegration(AssetDatabase.GetAssetOrScenePath(target), exitGUI);
        }

        internal static bool OpenAssetIfUsingVCIntegration(string path, bool exitGUI = false)
        {
            if (!IsUsingVCIntegration() || string.IsNullOrEmpty(path))
                return false;
            
            AssetList assets = GetVCAssets(path);
            var uneditableAssets = new List<Asset>();            
            string message = "Check out file(s)?\n\n";
            foreach(Asset asset in assets)
            {
                if(!Provider.IsOpenForEdit(asset))
                {
                    uneditableAssets.Add(asset);
                    message += $"{asset.path}\n";
                }
            }

            if (uneditableAssets.Count == 0)
                return false;

            bool openedAsset = true;
            if (EditorUtility.DisplayDialog("Attempting to modify files that are uneditable", message, "Yes", "No"))
            {
                foreach(Asset asset in uneditableAssets)
                {
                    if (!MakeAssetEditable(asset))
                        openedAsset = false;
                }
            }
            if (exitGUI)
                GUIUtility.ExitGUI();
            return openedAsset;
        }

        internal static List<PackageManager.PackageInfo> GetPackages()
        {
            ListRequest req = Client.List();
            while (!req.IsCompleted) {}

            var packages = new List<PackageManager.PackageInfo>();
            if (req.Status == StatusCode.Success)
            {
                PackageCollection collection = req.Result;
                foreach (PackageManager.PackageInfo package in collection)
                    packages.Add(package);
            }
            return packages;
        }
    }
}
