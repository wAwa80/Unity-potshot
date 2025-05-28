using Game.Addresssables.Editor;
using Game.Addresssables.Serializer;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using UnityEditor;
using UnityEditor.Game.AddressableAssets.Settings;
using UnityEditor.Game.AddressableAssets.Settings.GroupSchemas;
using UnityEditor.Build.Pipeline;
using UnityEditor.Build.Pipeline.Interfaces;
using UnityEngine;
using UnityEngine.Build.Pipeline;
using static UnityEditor.Game.AddressableAssets.Settings.GroupSchemas.BoquAssetGroupSchema;
using Game.Addresssables.Config;
using Game.Addresssables.Utils;
using Game.Addresssables.Common;
using Game.Addresssables.Crc32;

namespace Game.Addresssables.Builder
{
    public static class AssetBundleBuilder
    {
        private static List<string> GetAssetNamesInFolderEntry(AddressableAssetEntry folderEntry)
        {
            List<AddressableAssetEntry> assets = new List<AddressableAssetEntry>();
            folderEntry.GatherAllAssets(assets, false, true, true);
            List<string> folderAssetNames = new List<string>();
            foreach (AddressableAssetEntry asset in assets)
            {
                folderAssetNames.Add(asset.AssetPath);
            }
            return folderAssetNames;
        }

        private static void ParseBundleMapping(AddressableAssetGroup group, string[] assetNamesArray, string bundleName, ref ResourceMapping mainGroupResouceMapping, ref Dictionary<string, ResourceMapping> groupId2subGroupResouceMappingDict)
        {
            string groupId = group.GetSchema<BoquAssetGroupSchema>().GroupId;
            if (groupId == "0")
            {
                mainGroupResouceMapping.bundleMapping[bundleName] = assetNamesArray;
            }
            else
            {
                if (!groupId2subGroupResouceMappingDict.ContainsKey(groupId))
                {
                    ResourceMapping resourceMapping = new ResourceMapping(new AssetMappingDictionary(), new BundleMappingDictionary());
                    resourceMapping.Validate();
                    groupId2subGroupResouceMappingDict[groupId] = resourceMapping;
                }
                groupId2subGroupResouceMappingDict[groupId].bundleMapping[bundleName] = assetNamesArray;
            }
        }

        private static bool IsEntryFolder(AddressableAssetEntry entry)
        {
            return !Path.HasExtension(entry.AssetPath);
        }
        private static void GenerateBuildContentPerGroup(AddressableAssetGroup group, ref List<AssetBundleBuild> buildMap, ref Dictionary<string, string> bundleToAssetGroup,
            ref ResourceMapping mainGroupResouceMapping, ref Dictionary<string, ResourceMapping> groupId2subGroupResourceMappingDict, ref Dictionary<string, string> bundleName2GroupId)
        {
            BoquAssetGroupSchema groupSchema = group.GetSchema<BoquAssetGroupSchema>();
            BundlePackingMode packingMode = groupSchema.BundleMode;
            string groupName = group.Name;
            var entries = group.entries;

            if (packingMode == BundlePackingMode.PackTogether)
            {
                AssetBundleBuild assetBundleBuild = new AssetBundleBuild();
                string bundleName = groupName.ToLower() + AddressableAssetSettings.kAssetbundleSuffix;
                bundleToAssetGroup.Add(bundleName, group.Guid);
                bundleName2GroupId.Add(bundleName, groupSchema.GroupId);
                List<string> assetNames = new List<string>();
                foreach (var entry in entries)
                {
                    if (IsEntryFolder(entry))
                    {
                        assetNames.AddRange(GetAssetNamesInFolderEntry(entry));
                    }
                    else
                    {
                        assetNames.Add(entry.AssetPath);
                    }
                }
                string[] assetNamesArray = assetNames.ToArray();
                assetBundleBuild.assetBundleName = bundleName;
                assetBundleBuild.assetNames = assetNamesArray;
                buildMap.Add(assetBundleBuild);
                ParseBundleMapping(group, assetNamesArray, bundleName, ref mainGroupResouceMapping, ref groupId2subGroupResourceMappingDict);
            }
            else /*if(packingMode == BundlePackingMode.PackSeparately)*/
            {
                List<AssetBundleBuild> assetBundleBuildList = new List<AssetBundleBuild>();
                foreach (var entry in entries)
                {
                    var assetBundleBuild = new AssetBundleBuild();
                    string bundleName = groupName + "_" + entry.MainAsset.name.ToLower() + AddressableAssetSettings.kAssetbundleSuffix;
                    if (bundleToAssetGroup.ContainsKey(bundleName))
                    {
                        bundleName = groupName + "_" + entry.MainAsset.name.ToLower() + bundleName.GetHashCode() +
                                     AddressableAssetSettings.kAssetbundleSuffix;
                    }
                    bundleToAssetGroup.Add(bundleName, group.Guid);
                    bundleName2GroupId.Add(bundleName, groupSchema.GroupId);
                    string[] assetNamesArray;
                    if (IsEntryFolder(entry))
                    {
                        assetNamesArray = GetAssetNamesInFolderEntry(entry).ToArray();
                    }
                    else
                    {
                        assetNamesArray = new string[] { entry.AssetPath };
                    }
                    assetBundleBuild.assetBundleName = bundleName;
                    assetBundleBuild.assetNames = assetNamesArray;
                    assetBundleBuildList.Add(assetBundleBuild);
                    ParseBundleMapping(group, assetNamesArray, bundleName, ref mainGroupResouceMapping, ref groupId2subGroupResourceMappingDict);
                }
                buildMap.AddRange(assetBundleBuildList);
            }
        }
        private static string GetOutputPath()
        {
            return Application.dataPath.Substring(0, Application.dataPath.Length - 6) + AddressablesConfig.kAssetbundleOutputPath + "/" + GameUtils.GetPlatformName();
        }

