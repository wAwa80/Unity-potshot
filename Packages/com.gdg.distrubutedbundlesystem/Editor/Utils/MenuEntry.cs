using Game.Addresssables.Utils;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Game.Addresssables.Editor
{
    internal static class MenuEntry
    {
        [MenuItem("AddressablesEditor/Open Persistent Data Path")]
        private static void OpenPersistentDataPath()
        {
            OpenFolder(Application.persistentDataPath + "/SlotsCachingV2/Assetbundles");
        }

        [MenuItem("AddressablesEditor/Open AssetBundle Output Path")]
        private static void OpenAssetBundleOutputPath()
        {
            var parent = Directory.GetParent(Application.dataPath);
            OpenFolder(parent.FullName + "/Assetbundles/Android");
        }

        [MenuItem("AddressablesEditor/Init GroupEntry2AssetsMap")]
        private static void InitGroupEntry2AssetsMap()
        {
            AddressablesUtils.InitGroupEntry2AssetsMap();
        }

        private static void OpenFolder(string folder)
        {
            folder = string.Format("\"{0}\"", folder);
            switch (Application.platform)
            {
                case RuntimePlatform.WindowsEditor:
                    System.Diagnostics.Process.Start("Explorer.exe", folder.Replace('/', '\\'));
                    break;
                case RuntimePlatform.OSXEditor:
                    System.Diagnostics.Process.Start("open", folder);
                    break;
                default:
                    Debug.LogError("Your should fuck yourself!");
                    break;
            }
        }
    }
}
