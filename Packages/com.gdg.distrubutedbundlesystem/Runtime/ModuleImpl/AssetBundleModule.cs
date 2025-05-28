using Game.Addresssables.Common;
using Game.Addresssables.Config;
using Game.Addresssables.Deserializer;
using Game.Addresssables.Module;
using Game.Addresssables.Serializer;
using Game.Addresssables.Type;
using Game.Addresssables.Utils;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using UnityEngine;
using UnityEngine.Networking;
using System.Collections;

namespace Game.Addresssables.ModuleImpl
{
    public class AssetBundleModule : BaseModule, IAssetBundleModule
    {
        /// <summary>
        /// bundle base path in streamingassets path
        /// </summary>
        static string m_BundleBasePathC;
        public string BundleBasePathC => m_BundleBasePathC;
        /// <summary>
        /// bundle base path in persistent path
        /// </summary>
        static string m_BundleBasePathP;
        public string BundleBasePathP => m_BundleBasePathP;
        /// <summary>
        /// bundle base path in remote resource server
        /// </summary>
        static string m_BundleBasePathR;
        public string BundleBasePathR => m_BundleBasePathR;

        /// <summary>
        /// main catalog hash in streamingassets path
        /// </summary>
        static string m_MainCatalogHashPathC;
        /// <summary>
        /// main catalog hash in persistent path
        /// </summary>
        static string m_MainCatalogHashPathP;
        /// <summary>
        /// main catalog hash in remote resource server path
        /// </summary>
        static string m_MainCatalogHashPathR;

        /// <summary>
        /// main catalog data in streamingassets path
        /// </summary>
        static string m_MainCatalogDataPathC;
        /// <summary>
        /// main catalog data in persistent path
        /// </summary>
        static string m_MainCatalogDataPathP;
        /// <summary>
        /// main catalog data in remote resource server path
        /// </summary>
        static string m_MainCatalogDataPathR;

        /// <summary>
        /// sub catalog data path pattern in streamingassets path
        /// </summary>
        static string m_SubCatalogDataPathPatternC;
        /// <summary>
        /// sub catalog data path pattern in persistent path
        /// </summary>
        static string m_SubCatalogDataPathPatternP;
        /// <summary>
        /// sub catalog data path pattern in remote resource server path
        /// </summary>
        static string m_SubCatalogDataPathPatternR;

        static string m_MainGroupResourceMappingPathC;
        static string m_MainGroupResourceMappingPathP;
        static string m_MainGroupResourceMappingPathR;

        static string m_SubGroupResourceMappingPathPatternC;
        static string m_SubGroupResourceMappingPathPatternP;
        static string m_SubGroupResourceMappingPathPatternR;



        string m_MainCatalogHash;
        bool m_IsMainCatalogHashInCache;
        bool m_IsMainCatalogInCache;

        MainCatalog m_MainCatalogRemote;
        public MainCatalog MainCatalogRemote
        {
            get
            {
                if (m_MainCatalogRemote != null)
                {
                    return m_MainCatalogRemote;
                }
                throw new Exception("Catalog is invalid!");
            }
            set
            {
                m_MainCatalogRemote = value;
            }
        }

        MainCatalog m_MainCatalogClient;
        public MainCatalog MainCatalogClient
        {
            get
            {
                if (m_MainCatalogClient != null)
                {
                    return m_MainCatalogClient;
                }
                throw new Exception("Catalog is invalid!");
            }
            set
            {
                m_MainCatalogClient = value;
            }
        }

        public AssetMappingDictionary MainGroupAssetMapping
        {
            get
            {
                return MainGroupResouceMapping.assetMapping;
            }
        }
        public BundleMappingDictionary MainGroupBundleMapping
        {
            get
            {
                return MainGroupResouceMapping.bundleMapping;
            }
        }

        private ResourceMapping m_MainGroupResourceMapping;

        public ResourceMapping MainGroupResouceMapping
        {
            get
            {
                if (m_MainGroupResourceMapping.IsValid())
                {
                    return m_MainGroupResourceMapping;
                }
                throw new Exception("main group resource mapping is invalid!");
            }
            set
            {
                m_MainGroupResourceMapping = value;
            }
        }