        private static string GetClientDataPath()
        {
            return Application.dataPath.Substring(0, Application.dataPath.Length - 6) + AddressableAssetSettings.kClientDataOutputPath + "/" + AddressablesConfig.kAssetbundleOutputPath + "/" + GameUtils.GetPlatformName();
        }

        private static string GetServerDataPath()
        {
            return Application.dataPath.Substring(0, Application.dataPath.Length - 6) + AddressableAssetSettings.kServerDataOutputPath + "/" + AddressablesConfig.kAssetbundleOutputPath + "/" + GameUtils.GetPlatformName();
        }

        private static void ParseCatalog(ref MainCatalog mainCatalog, AddressableAssetGroup assetGroup, IBundleBuildResults bundleBuildResults, ref Dictionary<string, Hash128> groupId2Hash128Map,
            ref Dictionary<string, SubCatalog> groupId2SubCatalogMap, Dictionary<string, string> bundleToAssetGroup, ref Dictionary<string, bool> groupId2IsLocalMap,
            Dictionary<string, string> bundleName2GroupId, ref Dictionary<string, BundleInfo> bundleName2BundleInfo)
        {
            Dictionary<string, BundleDetails> bundleName2bundleDetailsMap = bundleBuildResults.BundleInfos;
            Dictionary<string, BundleDetails> bundleName2BundleDetialsMapInGroup = new Dictionary<string, BundleDetails>();
            foreach (var entry in bundleName2bundleDetailsMap)
            {
                string bundleName = entry.Key;
                if (bundleToAssetGroup[bundleName] == assetGroup.Guid)
                {
                    bundleName2BundleDetialsMapInGroup.Add(bundleName, entry.Value);
                }
            }
            var groupSchema = assetGroup.GetSchema<BoquAssetGroupSchema>();
            string groupId = groupSchema.GroupId;
            var loadMode = groupSchema.LoadMode;

            if (!groupId2IsLocalMap.ContainsKey(groupId))
            {
                groupId2IsLocalMap.Add(groupId, loadMode == BundleLoadMode.Local);
            }
            else if (groupId2IsLocalMap[groupId] && loadMode == BundleLoadMode.Remote)
            {
                groupId2IsLocalMap[groupId] = false;
            }


            if (groupId == "0")
            {
                foreach (var entry in bundleName2BundleDetialsMapInGroup)
                {
                    string bundleName = entry.Key;
                    BundleDetails bundleDetails = entry.Value;
                    FileInfo fileInfo = new FileInfo(bundleDetails.FileName);
                    Hash128 hash = bundleDetails.Hash;

                    string[] dependencies = bundleDetails.Dependencies;
                    int len = dependencies.Length;
                    DependencyBundle[] depBundles = new DependencyBundle[len];
                    for (int i = 0; i < len; i++)
                    {
                        depBundles[i] = new DependencyBundle(dependencies[i], bundleName2GroupId[dependencies[i]]);
                    }

                    if (mainCatalog.MainBundleInfoMap.ContainsKey(bundleName))
                    {
                        UnityEngine.Debug.LogErrorFormat("duplicated assetbundle name:[{0}] !", bundleName);
                    }
                    BundleInfo bundleInfo = new BundleInfo(hash.ToString(), fileInfo.Length, loadMode == BundleLoadMode.Local ? ChangeState.Uptodate : ChangeState.None, loadMode == BundleLoadMode.Local ? BundleLocation.InPackage : BundleLocation.Remote, depBundles);
                    mainCatalog.MainBundleInfoMap[bundleName] = bundleInfo;
                    bundleName2BundleInfo.Add(bundleName, bundleInfo);
                }
            }
            else
            {
                foreach (var entry in bundleName2BundleDetialsMapInGroup)
                {
                    string bundleName = entry.Key;
                    BundleDetails bundleDetails = entry.Value;
                    FileInfo fileInfo = new FileInfo(bundleDetails.FileName);
                    Hash128 hash = bundleDetails.Hash;

                    string[] dependencies = bundleDetails.Dependencies;
                    int len = dependencies.Length;
                    DependencyBundle[] depBundles = new DependencyBundle[len];
                    for (int i = 0; i < len; i++)
                    {
                        depBundles[i] = new DependencyBundle(dependencies[i], bundleName2GroupId[dependencies[i]]);
                    }

                    //deal with SubCatalog
                    if (!groupId2SubCatalogMap.ContainsKey(groupId))
                    {
                        SubCatalog subCatalog = new SubCatalog(new BundleInfoDictionary());
                        groupId2SubCatalogMap[groupId] = subCatalog;
                    }
                    if (groupId2SubCatalogMap[groupId].bundleInfoMap.ContainsKey(bundleName))
                    {
                        UnityEngine.Debug.LogErrorFormat("duplicated assetbundle name:[{0}] !", bundleName);
                    }
                    BundleInfo bundleInfo = new BundleInfo(hash.ToString(), fileInfo.Length, loadMode == BundleLoadMode.Local ? ChangeState.Uptodate : ChangeState.None, loadMode == BundleLoadMode.Local ? BundleLocation.InPackage : BundleLocation.Remote, depBundles);
                    groupId2SubCatalogMap[groupId].bundleInfoMap[bundleName] = bundleInfo;
                    bundleName2BundleInfo.Add(bundleName, bundleInfo);

                    //deal with none-zero group's hash code.
                    if (!groupId2Hash128Map.ContainsKey(groupId))
                    {
                        groupId2Hash128Map[groupId] = new Hash128();
                    }
                    Hash128 currentRawHash = groupId2Hash128Map[groupId];
                    HashUtilities.AppendHash(ref hash, ref currentRawHash);
                    //currentRawHash += hash.ToString();
                    groupId2Hash128Map[groupId] = currentRawHash;
                }
            }
        }
        public static void BuildAssetBundle(AddressableAssetSettings settings)
        {
            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            ResourceMapping mainGroupResourceMapping = new ResourceMapping(new AssetMappingDictionary(), new BundleMappingDictionary());
            mainGroupResourceMapping.Validate();
            Dictionary<string, ResourceMapping> groupId2subGroupResourceMappingDict = new Dictionary<string, ResourceMapping>();
            //Build AssetBundle Start
            List<AssetBundleBuild> buildMap = new List<AssetBundleBuild>();
            Dictionary<string, string> bundleToAssetGroup = new Dictionary<string, string>();
            Dictionary<string, string> bundleName2GroupId = new Dictionary<string, string>();
            foreach (AddressableAssetGroup group in settings.groups)
            {
                GenerateBuildContentPerGroup(group, ref buildMap, ref bundleToAssetGroup, ref mainGroupResourceMapping, ref groupId2subGroupResourceMappingDict, ref bundleName2GroupId);
            }

            Dictionary<string, string> asset2Bundle = new Dictionary<string, string>();
            foreach (var bundleBuild in buildMap)
            {
                foreach (var asset in bundleBuild.assetNames)
                {
                    if (asset2Bundle.ContainsKey(asset))
                    {
                        UnityEngine.Debug.LogError($"same asset in multiple bundles: {asset} LastBundle: {asset2Bundle[asset]}   CurrBundle: {bundleBuild.assetBundleName}");
                        return;
                    }
                    asset2Bundle[asset] = bundleBuild.assetBundleName;
                }
            }

            string outputPath = GetOutputPath();
            if (Directory.Exists(outputPath))
            {
                GameUtils.DeleteDirectory(outputPath);
            }
            Directory.CreateDirectory(outputPath);
            var Settings = AddressablesUtils.GetSettings();
#if UNITY_ANDROID
            var buildParams = new BoquBundleBuildParameters(Settings, bundleToAssetGroup, BuildTarget.Android, BuildTargetGroup.Android, outputPath);
#elif UNITY_IOS
            var buildParams = new BoquBundleBuildParameters(Settings, bundleToAssetGroup, BuildTarget.iOS, BuildTargetGroup.iOS, outputPath);
#elif UNITY_WEBGL
            var buildParams = new BoquBundleBuildParameters(Settings, bundleToAssetGroup, BuildTarget.WebGL, BuildTargetGroup.WebGL, outputPath);
#endif

            ReturnCode exitCode = ContentPipeline.BuildAssetBundles(buildParams, new BundleBuildContent(buildMap.ToArray()), out IBundleBuildResults bundleBuildResults);
            if (exitCode < ReturnCode.Success)
            {
                UnityEngine.Debug.LogErrorFormat("SBP Error: {0}", exitCode);
            }
            //Build AssetBundle End



            //Generate MainCatalog and SubCatalogs Start
            Dictionary<string, Hash128> groupId2Hash128Map = new Dictionary<string, Hash128>();
            Dictionary<string, SubCatalog> groupId2SubCatalogMap = new Dictionary<string, SubCatalog>();
            MainCatalog mainCatalog = new MainCatalog(new BundleInfoDictionary(), new AssetGroupInfoDictionary());
            Dictionary<string, bool> groupId2IsLocalMap = new Dictionary<string, bool>();
            Dictionary<string, BundleInfo> bundleName2BundleInfo = new Dictionary<string, BundleInfo>();
            foreach (AddressableAssetGroup group in settings.groups)
            {
                ParseCatalog(ref mainCatalog, group, bundleBuildResults, ref groupId2Hash128Map, ref groupId2SubCatalogMap, bundleToAssetGroup, ref groupId2IsLocalMap, bundleName2GroupId, ref bundleName2BundleInfo);
            }
            foreach (var groupId in groupId2Hash128Map.Keys)
            {
                Hash128 rawHash = groupId2Hash128Map[groupId];

                AssetGroupInfo groupInfo = new AssetGroupInfo(rawHash.ToString(), groupId2IsLocalMap[groupId] ? ChangeState.Uptodate : ChangeState.None);
                mainCatalog.additionalAssetGroupInfoMap[groupId] = groupInfo;
            }
            //Generate MainCatalog and SubCatalogs End


            //Generate ResouceMapping Start
            string mainResourceMappingOutputPath = Path.Combine(GetOutputPath(), AddressablesConfig.kMainResourceMappingName);
            ParseAssetMapping(ref mainGroupResourceMapping);
#if UNITY_WEBGL
            // Reset MainCatalog and MainGroupMapping Start, BundleName Append hashCode
            Dictionary<string, string> replaceBundleNames = new Dictionary<string, string>();
            BundleInfoDictionary bundleInfoDic = new BundleInfoDictionary();
            AssetMappingDictionary assetMappingDic = new AssetMappingDictionary();
            BundleMappingDictionary bundleMappingDic = new BundleMappingDictionary();
            // MainCatalog
            foreach (var item in mainCatalog.MainBundleInfoMap)
            {
                string bundleName = item.Key;
                BundleInfo info = item.Value;
                string replaceToName = SplicBundleNameAndHash(bundleName, info.hashCode);
                replaceBundleNames.Add(bundleName, replaceToName);
                bundleInfoDic.Add(replaceToName, info);
            }
            // MainCatalog Depandencies
            foreach (var item in mainCatalog.MainBundleInfoMap)
            {
                string bundleName = item.Key;
                BundleInfo info = item.Value;
                if (info.dependencies.Length > 0)
                {
                    for (int i = 0; i < info.dependencies.Length; i++)
                    {
                        string tmpBundleName = null;
                        if (replaceBundleNames.TryGetValue(info.dependencies[i].bundleName, out tmpBundleName))
                        {
                            info.dependencies[i].bundleName = tmpBundleName;
                        }
                    }
                }
            }
            // MainAssetMapping
            foreach (var item in mainGroupResourceMapping.bundleMapping)
            {
                string bundleName = item.Key;
                if (replaceBundleNames.ContainsKey(bundleName))
                {
                    bundleMappingDic.Add(replaceBundleNames[bundleName], item.Value);
                }
            }
            foreach (var item in mainGroupResourceMapping.assetMapping)
            {
                string bundleName = item.Value;
                if (replaceBundleNames.ContainsKey(bundleName))
                {
                    assetMappingDic.Add(item.Key, replaceBundleNames[bundleName]);
                }
            }

            mainCatalog.MainBundleInfoMap = bundleInfoDic;
            mainGroupResourceMapping.bundleMapping = bundleMappingDic;
            mainGroupResourceMapping.assetMapping = assetMappingDic;
#endif
            ObjectSerializer.Serialize(mainGroupResourceMapping, mainResourceMappingOutputPath);
            byte[] mainResourceMappingBytes = GameUtils.SafeReadAllBytes(mainResourceMappingOutputPath);
            Hash128 mainResourceMappingHash = new Hash128();
            HashUtilities.ComputeHash128(mainResourceMappingBytes, ref mainResourceMappingHash);
            mainCatalog.SetMappingFileHash(mainResourceMappingHash.ToString());
            foreach (var entry in groupId2subGroupResourceMappingDict)
            {
                string groupId = entry.Key;
                ResourceMapping resouceMapping = entry.Value;
                ParseAssetMapping(ref resouceMapping);
                string subResourceMappingPath = Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubResourceMappingNamePattern, groupId));
                SubCatalog subCatalog = groupId2SubCatalogMap[groupId];

#if UNITY_WEBGL
                // Reset SubCatalog and SubGroupMapping Start, BundleName Append hashCode
                BundleInfoDictionary subBundleInfoDic = new BundleInfoDictionary();
                AssetMappingDictionary subAssetMappingDic = new AssetMappingDictionary();
                BundleMappingDictionary subBundleMappingDic = new BundleMappingDictionary();
                // SubCatalog
                foreach (var item in subCatalog.bundleInfoMap)
                {
                    string bundleName = item.Key;
                    BundleInfo info = item.Value;
                    string replaceToName = SplicBundleNameAndHash(bundleName, info.hashCode);
                    replaceBundleNames.Add(bundleName, replaceToName);
                    subBundleInfoDic.Add(replaceToName, info);
                }
                // SubCatalog Dependencies
                foreach (var item in subCatalog.bundleInfoMap)
                {
                    string bundleName = item.Key;
                    BundleInfo info = item.Value;
                    if (info.dependencies.Length > 0)
                    {
                        for (int i = 0; i < info.dependencies.Length; i++)
                        {
                            string tmpBundleName = null;
                            if (replaceBundleNames.TryGetValue(info.dependencies[i].bundleName, out tmpBundleName))
                            {
                                info.dependencies[i].bundleName = tmpBundleName;
                            }
                        }
                    }
                }
                // SubAssetMapping
                foreach (var item in resouceMapping.bundleMapping)
                {
                    string bundleName = item.Key;
                    if (replaceBundleNames.ContainsKey(bundleName))
                    {
                        subBundleMappingDic.Add(replaceBundleNames[bundleName], item.Value);
                    }
                }
                foreach (var item in resouceMapping.assetMapping)
                {
                    string bundleName = item.Value;
                    if (replaceBundleNames.ContainsKey(bundleName))
                    {
                        subAssetMappingDic.Add(item.Key, replaceBundleNames[bundleName]);
                    }
                }

