#if UNITY_EDITOR
using Game.Addresssables.AsyncOperations;
using Game.Addresssables.Module;
using Game.Addresssables.Utils;
using System;
using Cysharp.Threading.Tasks;
using UnityEditor;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;

namespace Game.Addresssables.ModuleImpl
{
    public class DummyAssetModule : BaseModule, IAssetModule
    {
        bool debugAddressableAssets;
        public override void Init()
        {
            base.Init();
            dbsAssembly = Assembly.LoadFile(UnityEngine.Application.dataPath.Substring(0, UnityEngine.Application.dataPath.Length - 6) + "/Library/ScriptAssemblies/DBS.Editor.dll");
            addressableAssetSettingsDefaultObjectType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.AddressableAssetSettingsDefaultObject");
            settingsPropertyInfo = addressableAssetSettingsDefaultObjectType.GetProperty("Settings", BindingFlags.Public | BindingFlags.Static);
            groupEntryCachePropertyInfo = addressableAssetSettingsDefaultObjectType.GetProperty("GameGroupEntryCache", BindingFlags.Public | BindingFlags.Static);
            settings = settingsPropertyInfo.GetValue(null);

            settingsType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.AddressableAssetSettings");
            PropertyInfo debugAddressableAssetsPropertyInfo = settingsType.GetProperty("DebugAddressableAssets", BindingFlags.Instance | BindingFlags.NonPublic);
            debugAddressableAssets = (bool)debugAddressableAssetsPropertyInfo.GetValue(settings);
            if (!debugAddressableAssets)
            {
                return;
            }
            groupEntryCache = groupEntryCachePropertyInfo.GetValue(null);
            System.Type groupEntryCacheType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.GroupEntryCache");
            groupEntry2AssetsMapPropertyInfo = groupEntryCacheType.GetProperty("GroupEntry2AssetsMap", BindingFlags.Instance | BindingFlags.NonPublic);
            groupsPropertyInfo = settingsType.GetProperty("groups", BindingFlags.Public | BindingFlags.Instance);
            groups = groupsPropertyInfo.GetValue(settings);
            groupType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.AddressableAssetGroup");
            schemaType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.GroupSchemas.BoquAssetGroupSchema");
            entryType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.AddressableAssetEntry");
            getSchemaMethodInfo = groupType.GetMethod("GetSchema", BindingFlags.Public | BindingFlags.Instance, null, new System.Type[] { typeof(System.Type) }, null);
            groupIdPropertyInfo = schemaType.GetProperty("GroupId", BindingFlags.Public | BindingFlags.Instance);
            entriesPropertyInfo = groupType.GetProperty("entries", BindingFlags.Public | BindingFlags.Instance);
            addressPropertyInfo = entryType.GetProperty("address", BindingFlags.Public | BindingFlags.Instance);
            System.Type cachedAssetsType = dbsAssembly.GetType("UnityEditor.Game.AddressableAssets.Settings.GroupEntryCache+CachedAssets");
            assetsFieldInfo = cachedAssetsType.GetField("value", BindingFlags.Public | BindingFlags.Instance);
            groupGuidPropertyInfo = groupType.GetProperty("Guid", BindingFlags.Public | BindingFlags.Instance);
            entryGuidPropertyInfo = entryType.GetProperty("guid", BindingFlags.Public | BindingFlags.Instance);
        }
        private UnityEngine.Object LoadAssetSubObject(string mainPath, string subKey)
        {
            UnityEngine.Object[] objs = AssetDatabase.LoadAllAssetRepresentationsAtPath(mainPath);
            UnityEngine.Debug.Log(" --- >>> LoadAssetSubObject");
            UnityEngine.Debug.Log(objs.Length);

            return objs[int.Parse(subKey) - 1];
        }

        private UnityEngine.Object[] LoadAssetAtlasObject(string mainPath)
        {
            UnityEngine.Object[] objs = AssetDatabase.LoadAllAssetRepresentationsAtPath(mainPath);
            UnityEngine.Debug.Log(" --- >>> LoadAssetSubObject");
            UnityEngine.Debug.Log(objs.Length);
            return objs;
        }