        public override void Init()
        {
            if (initialized)
            {
                return;
            }
            base.Init();
            m_BundleBasePathC = $"{Application.streamingAssetsPath}/{AddressablesConfig.kAssetbundleOutputPath}/{GameUtils.GetPlatformName()}/{AddressablesConfig.GameId}";
            m_BundleBasePathP = $"{Application.persistentDataPath}/{AddressablesConfig.kCachingRootPath}/{AddressablesConfig.kAssetbundleOutputPath}";
            m_BundleBasePathR = AddressablesConfig.ServerAddress;

            m_MainCatalogHashPathC = $"{m_BundleBasePathC}/{AddressablesConfig.kMainCatalogHashName}";
            m_MainCatalogHashPathP = $"{m_BundleBasePathP}/{AddressablesConfig.kMainCatalogHashName}";
            m_MainCatalogHashPathR = $"{m_BundleBasePathR}/{AddressablesConfig.kMainCatalogHashName}";

            m_MainCatalogDataPathC = $"{m_BundleBasePathC}/{AddressablesConfig.kMainCatalogName}";
            m_MainCatalogDataPathP = $"{m_BundleBasePathP}/{AddressablesConfig.kMainCatalogName}";
            m_MainCatalogDataPathR = $"{m_BundleBasePathR}/{AddressablesConfig.kMainCatalogName}";

            m_SubCatalogDataPathPatternC = $"{m_BundleBasePathC}/{AddressablesConfig.kSubCatalogNamePattern}";
            m_SubCatalogDataPathPatternP = $"{m_BundleBasePathP}/{AddressablesConfig.kSubCatalogNamePattern}";
            m_SubCatalogDataPathPatternR = $"{m_BundleBasePathR}/{AddressablesConfig.kSubCatalogNamePattern}";

            m_MainGroupResourceMappingPathC = $"{m_BundleBasePathC}/{AddressablesConfig.kMainResourceMappingName}";
            m_MainGroupResourceMappingPathP = $"{m_BundleBasePathP}/{AddressablesConfig.kMainResourceMappingName}";
            m_MainGroupResourceMappingPathR = $"{m_BundleBasePathR}/{AddressablesConfig.kMainResourceMappingName}";

            m_SubGroupResourceMappingPathPatternC = $"{m_BundleBasePathC}/{AddressablesConfig.kSubResourceMappingNamePattern}";
            m_SubGroupResourceMappingPathPatternP = $"{m_BundleBasePathP}/{AddressablesConfig.kSubResourceMappingNamePattern}";
            m_SubGroupResourceMappingPathPatternR = $"{m_BundleBasePathR}/{AddressablesConfig.kSubResourceMappingNamePattern}";

#if UNITY_WEBGL
            m_MainCatalogHashPathC = $"{m_BundleBasePathC}/{AddressablesConfig.WebVersion}/{AddressablesConfig.kMainCatalogHashName}";
            m_MainCatalogDataPathC = $"{m_BundleBasePathC}/{AddressablesConfig.WebVersion}/{AddressablesConfig.kMainCatalogName}";
            m_SubCatalogDataPathPatternC = $"{m_BundleBasePathC}/{AddressablesConfig.WebVersion}/{AddressablesConfig.kSubCatalogNamePattern}";
            m_MainGroupResourceMappingPathC = $"{m_BundleBasePathC}/{AddressablesConfig.WebVersion}/{AddressablesConfig.kMainResourceMappingName}";
            m_SubGroupResourceMappingPathPatternC = $"{m_BundleBasePathC}/{AddressablesConfig.WebVersion}/{AddressablesConfig.kSubResourceMappingNamePattern}";
            LoggerInternal.LogFormat("AssetBundle path : m_BundleBasePathC : " + m_BundleBasePathC);
            LoggerInternal.LogFormat("AssetBundle path : m_MainCatalogHashPathC : " + m_MainCatalogHashPathC);
            LoggerInternal.LogFormat("AssetBundle path : m_MainCatalogDataPathC : " + m_MainCatalogDataPathC);
            LoggerInternal.LogFormat("AssetBundle path : m_SubCatalogDataPathPatternC : " + m_SubCatalogDataPathPatternC == null ? m_SubCatalogDataPathPatternC : "");
            LoggerInternal.LogFormat("AssetBundle path : m_MainGroupResourceMappingPathC : " + m_MainGroupResourceMappingPathC == null ? m_SubCatalogDataPathPatternC : "");
            LoggerInternal.LogFormat("AssetBundle path : m_SubGroupResourceMappingPathPatternC : " + m_SubGroupResourceMappingPathPatternC == null ? m_SubCatalogDataPathPatternC : "");
#endif

            m_IsMainCatalogHashInCache = File.Exists(m_MainCatalogHashPathP);
            m_IsMainCatalogInCache = File.Exists(m_MainCatalogDataPathP);
        }
        public async UniTask<string> FetchRemoteCatalogHashAsync()
        {
            return await ResourceManager.DownloaderModule.DownloadText(m_MainCatalogHashPathR);
        }
        public async UniTask<bool> CheckIfMainCatalogChanged()
        {
            string mainCatalogClientHashPath = m_IsMainCatalogHashInCache ? m_MainCatalogHashPathP : m_MainCatalogHashPathC;
            string mainCatalogHashClient = await FileHashDeserializer.Deserialize(mainCatalogClientHashPath);
            LoggerInternal.LogFormat("main catalog file hash client side: {0}", mainCatalogHashClient);
            string mainCatalogHashServer = await ResourceManager.DownloaderModule.DownloadText(m_MainCatalogHashPathR);
            if (mainCatalogHashServer != null)
            {
                LoggerInternal.LogFormat("main catalog file hash server side: {0}", mainCatalogHashServer);
                m_MainCatalogHash = mainCatalogHashServer;
                return mainCatalogHashServer != mainCatalogHashClient;
            }
            else
            {
                LoggerInternal.LogWarning("failed to get maincatalog hash from server!");
                return false;
            }
        }

        public async UniTask<bool> CheckIfMainCatalogChanged(string serverCatalogHash)
        {
            string mainCatalogClientHashPath = m_IsMainCatalogHashInCache ? m_MainCatalogHashPathP : m_MainCatalogHashPathC;
            string mainCatalogHashClient = await FileHashDeserializer.Deserialize(mainCatalogClientHashPath);
            LoggerInternal.LogFormat("main catalog file hash client side: {0}", mainCatalogHashClient);
            if (serverCatalogHash != null)
            {
                LoggerInternal.LogFormat("main catalog file hash server side: {0}", serverCatalogHash);
                m_MainCatalogHash = serverCatalogHash;
                return serverCatalogHash != mainCatalogHashClient;
            }
            else
            {
                LoggerInternal.LogWarning("failed to get maincatalog hash from server!");
                return false;
            }
        }

        public void CacheMainCatalogHash(bool catalogHashChanged)
        {
            if (!catalogHashChanged && m_IsMainCatalogHashInCache)
            {
                return;
            }
            FileHashSerializer.Serialize(m_MainCatalogHash, m_MainCatalogHashPathP, false);
            m_IsMainCatalogHashInCache = true;
            LoggerInternal.Log("cached main catalog hash to persistant dir.");
        }

