﻿using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEditor.Game.AddressableAssets.Settings;

namespace UnityEditor.Game.AddressableAssets
{
    [InitializeOnLoad]
    internal class AddressableEditorInitialization
    {
        private const string m_EditorInitializedBoolName = nameof(m_EditorInitializedBoolName);

        static AddressableEditorInitialization()
        {  
            bool editorInitialized = SessionState.GetBool(m_EditorInitializedBoolName, false);
            if (editorInitialized) return;

            if (Directory.Exists("Library/com.unity.addressables/")) //TODO:macdeng
                PurgeInvalidAssetEntries(AddressableAssetSettingsDefaultObject.Settings);

            SessionState.SetBool(m_EditorInitializedBoolName, true);
        }

        internal static void PurgeInvalidAssetEntries(AddressableAssetSettings settings)
        {
            if (settings == null) return;
            List<AddressableAssetEntry> entriesToRemove = new List<AddressableAssetEntry>();

            foreach (var group in settings.groups)
            {
                if (group == null)
                    continue;

                foreach (var assetEntry in group.entries)
                {
                    if (assetEntry == null)
                        continue;

                    if (!string.IsNullOrEmpty(assetEntry.AssetPath))
                    {
                        string path = Path.GetFullPath(assetEntry.AssetPath);
                        if (!File.Exists(path) && !Directory.Exists(path))
                            entriesToRemove.Add(assetEntry);
                    }
                    else
                        entriesToRemove.Add(assetEntry);
                }
            }

            StringBuilder builder = new StringBuilder(
                "Addressables was unable to detect the following assets in the project " +
                "but they were still part of an Addressable group.  They have been removed " +
                "from Addressables.");

            foreach (var entry in entriesToRemove)
            {
                builder.AppendLine($"\n{entry.address} at {entry.AssetPath}");
                settings.RemoveAssetEntry(entry, false);
            }

            if (entriesToRemove.Count > 0)
            {
                UnityEngine.Debug.Log(builder.ToString());
            }
        }
    }
}