                subCatalog.bundleInfoMap = subBundleInfoDic;
                resouceMapping.bundleMapping = subBundleMappingDic;
                resouceMapping.assetMapping = subAssetMappingDic;
#endif
                ObjectSerializer.Serialize(resouceMapping, subResourceMappingPath);
                byte[] subResourceMappingBytes = GameUtils.SafeReadAllBytes(subResourceMappingPath);
                Hash128 subResourceMappingHash = new Hash128();
                HashUtilities.ComputeHash128(subResourceMappingBytes, ref subResourceMappingHash);
                subCatalog.SetMappingFileHash(subResourceMappingHash.ToString());
            }
            //Generate ResouceMapping End

            GenerateCrc(bundleName2BundleInfo);

            //Serialize MainCatalog and SubCatalogs Start
            string mainCatalogOutputPath = Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogName);
            ObjectSerializer.Serialize(mainCatalog, mainCatalogOutputPath);
            FileHashSerializer.Serialize(mainCatalogOutputPath, Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogHashName));
            foreach (var entry in groupId2SubCatalogMap)
            {
                string groupId = entry.Key;
                SubCatalog subCatalog = entry.Value;
                ObjectSerializer.Serialize(subCatalog, Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubCatalogNamePattern, groupId)));
            }
            //Serialize MainCatalog and SubCatalogs End