        public void CacheMainCatalog(MainCatalog mainCatalog)
        {
            if (mainCatalog != null)
            {
                ObjectSerializer.Serialize(mainCatalog, m_MainCatalogDataPathP);
                if (!m_IsMainCatalogInCache)
                {
                    m_IsMainCatalogInCache = true;
                }
                MainCatalogClient = mainCatalog;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="subCatalog"></param>
        /// <param name="groupId"></param>
        /// <param name="dirty">true: overrite client side catalog if exists. false: merge with client side </param>
        private void CacheSubCatalog(SubCatalog subCatalog, string groupId, bool dirty = true)
        {
            if (subCatalog == null)
            {
                LoggerInternal.LogWarningFormat("subcatalog for group[{0}] is null, please check your code!", groupId);
                return;
            }
            if (dirty)
            {
                ResourceProvider.CacheOrDirtySubCatalog(subCatalog, groupId);
                ObjectSerializer.Serialize(subCatalog, string.Format(m_SubCatalogDataPathPatternP, groupId));
            }
            else
            {
                LoadSubCatalogClientAsync(groupId, (subCatalogClient) =>
                    {
                        if (subCatalogClient == null)
                        {
                            CacheSubCatalog(subCatalog, groupId);
                        }
                        else
                        {
                            subCatalogClient.SetIsAllBundlesDownloaded(subCatalog.IsAllBundlesDownloaded());
                            foreach (var entry in subCatalog.bundleInfoMap)
                            {
                                string bundleName = entry.Key;
                                BundleInfo bundleInfo = entry.Value;
                                if (!subCatalogClient.bundleInfoMap.ContainsKey(bundleName))
                                {
                                    subCatalogClient.bundleInfoMap.Add(bundleName, bundleInfo);
                                }
                            }
                            CacheSubCatalog(subCatalogClient, groupId);
                        }
                    }
                );
            }
        }

        public async UniTask<bool> DownloadMainCatalog()
        {
            byte[] bytes = await ResourceManager.DownloaderModule.DownloadBytes(m_MainCatalogDataPathR);
            if (bytes != null)
            {
                m_MainCatalogRemote = ObjectDeserializer.DeserializeSync(bytes) as MainCatalog;
                return true;
            }
            else
            {
                LoggerInternal.LogWarning("failed to get maincatalog data from server!");
                m_MainCatalogRemote = null;
                return false;
            }
        }

        public async UniTask<bool> LoadMainGroupMappingFile()
        {
            if (File.Exists(m_MainGroupResourceMappingPathP))
            {
                MainGroupResouceMapping = await ObjectDeserializer.Deserialize(m_MainGroupResourceMappingPathP) as ResourceMapping;
            }
            else
            {
                MainGroupResouceMapping = await ObjectDeserializer.Deserialize(m_MainGroupResourceMappingPathC) as ResourceMapping;
            }
            return true;
        }


        private async UniTask<ResourceMapping> LoadSubGroupMappingFile(string groupId)
        {
            if (ResourceProvider.ProvideCachedResourceMapping(groupId, out ResourceMapping resMapping))
            {
                return resMapping;
            }
            string pathP = string.Format(m_SubGroupResourceMappingPathPatternP, groupId);
            resMapping = await ObjectDeserializer.Deserialize(pathP) as ResourceMapping;
            if (resMapping == null)
            {
                string pathC = string.Format(m_SubGroupResourceMappingPathPatternC, groupId);
                resMapping = await ObjectDeserializer.Deserialize(pathC) as ResourceMapping;
            }
            if (resMapping == null)
            {
                resMapping = await DownloadMappingFile(groupId);
            }
            ResourceProvider.CacheOrDirtyResourceMapping(resMapping, groupId);
            return resMapping;
        }

        public async UniTask<ResourceMapping> DownloadMappingFile(string groupId)
        {
            string resourceMappingPath = groupId == "0" ? m_MainGroupResourceMappingPathR : string.Format(m_SubGroupResourceMappingPathPatternR, groupId);

            byte[] bytes = await ResourceManager.DownloaderModule.DownloadBytes(resourceMappingPath);
            if (bytes != null)
            {
                ResourceMapping mapping = ObjectDeserializer.DeserializeSync(bytes) as ResourceMapping;
                if (groupId == "0")
                {
                    MainGroupResouceMapping = mapping;
                }
                else
                {
                    ResourceProvider.CacheOrDirtyResourceMapping(mapping, groupId);
                }
                ObjectSerializer.Serialize(mapping, groupId == "0" ? m_MainGroupResourceMappingPathP : string.Format(m_SubGroupResourceMappingPathPatternP, groupId));
                return mapping;
            }

            LoggerInternal.LogWarning($"failed to get resourceMapping[{groupId}] data from server!");
            return null;
        }

        public async UniTask<SubCatalog> DownloadSubCatalog(string groupId, bool cacheSubCatalog = false)
        {
            byte[] bytes = await ResourceManager.DownloaderModule.DownloadBytes(string.Format(m_SubCatalogDataPathPatternR, groupId));
            if (bytes != null)
            {
                SubCatalog subCatalog = ObjectDeserializer.DeserializeSync(bytes) as SubCatalog;
                if (cacheSubCatalog)
                {
                    CacheSubCatalog(subCatalog, groupId, true);
                }
                return subCatalog;
            }
            else
            {
                LoggerInternal.LogWarning($"failed to get subcatalog[{groupId}] data from server!");
                return null;
            }
        }

        public async UniTask<bool> LoadMainCatalogClient()
        {
            string mainCatalogClientPath = m_IsMainCatalogInCache ? m_MainCatalogDataPathP : m_MainCatalogDataPathC;
            MainCatalogClient = await ObjectDeserializer.Deserialize(mainCatalogClientPath) as MainCatalog;
            return true;
        }


        private async UniTask<SubCatalog> LoadSubCatalogClient(string groupId)
        {
            if (ResourceProvider.ProvideCachedSubCatalog(groupId, out SubCatalog subCatalog))
            {
                return subCatalog;
            }
            string subCatalogDataPathP = string.Format(m_SubCatalogDataPathPatternP, groupId);
            subCatalog = await ObjectDeserializer.Deserialize(subCatalogDataPathP) as SubCatalog;
            if (subCatalog == null)
            {
                string subCatalogDataPathC = string.Format(m_SubCatalogDataPathPatternC, groupId);
                subCatalog = await ObjectDeserializer.Deserialize(subCatalogDataPathC) as SubCatalog;
            }
            ResourceProvider.CacheOrDirtySubCatalog(subCatalog, groupId);
            return subCatalog;
        }

        private void LoadSubCatalogClientAsync(string groupId, Action<SubCatalog> callback)
        {
            if (ResourceProvider.ProvideCachedSubCatalog(groupId, out SubCatalog catalog))
            {
                callback?.Invoke(catalog);
                return;
            }
#if UNITY_WEBGL
            string subCatalogDataPathC = string.Format(m_SubCatalogDataPathPatternC, groupId);
            ObjectDeserializer.DeserializeAsync(subCatalogDataPathC, (subCatalogC) =>
                {
                    ResourceProvider.CacheOrDirtySubCatalog((SubCatalog)subCatalogC, groupId);
                    callback?.Invoke((SubCatalog)subCatalogC);
                }
            );
#else
            string subCatalogDataPathP = string.Format(m_SubCatalogDataPathPatternP, groupId);
            if (ObjectDeserializer.DeserializeSync(subCatalogDataPathP) is SubCatalog subCatalog)
            {
                ResourceProvider.CacheOrDirtySubCatalog(subCatalog, groupId);
                callback?.Invoke(subCatalog);
            }
            else
            {
                string subCatalogDataPathC = string.Format(m_SubCatalogDataPathPatternC, groupId);
                ObjectDeserializer.DeserializeAsync(subCatalogDataPathC, (subCatalogC) =>
                    {
                        ResourceProvider.CacheOrDirtySubCatalog((SubCatalog)subCatalogC, groupId);
                        callback?.Invoke((SubCatalog)subCatalogC);
                    }
                );
            }
#endif
        }

#if DEBUG_LOG
        private void CompareGroupBundleChange(BundleInfoDictionary clientBundleInfoMap, BundleInfoDictionary remoteBundleInfoMap, out bool isGroupBundleChanged, out long downloadSize, string groupId)
#else
        private void CompareGroupBundleChange(BundleInfoDictionary clientBundleInfoMap, BundleInfoDictionary remoteBundleInfoMap, out bool isGroupBundleChanged, out long downloadSize)
#endif
        {
#if DEBUG_LOG
            bool isMainGroup = (groupId == "0");
            if (isMainGroup)
            {
                ResourceManager.MainGroupHotupdateInfoSB.Append("*******Main AssetGroup Hotupdate Info*******\n");
            }
            else
            {
                if (!ResourceManager.SubGroupHotupdateInfoSbMap.ContainsKey(groupId))
                {
                    ResourceManager.SubGroupHotupdateInfoSbMap.Add(groupId, new System.Text.StringBuilder());
                }
            }
#endif
            downloadSize = 0;
            isGroupBundleChanged = false;
            foreach (var entry in remoteBundleInfoMap)
            {
                string bundleName = entry.Key;
                BundleInfo bundleInfoRemote = entry.Value;

                BundleInfo bundleInfoClient;
                if (clientBundleInfoMap != null)
                {
                    clientBundleInfoMap.TryGetValue(bundleName, out bundleInfoClient);
                }
                else
                {
                    bundleInfoClient = null;
                }

                if (bundleInfoClient == null || bundleInfoClient.changeState == ChangeState.None || bundleInfoClient.changeState == ChangeState.Add)
                {
                    LoggerInternal.LogFormat("newly added bundle: {0}", bundleName);
#if DEBUG_LOG
                    if (isMainGroup)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[+] [{0}]\n", bundleName);
                    }
                    else
                    {
                        ResourceManager.SubGroupHotupdateInfoSbMap[groupId].AppendFormat("[+] [{0}]\n", bundleName);
                    }
#endif
                    bundleInfoRemote.changeState = ChangeState.Add;
                    downloadSize += bundleInfoRemote.size;
                    if (!isGroupBundleChanged)
                    {
                        isGroupBundleChanged = true;
                    }
                }
                else if (bundleInfoClient.hashCode != null && bundleInfoClient.hashCode != bundleInfoRemote.hashCode)
                {
                    LoggerInternal.LogFormat("changed bundle: {0}", bundleName); //case 1
#if DEBUG_LOG
                    if (isMainGroup)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[*] [{0}]\n", bundleName);
                    }
                    else
                    {
                        ResourceManager.SubGroupHotupdateInfoSbMap[groupId].AppendFormat("[*] [{0}]\n", bundleName);
                    }
#endif
                    bundleInfoRemote.changeState = ChangeState.Modify;
                    downloadSize += bundleInfoRemote.size;
                    if (!isGroupBundleChanged)
                    {
                        isGroupBundleChanged = true;
                    }
                }
                else if (bundleInfoClient.hashCode != null && bundleInfoClient.hashCode == bundleInfoRemote.hashCode)
                {
                    LoggerInternal.LogFormat("uptodate bundle: {0}", bundleName);
                    bundleInfoRemote.changeState = ChangeState.Uptodate;
                    bundleInfoRemote.bundleLocation = bundleInfoClient.bundleLocation;
                }
            }

            Dictionary<string, BundleInfo> toRemoveBundleDict = new Dictionary<string, BundleInfo>();
            if (clientBundleInfoMap != null)
            {
                foreach (var entry in clientBundleInfoMap)
                {
                    string bundleName = entry.Key;
                    BundleInfo bundleInfoClient = entry.Value;
                    remoteBundleInfoMap.TryGetValue(bundleName, out BundleInfo bundleInfoRemote);
                    if (bundleInfoRemote == null)
                    {
                        LoggerInternal.LogFormat("deleted bundle: {0}", bundleName);
#if DEBUG_LOG
                        if (isMainGroup)
                        {
                            ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[-] [{0}]\n", bundleName);
                        }
                        else
                        {
                            ResourceManager.SubGroupHotupdateInfoSbMap[groupId].AppendFormat("[-] [{0}]\n", bundleName);
                        }
#endif
                        BundleInfo bundleInfo = new BundleInfo(null, 0, ChangeState.Remove, bundleInfoClient.bundleLocation, bundleInfoClient.dependencies);
                        bundleInfo.crc = bundleInfoClient.crc;
                        toRemoveBundleDict.Add(bundleName, bundleInfo);
                        if (!isGroupBundleChanged)
                        {
                            isGroupBundleChanged = true;
                        }
                    }
                }
            }
            foreach (var entry in toRemoveBundleDict)
            {
                string bundleName = entry.Key;
                BundleInfo bundleInfo = entry.Value;
                remoteBundleInfoMap.Add(bundleName, bundleInfo);
            }
#if DEBUG_LOG
            if (isMainGroup)
            {
                if (downloadSize > 0)
                {
                    ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[download size] [{0}MB]\n", downloadSize / 1024 / 1024);
                }
                else
                {
                    ResourceManager.MainGroupHotupdateInfoSB.Append("There is no assetbundle in main asset group to download.\n");
                }
                ResourceManager.MainGroupHotupdateInfoSB.Append("******************************\n");
            }
            else
            {
                if (downloadSize > 0)
                {
                    ResourceManager.SubGroupHotupdateInfoSbMap[groupId].AppendFormat("[download size] [{0}MB]\n", downloadSize / 1024 / 1024);
                }
                else
                {
                    ResourceManager.SubGroupHotupdateInfoSbMap[groupId].Append("There is no assetbundle in sub asset group to download.\n");
                }
            }
#endif
        }

