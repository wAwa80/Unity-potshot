using System.Collections.Generic;
using UnityEditor;
using UnityEditor.Game.AddressableAssets.Settings;
using UnityEditor.Game.AddressableAssets.Settings.GroupSchemas;
using UnityEngine;
using static UnityEditor.Game.AddressableAssets.Settings.GroupEntryCache;

namespace Game.Addresssables.Editor
{
    public class AddressablesUtils : UnityEditor.Editor
    {
        public static AddressableAssetSettings GetSettings()
        {
            return UnityEditor.AssetDatabase.LoadAssetAtPath<AddressableAssetSettings>(
                "Assets/_GameAssetsData/GameAssetSettings.asset");
        }

        public static GroupEntryCache GetGroupEntryCache()
        {
            return UnityEditor.AssetDatabase.LoadAssetAtPath<GroupEntryCache>(
                "Assets/_GameAssetsData/GameGroupEntryCache.asset");
        }

        public static AddressableAssetGroup GetOrCreateGroup(string groupName)
        {
            AddressableAssetSettings settings = GetSettings();
            BoquAssetGroupSchema schema1 = CreateInstance<BoquAssetGroupSchema>();

            List<AddressableAssetGroupSchema> schemas = new List<AddressableAssetGroupSchema>() {
             schema1,
            };
            AddressableAssetGroup group = settings.groups.Find((g) => { return g.name == groupName; });
            if (group == null)
            {
                return settings.CreateGroup(groupName, false, true, schemas);
            }
            return group;
        }

        private static AddressableAssetGroup CreateGroupByTemplateIndex(string groupName, int index)
        {
            var settings = GetSettings();

            var groupTemplate = settings.GetGroupTemplateObject(index) as AddressableAssetGroupTemplate;
            if (groupTemplate != null)
            {
                AddressableAssetGroup newGroup = settings.CreateGroup(groupName, false, true, null, groupTemplate.GetTypes());
                groupTemplate.ApplyToAddressableAssetGroup(newGroup);
                return newGroup;
            }
            return null;
        }

        public static AddressableAssetGroup CreateLocalPackedLZ4Group(string groupName)
        {
            return CreateGroupByTemplateIndex(groupName, 0);
        }

        public static AddressableAssetGroup CreateLocalSeperatedLZMAGroup(string groupName)
        {
            return CreateGroupByTemplateIndex(groupName, 1);
        }

        public static AddressableAssetGroup CreateLocalPackedUncompressedGroup(string groupName)
        {
            return CreateGroupByTemplateIndex(groupName, 2);
        }
        
        public static void AddAssetToGroup(string assetGuid, string groupName, string label = "", bool forceCreateLabel = true, string address = "")
        {
            if (assetGuid.Equals(""))
            {
                Debug.Log($"assetGuid is empty, groupName: {groupName}");
                return;
            }
            AddressableAssetSettings s = GetSettings();
            AddressableAssetGroup g = GetOrCreateGroup(groupName);
            AddressableAssetEntry entry = s.CreateOrMoveEntry(assetGuid, g);
            if(label.Length > 0)
            {
                entry.SetLabel(label, true, forceCreateLabel);
            }
            if(address.Length > 0)
            {
                entry.SetAddress(address);
            }
        }

        public static void InitGroupEntry2AssetsMap()
        {
            var settings = GetSettings();
            var groupEntryCache = GetGroupEntryCache();
            groupEntryCache.GroupEntry2AssetsMap.Clear();
            var groups = settings.groups;
            EditorUtility.DisplayProgressBar("Init GroupEntry2AssetsMap", "progressing...", 0f);
            int groupCount = groups.Count;
            int groupIndex = 0;
            foreach (AddressableAssetGroup group in groups)
            {
                var schema = group.GetSchema<BoquAssetGroupSchema>();
                var entries = group.entries;
                int entriesCount = entries.Count;
                int entriesIndex = 0;
                foreach (var entry in entries)
                {
                    entriesIndex++;
                    EditorUtility.DisplayProgressBar("Init GroupEntry2AssetsMap", "progressing...", 1f / groupCount * groupIndex + 1f / groupCount * entriesIndex / entriesCount);
                    List<AddressableAssetEntry> assets = new List<AddressableAssetEntry>();
                    entry.GatherAllAssets(assets, true, true, true);
                    groupEntryCache.GroupEntry2AssetsMap.Add(group.Guid + entry.guid, new CachedAssets(assets));
                }
                groupIndex++;
            }
            EditorUtility.DisplayProgressBar("Init GroupEntry2AssetsMap", "finished...", 1f);
            EditorUtility.ClearProgressBar();
        }

    }

}