#if UNITY_WEBGL
            CopyResourcesToClientAndServerFolder(bundleBuildResults, settings, bundleToAssetGroup, replaceBundleNames);
#else
            CopyResourcesToClientAndServerFolder(bundleBuildResults, settings, bundleToAssetGroup);
#endif


            stopWatch.Stop();
            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}", ts.Hours, ts.Minutes, ts.Seconds, ts.Milliseconds / 10);
            UnityEngine.Debug.LogFormat("build assetbundles using:  {0}", elapsedTime);
            AssetDatabase.Refresh();
        }

        private static void GenerateCrc(Dictionary<string, BundleInfo> bundleName2BundleInfo)
        {
            string bundleBasePath = GetOutputPath();
            string[] bundlePaths = Directory.GetFiles(bundleBasePath, "*.bundle");
            for (int i = 0; i < bundlePaths.Length; i++)
            {
                string bundlePath = bundlePaths[i];
                FileInfo fileInfo = new FileInfo(bundlePath);
                string bundleName = fileInfo.Name;
                BundleInfo bundleInfo = bundleName2BundleInfo[bundleName];
                byte[] bundleData = File.ReadAllBytes(bundlePath);
                uint bundleCrc = Crc32Algorithm.Compute(bundleData);
                bundleInfo.crc = bundleCrc;
                FileStream fs = File.OpenWrite(bundlePath);
                fs.Write(bundleData, 0, bundleData.Length);
                fs.Close();
            }
        }

        private static void CopyResourcesToClientAndServerFolderPerGroup(AddressableAssetGroup assetGroup, IBundleBuildResults bundleBuildResults, Dictionary<string, string> bundleToAssetGroup, string clientDataPath, 
            string serverDataPath, ref HashSet<string> processedGroupSet, Dictionary<string, string> replaceBundleNames = null)
        {
            Dictionary<string, BundleDetails> bundleName2bundleDetailsMap = bundleBuildResults.BundleInfos;
            Dictionary<string, BundleDetails> bundleName2BundleDetialsMapInGroup = new Dictionary<string, BundleDetails>();
            foreach (var entry in bundleName2bundleDetailsMap)
            {
                string bundleName = entry.Key;
                if (bundleToAssetGroup[bundleName] == assetGroup.Guid)
                {
                    bundleName2BundleDetialsMapInGroup.Add(bundleName, entry.Value);
                }
            }
            BoquAssetGroupSchema groupSchema = assetGroup.GetSchema<BoquAssetGroupSchema>();
            BundleLoadMode loadMode = groupSchema.LoadMode;
            string destinationPath = loadMode == BundleLoadMode.Local ? clientDataPath : serverDataPath;
            foreach (var bundleInfo in bundleName2BundleDetialsMapInGroup)
            {
                string bundleName = bundleInfo.Key;
                BundleDetails bundleDetails = bundleInfo.Value;
                string fileName = bundleDetails.FileName;
                try
                {
#if UNITY_WEBGL
                    //UnityEngine.Debug.Log(string.Format("Copy File Or Directory Follow Symlinks : {0}, {1}, {2} ", fileName, destinationPath, destinationPath + "/" + bundleName));

                    if (replaceBundleNames != null)
                    {
                        if (replaceBundleNames.ContainsKey(bundleName))
                        {
                            string replaceName = replaceBundleNames[bundleName];
                            FileUtil.CopyFileOrDirectoryFollowSymlinks(fileName, destinationPath + "/" + replaceName);
                            if (loadMode == BundleLoadMode.Local)
                            {
                                FileUtil.CopyFileOrDirectoryFollowSymlinks(fileName, serverDataPath + "/" + replaceName);
                            }
                        }
                    }
#else
                    FileUtil.CopyFileOrDirectoryFollowSymlinks(fileName, destinationPath + "/" + bundleName);
                    if (loadMode == BundleLoadMode.Local)
                    {
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(fileName, serverDataPath + "/" + bundleName);
                    }
#endif
                }
                catch (Exception e)
                {
                    UnityEngine.Debug.LogErrorFormat("Failed to copy files : {0}, {1}", e.Message, e.StackTrace);
                }
            }
            string groupId = groupSchema.GroupId;
            if (processedGroupSet.Contains(groupId))
            {
                return;
            }
#if UNITY_WEBGL
            destinationPath = $"{destinationPath}/{AddressablesConfig.WebVersion}";
            serverDataPath = $"{serverDataPath}/{AddressablesConfig.WebVersion}";
#endif
            if (groupId == "0")
            {
                try
                {

                    FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogName), Path.Combine(destinationPath, AddressablesConfig.kMainCatalogName));
                    FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogHashName), Path.Combine(destinationPath, AddressablesConfig.kMainCatalogHashName));
                    FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainResourceMappingName), Path.Combine(destinationPath, AddressablesConfig.kMainResourceMappingName));

                    if (loadMode == BundleLoadMode.Local)
                    {
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogName), Path.Combine(serverDataPath, AddressablesConfig.kMainCatalogName));
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainCatalogHashName), Path.Combine(serverDataPath, AddressablesConfig.kMainCatalogHashName));
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), AddressablesConfig.kMainResourceMappingName), Path.Combine(serverDataPath, AddressablesConfig.kMainResourceMappingName));
                    }
                }
                catch (Exception e)
                {
                    UnityEngine.Debug.LogErrorFormat("Failed to copy files : {0}, {1}", e.Message, e.StackTrace);
                }
            }
            else
            {
                try
                {
                    FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubResourceMappingNamePattern, groupId)), Path.Combine(destinationPath, string.Format(AddressablesConfig.kSubResourceMappingNamePattern, groupId)));
                    FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubCatalogNamePattern, groupId)), Path.Combine(destinationPath, string.Format(AddressablesConfig.kSubCatalogNamePattern, groupId)));

                    if (loadMode == BundleLoadMode.Local)
                    {
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubResourceMappingNamePattern, groupId)), Path.Combine(serverDataPath, string.Format(AddressablesConfig.kSubResourceMappingNamePattern, groupId)));
                        FileUtil.CopyFileOrDirectoryFollowSymlinks(Path.Combine(GetOutputPath(), string.Format(AddressablesConfig.kSubCatalogNamePattern, groupId)), Path.Combine(serverDataPath, string.Format(AddressablesConfig.kSubCatalogNamePattern, groupId)));
                    }

                }
                catch (Exception e)
                {
                    UnityEngine.Debug.LogErrorFormat("Failed to copy files : {0}, {1}", e.Message, e.StackTrace);
                }
            }
            processedGroupSet.Add(groupId);
        }

        private static void CopyResourcesToClientAndServerFolder(IBundleBuildResults bundleBuildResults, AddressableAssetSettings settings, Dictionary<string, string> bundleToAssetGroup, Dictionary<string, string> replaceBundleNames = null)
        {
            string clientDataPath = GetClientDataPath();
            string serverDataPath = GetServerDataPath();
            if (Directory.Exists(clientDataPath))
            {
                GameUtils.DeleteDirectory(clientDataPath);
            }
            if (Directory.Exists(serverDataPath))
            {
                GameUtils.DeleteDirectory(serverDataPath);
            }
            Directory.CreateDirectory(clientDataPath);
            Directory.CreateDirectory(serverDataPath);
#if UNITY_WEBGL
            Directory.CreateDirectory($"{clientDataPath}/{AddressablesConfig.WebVersion}/");
            Directory.CreateDirectory($"{serverDataPath}/{AddressablesConfig.WebVersion}/");
#endif
            HashSet<string> processedGroupSet = new HashSet<string>();
            foreach (AddressableAssetGroup group in settings.groups)
            {
                CopyResourcesToClientAndServerFolderPerGroup(group, bundleBuildResults, bundleToAssetGroup, clientDataPath, serverDataPath, ref processedGroupSet, replaceBundleNames);
            }
        }

        public static void CopyClientDataToStreamingAssetsFolder()
        {
            EditorUtility.DisplayProgressBar("Copy Client Data to StreamAssetsFolder", "copying...", 0f);
            string clientDataPath = GetClientDataPath();
            string rootPath = Application.streamingAssetsPath + "/" + AddressablesConfig.kAssetbundleOutputPath;
            string destinationPath = rootPath + "/" + GameUtils.GetPlatformName();
            GameUtils.SafeClearDir(rootPath);
            try
            {
                FileUtil.CopyFileOrDirectoryFollowSymlinks(clientDataPath, destinationPath);
            }
            catch (Exception ex)
            {
                UnityEngine.Debug.LogError("failed to copy client data to streamingasset folder : " + ex);
                return;
            }
            EditorUtility.DisplayProgressBar("Copy Client Data to StreamAssetsFolder", "copying...", 1f);
            EditorUtility.ClearProgressBar();
            AssetDatabase.Refresh();
        }

        /// <summary>
        /// 复制带有game id 子文件夹目录到Unity的 StreamingAsset； 到webgl项目的 StreamingAsset
        /// </summary>
        public static void CopyClientDataToStreamingAssetsGameIdFolder(string gameId)
        {
            EditorUtility.DisplayProgressBar("Copy Client Data to StreamAssetsFolder", "copying...", 0f);
            string clientDataPath = GetClientDataPath();
            string rootPath = Application.streamingAssetsPath + "/" + AddressablesConfig.kAssetbundleOutputPath + "/" + GameUtils.GetPlatformName();
            string destinationPath = rootPath + "/" + gameId;

            string clientGameIdDataPath = $"{clientDataPath}/{gameId}";
            if (Directory.Exists(clientGameIdDataPath))
            {
                GameUtils.DeleteDirectory(clientGameIdDataPath);
            }

            string webglLocalResPath = Application.dataPath.Substring(0, Application.dataPath.Length - 6) + "WebGL/FactoryId1/WebGL/StreamingAssets" + "/" + AddressablesConfig.kAssetbundleOutputPath + "/" + GameUtils.GetPlatformName();
            string gamePath = webglLocalResPath + "/" + gameId;

            if (Directory.Exists(gamePath))
            {
                GameUtils.DeleteDirectory(gamePath);
            }
            //Directory.CreateDirectory(gamePath);

            try
            {
                // 这个API会自动创建 folder，不用提前 CreateDirectory
                FileUtil.CopyFileOrDirectoryFollowSymlinks(clientDataPath, gamePath);
            }
            catch (Exception ex)
            {
                UnityEngine.Debug.LogError("failed to copy client data to streamingasset folder : " + ex);
                return;
            }

            GameUtils.SafeClearDir(rootPath);
            try
            {
                FileUtil.CopyFileOrDirectoryFollowSymlinks(clientDataPath, destinationPath);
            }
            catch (Exception ex)
            {
                UnityEngine.Debug.LogError("failed to copy client data to streamingasset folder : " + ex);
                return;
            }
            EditorUtility.DisplayProgressBar("Copy Client Data to StreamAssetsFolder", "copying...", 1f);
            EditorUtility.ClearProgressBar();
            AssetDatabase.Refresh();
        }

        public static void CopyServerDataToStreamingAssetsFolder()
        {
            EditorUtility.DisplayProgressBar("Copy Server Data to StreamAssetsFolder", "copying...", 0f);
            string serverDataPath = GetServerDataPath();
            string rootPath = Application.streamingAssetsPath + "/" + AddressablesConfig.kAssetbundleOutputPath;
            string destinationPath = rootPath + "/" + GameUtils.GetPlatformName();
            GameUtils.SafeClearDir(rootPath);
            try
            {
                FileUtil.CopyFileOrDirectoryFollowSymlinks(serverDataPath, destinationPath);
            }
            catch (Exception ex)
            {
                UnityEngine.Debug.LogError("failed to copy server data to streamingasset folder : " + ex);
                return;
            }
            EditorUtility.DisplayProgressBar("Copy Server Data to StreamAssetsFolder", "copying...", 1f);
            EditorUtility.ClearProgressBar();
            AssetDatabase.Refresh();
        }

        private static void ParseAssetMapping(ref ResourceMapping resourceMapping)
        {
            BundleMappingDictionary bundleMappingDict = resourceMapping.bundleMapping;
            foreach (var entry in bundleMappingDict)
            {
                string bundleName = entry.Key;
                string[] assetNames = entry.Value;
                foreach (string assetName in assetNames)
                {
                    if (resourceMapping.assetMapping.ContainsKey(assetName))
                    {
                        UnityEngine.Debug.LogErrorFormat("Duplicate asset name found: {0}", assetName);
                    }
                    resourceMapping.assetMapping[assetName] = bundleName;
                }
            }
        }

        private static string SplicBundleNameAndHash(string bundleName, string hash)
        {
            return bundleName.Insert(bundleName.IndexOf(".bundle"), $"_{hash}");
        }
    }

}