        public async UniTask<CompareMainCatalogResult> CompareMainCatalogBetweenClientAndRemote()
        {
            /*
             1.for bundle exists both in client and server, if bundle hash changed, mark the bundle as Need Download And Delete Old One.
             2.for bundle exists only in server, mark the bundle as Need Download.
             3.for bundle exists only in client, mark the bundle as Need Delete.
            */
            CompareMainCatalogResult compareResult = new CompareMainCatalogResult();
            string mainCatalogClientPath = m_IsMainCatalogInCache ? m_MainCatalogDataPathP : m_MainCatalogDataPathC;
            MainCatalog mainCatalogClient = await ObjectDeserializer.Deserialize(mainCatalogClientPath) as MainCatalog;

            //Deal with main asset group bundle change Start
#if DEBUG_LOG
            CompareGroupBundleChange(mainCatalogClient.MainBundleInfoMap, m_MainCatalogRemote.MainBundleInfoMap, out bool isMainGroupBundlechanged, out long downloadSize, "0");
#else
            CompareGroupBundleChange(mainCatalogClient.MainBundleInfoMap, m_MainCatalogRemote.MainBundleInfoMap, out bool isMainGroupBundlechanged, out long downloadSize);
#endif
            compareResult.isMainGroupBundleChanged = isMainGroupBundlechanged;
            compareResult.downloadSize = downloadSize;
            //Deal with main asset group bundle change End

            compareResult.isMappingFileChanged = mainCatalogClient.mappingFileHash != m_MainCatalogRemote.mappingFileHash;

#if DEBUG_LOG
            ResourceManager.MainGroupHotupdateInfoSB.Append("*******Sub AssetGroup Hotupdate Info*******\n");
#endif
            //Deal with additional asset groups Start
            foreach (var entry in m_MainCatalogRemote.additionalAssetGroupInfoMap)
            {
                string groupId = entry.Key;
                AssetGroupInfo serverGroupInfo = entry.Value;
                mainCatalogClient.additionalAssetGroupInfoMap.TryGetValue(groupId, out AssetGroupInfo clientGroupInfo);
                if (clientGroupInfo == null)
                {
                    LoggerInternal.LogFormat("added group: {0}", groupId);
#if DEBUG_LOG
                    ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[+] [{0}]\n", groupId);
#endif
                    m_MainCatalogRemote.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Add;
                    if (!compareResult.isSubGroupAddedOrChanged)
                    {
                        compareResult.isSubGroupAddedOrChanged = true;
                    }
                }
                else if (clientGroupInfo.changeState == ChangeState.Add || clientGroupInfo.changeState == ChangeState.Modify || clientGroupInfo.changeState == ChangeState.Remove || clientGroupInfo.changeState == ChangeState.None)
                {
#if DEBUG_LOG
                    if (clientGroupInfo.changeState == ChangeState.Add)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[+] [{0}]\n", groupId);
                    }
                    else if (clientGroupInfo.changeState == ChangeState.Modify)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[*] [{0}]\n", groupId);
                    }
                    else if (clientGroupInfo.changeState == ChangeState.Remove)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[-] [{0}]\n", groupId);
                    }
                    else if (clientGroupInfo.changeState == ChangeState.None)
                    {
                        ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[?] [{0}]\n", groupId);
                    }
#endif
                    m_MainCatalogRemote.additionalAssetGroupInfoMap[groupId].changeState = clientGroupInfo.changeState;
                    if (!compareResult.isSubGroupAddedOrChanged)
                    {
                        compareResult.isSubGroupAddedOrChanged = true;
                    }
                }
                else if (clientGroupInfo.hashCode != serverGroupInfo.hashCode)
                {
                    LoggerInternal.LogFormat("modify group: {0}", groupId);
#if DEBUG_LOG
                    ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[*] [{0}]\n", groupId);
#endif
                    m_MainCatalogRemote.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Modify;
                    if (!compareResult.isSubGroupAddedOrChanged)
                    {
                        compareResult.isSubGroupAddedOrChanged = true;
                    }
                }
                else if (clientGroupInfo.hashCode == serverGroupInfo.hashCode)
                {
                    LoggerInternal.LogFormat("group[{0}] is uptodate, original group change state: {1}", groupId, m_MainCatalogRemote.additionalAssetGroupInfoMap[groupId].changeState);
                    m_MainCatalogRemote.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Uptodate;
                }
            }
            List<string> toDeleteGroupIdList = null;
            AssetGroupInfoDictionary groupToDeleteDict = new AssetGroupInfoDictionary();
            foreach (var entry in mainCatalogClient.additionalAssetGroupInfoMap)
            {
                string groupId = entry.Key;
                m_MainCatalogRemote.additionalAssetGroupInfoMap.TryGetValue(groupId, out AssetGroupInfo remoteGroupInfo);
                if (remoteGroupInfo == null)
                {
                    LoggerInternal.LogFormat("deleted groupId: {0}", groupId);
#if DEBUG_LOG
                    ResourceManager.MainGroupHotupdateInfoSB.AppendFormat("[-] [{0}]\n", groupId);
#endif
                    if (toDeleteGroupIdList == null)
                    {
                        toDeleteGroupIdList = new List<string>();
                    }
                    toDeleteGroupIdList.Add(groupId);
                    AssetGroupInfo assetGroupInfo = entry.Value;
                    assetGroupInfo.changeState = ChangeState.Remove;
                    groupToDeleteDict.Add(groupId, assetGroupInfo);
                }
            }
            compareResult.toDeleteGroupIdList = toDeleteGroupIdList;
            foreach (var entry in groupToDeleteDict)
            {
                m_MainCatalogRemote.additionalAssetGroupInfoMap.Add(entry.Key, entry.Value);
            }