        private HashSet<string> addressableAssetsMap = new HashSet<string>();
        private HashSet<string> nonAddressableAssetsMap = new HashSet<string>();
        private Assembly dbsAssembly;
        System.Type addressableAssetSettingsDefaultObjectType;
        PropertyInfo settingsPropertyInfo;
        PropertyInfo groupEntryCachePropertyInfo;
        object settings;
        object groupEntryCache;
        System.Type settingsType;
        PropertyInfo groupsPropertyInfo;
        object groups;
        System.Type groupType;
        System.Type schemaType;
        System.Type entryType;
        MethodInfo getSchemaMethodInfo;
        PropertyInfo groupIdPropertyInfo;
        PropertyInfo entriesPropertyInfo;
        PropertyInfo addressPropertyInfo;
        PropertyInfo groupEntry2AssetsMapPropertyInfo;
        FieldInfo assetsFieldInfo;
        PropertyInfo groupGuidPropertyInfo;
        PropertyInfo entryGuidPropertyInfo;
        private bool IsAssetPathAddressable(string assetPath, string groupId)
        {
            if (!debugAddressableAssets)
            {
                return true;
            }
            if (addressableAssetsMap.Contains(assetPath))
            {
                return true;
            }
            if (nonAddressableAssetsMap.Contains(assetPath))
            {
                return true;
            }
            foreach (object group in groups as IEnumerable)
            {
                string groupGuid = groupGuidPropertyInfo.GetValue(group) as string;
                var schema = getSchemaMethodInfo.Invoke(group, new object[] { schemaType });
                var schemaGroupId = groupIdPropertyInfo.GetValue(schema) as string;
                if (schemaGroupId == groupId)
                {
                    var entries = entriesPropertyInfo.GetValue(group) as IEnumerable;
                    foreach (var entry in entries)
                    {
                        var groupEntry2AssetsMap = groupEntry2AssetsMapPropertyInfo.GetValue(groupEntryCache);
                        string entryGuid = entryGuidPropertyInfo.GetValue(entry) as string;
                        var cachedAssets = (groupEntry2AssetsMap as IDictionary)[groupGuid + entryGuid];
                        var assets = assetsFieldInfo.GetValue(cachedAssets);
                        foreach (var asset in assets as IEnumerable)
                        {

                            string address = addressPropertyInfo.GetValue(asset) as string;
                            if (address == assetPath)
                            {
                                if (!addressableAssetsMap.Contains(assetPath))
                                {
                                    addressableAssetsMap.Add(assetPath);
                                }
                                return true;
                            }
                            else
                            {
                                continue;
                            }
                        }
                    }
                }
                else
                {
                    continue;
                }
            }
            if (!nonAddressableAssetsMap.Contains(assetPath))
            {
                nonAddressableAssetsMap.Add(assetPath);
            }
            return false;
        }
        public async void LoadAssetAsync(string assetPath, Action<AsyncOperationBase> onCompleted, string groupId = "0", bool silent = false, bool isAtlas = false)
        {
            LoadAssetOp op = new LoadAssetOp();

            bool isSubAsset;
            string resourceKey;

            UnityEngine.Object result;
            UnityEngine.Object[] resultArray = null;
            if(GameUtils.ExtractKeyAndSubKey(assetPath, out string mainKey, out string subKey))
            {
                UnityEngine.Debug.Log($"---- >>> ExtractKeyAndSubKey {assetPath} {mainKey}  {subKey}");
                result = LoadAssetSubObject(mainKey, subKey);
                resourceKey = mainKey;
                isSubAsset = true;
            }
            else if (isAtlas)
            {
                resultArray = LoadAssetAtlasObject(assetPath);
                resourceKey = assetPath;
                isSubAsset = false;
                result = null;
            }
            else
            {
                result = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(assetPath);
                resourceKey = assetPath;
                isSubAsset = false;
            }

            op.Init(onCompleted, resourceKey, groupId, silent, isSubAsset, subKey);
            op.Result = result;
            op.ResultArray = resultArray; 

            await UniTask.Yield();
            if (!IsAssetPathAddressable(resourceKey, groupId))
            {
                op.FakeComplete(false);
                return;
            }
            op.FakeComplete(true);
        }

        public bool IsLoadingAnyAsset()
        {
            return false;
        }
    }
}
#endif