#if DEBUG_LOG
            ResourceManager.MainGroupHotupdateInfoSB.Append("******************************\n");
#endif
            return compareResult;
            //Deal with additional asset groups End
        }

        public void DownloadOrRemoveChangedBundlesAsync(CancellationTokenSource cts, BundleInfoDictionary changedBundleInfoDict, bool isMainGroup, SubCatalog subCatalog, string groupId, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCancel, DownloadingPriority downloadingPriority = DownloadingPriority.Normal)
        {
            bool finish = false;

            int toDownloadCount = 0;
            int downloadedCount = 0;
            float toDownloadSize = 0;
            Dictionary<string, float> bundleName2weightedProgress = new Dictionary<string, float>();
            List<string> toRemoveBundleNameList = new List<string>();
            float totalProgress = 0f;

            foreach (var entry in changedBundleInfoDict)
            {
                string bundleName = entry.Key;
                BundleInfo bundleInfo = entry.Value;
                switch (bundleInfo.changeState)
                {
                    case ChangeState.Add:
                    case ChangeState.Modify:
                        toDownloadCount += 1;
                        toDownloadSize += bundleInfo.size;
                        bundleName2weightedProgress[bundleName] = 0f;
                        break;
                    default:
                        break;
                }
            }


            foreach (var entry in changedBundleInfoDict)
            {
                string bundleName = entry.Key;
                BundleInfo bundleInfo = entry.Value;
                ChangeState changeState = bundleInfo.changeState;
                switch (changeState)
                {
                    case ChangeState.Add:
                    case ChangeState.Modify:
                        DownloadBundleAsync(cts, bundleName, bundleInfo.size, bundleInfo.crc, groupId, subCatalog,
                            progressValue =>
                            {
                                float previous = bundleName2weightedProgress[bundleName];
                                float current = bundleInfo.size * progressValue / toDownloadSize;
                                totalProgress += (current - previous);
                                bundleName2weightedProgress[bundleName] = current;
                                onProgressValueChanged?.Invoke(totalProgress);
                            },
                            null,
                            bCompleted =>
                            {
                                if (!finish)
                                {
                                    // 如果下载失败，那么停掉其他所有下载
                                    if (!bCompleted)
                                    {
                                        finish = true;
                                        cts.Cancel();
                                        onCompleted(false);
                                    }
                                    else
                                    {
                                        downloadedCount += 1;
                                        if (downloadedCount == toDownloadCount)
                                        {
                                            finish = true;
                                            onProgressValueChanged?.Invoke(1);
                                            onCompleted(true);
                                        }
                                    }
                                }
                            },
                            () =>
                            {
                                if (!finish)
                                {
                                    finish = true;
                                    onCancel?.Invoke();
                                }
                            }, false, downloadingPriority);
                        break;
                    case ChangeState.Remove:
                        if (RemoveBundle(bundleName, groupId))
                        {
                            LoggerInternal.LogFormat("successfully removed assetbundle: {0}", bundleName);
                            toRemoveBundleNameList.Add(bundleName);
                        }
                        break;
                    case ChangeState.Uptodate:
                        LoggerInternal.LogFormat("Bundle {0} is uptodate.", bundleName);
                        break;
                    default:
                        LoggerInternal.LogError("invalid change state");
                        break;
                }
            }

            foreach (string bundleName in toRemoveBundleNameList)
            {
                if (isMainGroup)
                {
                    m_MainCatalogRemote.MainBundleInfoMap.Remove(bundleName);
                }
                else
                {
                    subCatalog.bundleInfoMap.Remove(bundleName);
                }
            }
        }

        public void DeleteAdditionalGroups(List<string> toDeleteGroupIdList)
        {
            int countToRemove = toDeleteGroupIdList.Count;
            int removedCount = 0;
            foreach (var groupId in toDeleteGroupIdList)
            {
                LoadSubCatalogClientAsync(groupId, (groupCatalog) =>
                {
                    if (groupCatalog != null)
                    {
                        foreach (string bundleName in groupCatalog.bundleInfoMap.Keys)
                        {
                            RemoveBundle(bundleName, groupId);
                        }
                        string mappingFilePathP = string.Format(m_SubGroupResourceMappingPathPatternP, groupId);
                        if (GameUtils.SafeDeleteFile(mappingFilePathP))
                        {
                            LoggerInternal.LogFormat("deleted subMapping[{0}] in path: {1}", groupId, mappingFilePathP);
                        }
                        string subCatalogDataPathP = string.Format(m_SubCatalogDataPathPatternP, groupId);
                        bool isSubCatalogInCaching = File.Exists(subCatalogDataPathP);
                        if (isSubCatalogInCaching)
                        {
                            if (GameUtils.SafeDeleteFile(subCatalogDataPathP))
                            {
                                LoggerInternal.LogFormat("deleted subcatalog[{0}] in path: {1}", groupId, subCatalogDataPathP);
                            }
                        }
                        else
                        {
                            LoggerInternal.LogFormat("subcatalog[{0}] is not in cache", groupId);
                        }
                    }
                    LoggerInternal.LogFormat("deleted asset group: {0}", groupId);
                    removedCount += 1;
                    if (removedCount == countToRemove)
                    {
                        foreach (var toDeleteGroupId in toDeleteGroupIdList)
                        {
                            m_MainCatalogRemote.additionalAssetGroupInfoMap.Remove(toDeleteGroupId);
                        }
                    }
                });
            }
        }

        public bool IsAssetGroupUptodate(string groupId)
        {
            if (groupId == "0")
            {
                return true; //we can insure that main asset group is always uptodate before we use it. 
            }
            if (!MainCatalogClient.additionalAssetGroupInfoMap.ContainsKey(groupId))
            {
                LoggerInternal.LogFormat("asset group [{0}] is not available on client side", groupId);
                return false;
            }
            AssetGroupInfo assetGroupInfo = MainCatalogClient.additionalAssetGroupInfoMap[groupId];
            return assetGroupInfo.changeState == ChangeState.Uptodate;
        }

        public async UniTask<BundleInfo> GetBundleInfo(string bundleName, string groupId = "0")
        {
            BundleInfo bundleInfo;
            if (groupId == "0")
            {
                MainCatalogClient.MainBundleInfoMap.TryGetValue(bundleName, out bundleInfo);
            }
            else
            {
                SubCatalog subCatalog = await LoadSubCatalogClient(groupId);
                if (subCatalog == null)
                {
                    subCatalog = await DownloadSubCatalog(groupId);
                    if (subCatalog == null) return null;
                    CacheSubCatalog(subCatalog, groupId);
                }
                subCatalog.bundleInfoMap.TryGetValue(bundleName, out bundleInfo);
            }
            return bundleInfo;
        }
        private async UniTask<BundleInfo> GetBundleInfoLocal(string bundleName, string groupId = "0")
        {
            BundleInfo bundleInfo;
            if (groupId == "0")
            {
                MainCatalogClient.MainBundleInfoMap.TryGetValue(bundleName, out bundleInfo);
            }
            else
            {
                SubCatalog subCatalog = await LoadSubCatalogClient(groupId);
                if (subCatalog == null)
                {
                    LoggerInternal.LogWarning($"Fatal error: SubCatalog for asset group[{groupId}] not available!");
                    return null;
                }
                subCatalog.bundleInfoMap.TryGetValue(bundleName, out bundleInfo);
            }
            return bundleInfo;
        }

        public bool ClearAssetGroup(string groupId)
        {
            if (groupId == "0")
            {
                LoggerInternal.LogWarning("Can not remove main asset group");
                return false;
            }

            string subCatalogDataPathP = string.Format(m_SubCatalogDataPathPatternP, groupId);
            if (File.Exists(subCatalogDataPathP))
            {
                SubCatalog subCatalog = ObjectDeserializer.DeserializeSync(subCatalogDataPathP) as SubCatalog;
                foreach (string bundleName in subCatalog.bundleInfoMap.Keys)
                {
                    RemoveBundle(bundleName, groupId);
                }
                if (GameUtils.SafeDeleteFile(subCatalogDataPathP))
                {
                    LoggerInternal.LogFormat("deleted subcatalog[{0}] in path: {1}", groupId, subCatalogDataPathP);
                }
                ResourceProvider.TryRemoveCachedSubCatalog(groupId);

                string mappingFilePathP = string.Format(m_SubGroupResourceMappingPathPatternP, groupId);
                if (GameUtils.SafeDeleteFile(mappingFilePathP))
                {
                    LoggerInternal.LogFormat("deleted subMapping[{0}] in path: {1}", groupId, mappingFilePathP);
                }
                ResourceProvider.TryRemoveCachedResourceMapping(groupId);
                if (MainCatalogClient.additionalAssetGroupInfoMap.ContainsKey(groupId))
                {
                    MainCatalogClient.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Add;
                    CacheMainCatalog(MainCatalogClient);
                }
                return true;
            }

            string subCatalogDataPathC = string.Format(m_SubCatalogDataPathPatternC, groupId);
            if (File.Exists(subCatalogDataPathC))
            {
                LoggerInternal.LogWarning($"group[{groupId}] is an in package group, you can't remove it!");
                return false;
            }

            LoggerInternal.LogWarning("client catalog is not available!");
            return false;
        }

        private async UniTaskVoid UpdateAssetGroupInternal(string groupId, CancellationTokenSource cts, Action<long> onGetDownloadSize, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCanceled, SubCatalog subCatalogRemote, BundleInfoDictionary clientBundleInfo, string clientMappingFileHash)
        {
#if DEBUG_LOG
            CompareGroupBundleChange(clientBundleInfo, subCatalogRemote.bundleInfoMap, out bool isGroupBundleChanged, out long downloadSize, groupId);
#else
            CompareGroupBundleChange(clientBundleInfo, subCatalogRemote.bundleInfoMap, out bool isGroupBundleChanged, out long downloadSize);
#endif
            onGetDownloadSize?.Invoke(downloadSize);
            CacheSubCatalog(subCatalogRemote, groupId, false);
            if (!isGroupBundleChanged)
            {
                LoggerInternal.LogFormat("group[{0}] bundle not changed", groupId);
                if (MainCatalogClient.additionalAssetGroupInfoMap[groupId].changeState != ChangeState.Uptodate)
                {
                    MainCatalogClient.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Uptodate;
                    CacheMainCatalog(MainCatalogClient);
                }
                ResourceProvider.RemovePendingRemoteSubCatalog(groupId);
                onCompleted?.Invoke(true);
                return;
            }
            //Debug.Log($"UpdateAssetGroupInternal 开始 groupId: {groupId}");
            bool isUptodate = false;
            bool success = false;
            bool isCancel = false;
            DownloadOrRemoveChangedBundlesAsync(cts, subCatalogRemote.bundleInfoMap, false, subCatalogRemote, groupId, onProgressValueChanged,
                (bCompleted) =>
                {
                    isUptodate = true;
                    success = bCompleted;
                },
                () =>
                {
                    isUptodate = true;
                    isCancel = true;
                });

            await UniTask.WaitUntil(() => isUptodate);
            //Debug.Log($"UpdateAssetGroupInternal 结束 groupId: {groupId}, 是否是取消 isCancel： {isCancel}   success: {success}");
            if (isCancel)
            {
                onCanceled?.Invoke();
            }
            else
            {
                if (success)
                {
                    LoggerInternal.LogFormat("successfully downloaded asset group[{0}]", groupId);
                    subCatalogRemote.MarkAsDownloaded();
                    CacheSubCatalog(subCatalogRemote, groupId);
                    MainCatalogClient.additionalAssetGroupInfoMap[groupId].changeState = ChangeState.Uptodate;
                    CacheMainCatalog(MainCatalogClient);
                    LoggerInternal.LogFormat("set asset group[{0}]'s change state to update", groupId);
                    if (clientMappingFileHash != subCatalogRemote.mappingFileHash)
                    {
                        var mapping = await DownloadMappingFile(groupId);
                        ResourceProvider.RemovePendingRemoteSubCatalog(groupId);
                        onCompleted?.Invoke(mapping != null);
                    }
                    else
                    {
                        ResourceProvider.RemovePendingRemoteSubCatalog(groupId);
                        onCompleted?.Invoke(true);
                    }
                }
                else
                {
                    await UniTask.Delay(1000, true);
                    onCompleted?.Invoke(false);
                }
            }

        }

        public async UniTaskVoid UpdateAssetGroup(CancellationTokenSource cts, string groupId, Action<long> onGetDownloadSize, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCanceled)
        {
            SubCatalog subCatalogClient = await LoadSubCatalogClient(groupId);
            if (cts.IsCancellationRequested)
            {
                onCanceled?.Invoke();
                return;
            }
            BundleInfoDictionary clientBundleInfo;
            string clientMappingFileHash;
            if (subCatalogClient != null)
            {
                clientBundleInfo = subCatalogClient.bundleInfoMap;
                clientMappingFileHash = subCatalogClient.mappingFileHash;
            }
            else
            {
                clientBundleInfo = null;
                clientMappingFileHash = null;
            }
            if (ResourceProvider.TryGetPendingRemoteSubCatalog(groupId, out SubCatalog pendingSubCatalog))
            {
                LoggerInternal.LogFormat("continue download using pending remote subcatalog[{0}]", groupId);
                UpdateAssetGroupInternal(groupId, cts, onGetDownloadSize, onProgressValueChanged, onCompleted, onCanceled, pendingSubCatalog, clientBundleInfo, clientMappingFileHash).Forget();
            }
            else
            {
                var subCatalogRemote = await DownloadSubCatalog(groupId);
                if (cts.IsCancellationRequested)
                {
                    onCanceled?.Invoke();
                    return;
                }
                if (subCatalogRemote == null)
                {
                    LoggerInternal.LogWarning($"remote catalog is null, groupId: {groupId}");
                    await UniTask.Delay(1000, true);
                    onCompleted?.Invoke(false);
                    return;
                }
                LoggerInternal.LogFormat("pending remote subcatalog[{0}]", groupId);
                ResourceProvider.PendingRemoteSubCatalog(groupId, subCatalogRemote);
                UpdateAssetGroupInternal(groupId, cts, onGetDownloadSize, onProgressValueChanged, onCompleted, onCanceled, subCatalogRemote, clientBundleInfo, clientMappingFileHash).Forget();
            }
        }

        public async UniTask<AssetMappingDictionary> GetAssetMappingByGroupId(string groupId)
        {
            if (groupId == "0")
            {
                return MainGroupAssetMapping;
            }
            else
            {
                ResourceMapping resourceMapping = await LoadSubGroupMappingFile(groupId);
                return resourceMapping?.assetMapping;
            }
        }

        public void DownloadBundleAsync(CancellationTokenSource cts, string bundleName, long size, uint crc, string groupId, SubCatalog subCatalog, Action<float> onProgressValueChanged, Action onStarted, Action<bool> onCompleted, Action onCanceled, bool cacheSubcatalog = false, DownloadingPriority downloadingPriority = DownloadingPriority.Normal)
        {
            //LoggerInternal.Log($" bundle开始下载 bundleName: {bundleName}");
            ResourceManager.DownloaderModule.DownloadAsestBundleAsync(cts, $"{BundleBasePathR}/{bundleName}", size, crc, $"{BundleBasePathP}/{bundleName}", onProgressValueChanged, onStarted,
            bCompleted =>
            {
                if (bCompleted)
                {
                    if (groupId == "0")
                    {
                        m_MainCatalogRemote.MainBundleInfoMap[bundleName].changeState = ChangeState.Uptodate;
                        m_MainCatalogRemote.MainBundleInfoMap[bundleName].bundleLocation = BundleLocation.InPersitent;
                        onCompleted?.Invoke(true);
                    }
                    else
                    {
                        if (subCatalog != null)
                        {
                            subCatalog.bundleInfoMap[bundleName].changeState = ChangeState.Uptodate;
                            subCatalog.bundleInfoMap[bundleName].bundleLocation = BundleLocation.InPersitent;
                            onCompleted?.Invoke(true);
                        }
                        else
                        {
                            LoadSubCatalogClientAsync(groupId, (subCatalogClient) =>
                            {
                                if (subCatalogClient != null)
                                {
                                    subCatalogClient.bundleInfoMap[bundleName].changeState = ChangeState.Uptodate;
                                    subCatalogClient.bundleInfoMap[bundleName].bundleLocation = BundleLocation.InPersitent;
                                    if (cacheSubcatalog)
                                    {
                                        CacheSubCatalog(subCatalogClient, groupId);
                                    }
                                    onCompleted?.Invoke(true);
                                }
                                else
                                {
                                    onCompleted?.Invoke(false);
                                }
                            });
                        }
                    }
                }
                else
                {
                    onCompleted?.Invoke(false);
                }
            },
            onCanceled,
            downloadingPriority);
        }
        public bool RemoveBundle(string bundleName, string groupId)
        {
            string bundleCachingPath = $"{m_BundleBasePathP}/{bundleName}";
            bool isBundleInCaching = File.Exists(bundleCachingPath);
            if (isBundleInCaching)
            {
                if (GameUtils.SafeDeleteFile(bundleCachingPath))
                {
                    LoggerInternal.LogFormat("deleted bundle[{0}] in path: {1}", bundleName, bundleCachingPath);
                }
            }
            else
            {
                LoggerInternal.LogFormat("bundle[{0}] is not in cache", bundleName);
            }
            return true;
        }
#if DEBUG_LOG
        public async UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string assetPath, string groupId = "0")
#else
        public async UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string groupId = "0")
#endif
        {
            string bundleBasePath;
            AssetBundle bundle;
            BundleInfo bundleInfo = await GetBundleInfoLocal(bundleName, groupId);
            BundleLocation bundleLocation = bundleInfo.bundleLocation;
#if UNITY_WEBGL
            bundleBasePath = m_BundleBasePathC;
            string bundlePath = $"{bundleBasePath}/{bundleName}";
            bundle = await LoadAssetBundleFromWeb(bundlePath);
#else
            switch (bundleLocation)
            {
                case BundleLocation.InPackage:
                    bundleBasePath = BundleBasePathC;
                    break;
                case BundleLocation.InPersitent:
                    bundleBasePath = BundleBasePathP;
                    break;
                case BundleLocation.Remote:
                default:
                    LoggerInternal.LogWarning($"can't load bundle[{bundleName}]");
                    return null;
            }
            LoggerInternal.Log($"LoadBundleFromFileOrCache:   {bundleName}");
            string bundlePath = $"{bundleBasePath}/{bundleName}";
            bundle = await AssetBundle.LoadFromFileAsync(bundlePath);
#endif
            if (bundle == null) return null;
#if DEBUG_LOG
            if (ResourceProvider.AddBundleToCache(bundle, bundleName, out AssetBundleResource bundleResource, assetPath))
            {
                onAddedToCache?.Invoke(bundleResource);
            }
#else
            if (ResourceProvider.AddBundleToCache(bundle, bundleName, out AssetBundleResource bundleResource))
            {
                onAddedToCache?.Invoke(bundleResource);
            }
#endif
            return bundle;
        }

        /// <summary>
        /// 从webgl远端服务器用UnityWebRequest加载Client Catalog File
        /// </summary>
        /// <returns></returns>
        public IEnumerator LoadMainCatalogClientFromWebGL()
        {
            LoggerInternal.LogFormat("LoadMainCatalogClientCorou 开始");
            string mainCatalogClientPath = m_IsMainCatalogInCache ? m_MainCatalogDataPathP : m_MainCatalogDataPathC;
            if (string.IsNullOrEmpty(mainCatalogClientPath))
            {
                yield break;
            }
            LoggerInternal.LogFormat("LoadMainCatalogClientCorou LoadMainCatalogClient mainCatalogClientPath :" + mainCatalogClientPath);
            byte[] bytes = null;
            using (UnityWebRequest request = new UnityWebRequest(mainCatalogClientPath, UnityWebRequest.kHttpVerbGET, new DownloadHandlerBuffer(), null))
            {
                yield return request.SendWebRequest();
                try
                {
                    if (!GameUtils.RequestHasErrors(request, out _))
                    {
                        bytes = request.downloadHandler.data;
                    }
                    else
                    {
                        bytes = null;
                    }
                    MainCatalogClient = ObjectDeserializer.DeserializeSync(bytes) as MainCatalog;
                    LoggerInternal.LogFormat("LoadMainCatalogClientCorou LoadMainCatalogClient mainCatalogClientPath  over :" + mainCatalogClientPath);
                    ObjectDeserializer.ObjectToJson(MainCatalogClient);
                }
                catch (UnityWebRequestException)
                {
                    LoggerInternal.LogFormat("file text: {0} not found", mainCatalogClientPath);
                    bytes = null;
                }
            }
        }

        public async UniTask<bool> LoadMainCatalogClientFromWebGLAsync()
        {
            LoggerInternal.LogFormat("LoadMainCatalogClientCorou 开始");
            string mainCatalogClientPath = m_MainCatalogDataPathC;
            if (string.IsNullOrEmpty(mainCatalogClientPath))
            {
                return false;
            }
            LoggerInternal.LogFormat("LoadMainCatalogClientCorou LoadMainCatalogClient mainCatalogClientPath :" + mainCatalogClientPath);
            byte[] bytes = null;
            using (UnityWebRequest request = new UnityWebRequest(mainCatalogClientPath, UnityWebRequest.kHttpVerbGET, new DownloadHandlerBuffer(), null))
            {
                request.SetRequestHeader("Cache-Control", "no-store");  // 禁用缓存
                await request.SendWebRequest();
                try
                {
                    if (!GameUtils.RequestHasErrors(request, out _))
                    {
                        bytes = request.downloadHandler.data;
                    }
                    else
                    {
                        bytes = null;
                        return false;
                    }
                    MainCatalogClient = ObjectDeserializer.DeserializeSync(bytes) as MainCatalog;
                    LoggerInternal.LogFormat("LoadMainCatalogClientCorou LoadMainCatalogClient mainCatalogClientPath  over :" + mainCatalogClientPath);
                    ObjectDeserializer.ObjectToJson(MainCatalogClient);
                    return true;
                }
                catch (UnityWebRequestException)
                {
                    LoggerInternal.LogFormat("file text: {0} not found", mainCatalogClientPath);
                    bytes = null;
                    return false;
                }
            }
        }

        /// <summary>
        /// 从webgl url用UnityWebRequest加载Assetbundle
        /// </summary>
        /// <param name="url">Assetbundle url</param>
        /// <returns></returns>
        async UniTask<AssetBundle> LoadAssetBundleFromWeb(string url)
        {
            LoggerInternal.LogFormat("LoadAssetBundleFromWeb " + url);
            using (UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(url))
            {
                request.SetRequestHeader("Cache-Control", "no-store");  // 禁用缓存
                await request.SendWebRequest();
                if (request.result == UnityWebRequest.Result.Success)
                {
                    // AssetBundle加载成功
                    AssetBundle bundle = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;

                    return bundle;
                    // 从AssetBundle中加载你的资源，例如：
                    //GameObject prefab = bundle.LoadAsset<GameObject>("MyPrefab");
                    // 使用资源...
                    // 记得在使用完后卸载AssetBundle
                    //bundle.Unload(false);
                }
                else
                {
                    // AssetBundle加载失败
                    Debug.LogError("AssetBundle加载失败: " + request.error);
                    return null;
                }
            }
        }
    }
}