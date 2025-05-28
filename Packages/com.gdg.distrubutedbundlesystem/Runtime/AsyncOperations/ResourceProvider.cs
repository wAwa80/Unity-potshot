using Game.Addresssables.AsyncOperations;
using Game.Addresssables.Common;
using Game.Addresssables.Type;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;

namespace Game.Addresssables
{
    public class AssetBundleResource
    {

        public string bundleName;
        public AssetBundle bundle;
        public int referenceCount;
        public List<string> referencedAssets;

#if DEBUG_LOG
        public AssetBundleResource(AssetBundle bundle, string bundleName, string assetPath)
        {
            this.bundle = bundle;
            referenceCount = 1;
            this.bundleName = bundleName;
            referencedAssets = new List<string> { assetPath };
        }
#else
        public AssetBundleResource(AssetBundle bundle, string bundleName)
        {
            this.bundle = bundle;
            referenceCount = 1;
            this.bundleName = bundleName;
        }
#endif

        public void Unload()
        {
            if (bundle == null)
                return;
            bundle.Unload(true);
            bundle = null;
        }
    }
    internal static class ResourceProvider
    {
        #region AssetBundle
        internal static Dictionary<string, AssetBundleResource> m_AssetBundleCache = new Dictionary<string, AssetBundleResource>();
        internal static readonly HashSet<string> m_LoadingBundleSet = new HashSet<string>();
        private static readonly HashSet<string> m_LoadingAssetGroupSet = new HashSet<string>();

#if DEBUG_LOG
        public static bool AddBundleToCache(AssetBundle bundle, string bundleName, out AssetBundleResource bundleResource, string assetPath)
        {
            bundleResource = new AssetBundleResource(bundle, bundleName, assetPath);
            m_AssetBundleCache.Add(bundleName, bundleResource);
            return true;
        }
#else
        public static bool AddBundleToCache(AssetBundle bundle, string bundleName, out AssetBundleResource bundleResource)
        {
            bundleResource = new AssetBundleResource(bundle, bundleName);
            m_AssetBundleCache.Add(bundleName, bundleResource);
            return true;
        }
#endif


        public static bool TryGetBundleFromCache(string bundleName, out AssetBundleResource bundleResource)
        {
            if (m_AssetBundleCache.TryGetValue(bundleName, out bundleResource))
            {
                return true;
            }
            return false;
        }

        public static bool RemoveBundleFromCache(string bundleName)
        {
            if (!m_AssetBundleCache.ContainsKey(bundleName))
            {
                LoggerInternal.LogErrorFormat("bundle[{0}] have been removed incorrectly", bundleName);
                return false;
            }
            m_AssetBundleCache.Remove(bundleName);
            return true;
        }
#if DEBUG_LOG
        private static async UniTask<AssetBundle> LoadBundleInternal(string bundleName, BundleInfo bundleInfo, string groupId, LoadAssetOp loadAssetOp, string assetPath)
#else
        private static async UniTask<AssetBundle> LoadBundleInternal(string bundleName, BundleInfo bundleInfo, string groupId, LoadAssetOp loadAssetOp)
#endif
        {
            await UniTask.WaitUntil(() => !m_LoadingBundleSet.Contains(bundleName));
            if (TryGetBundleFromCache(bundleName, out AssetBundleResource abResource))
            {
                abResource.referenceCount += 1;
#if DEBUG_LOG
                abResource.referencedAssets.Add(assetPath);
#endif
                loadAssetOp.AddDepBundleResources(abResource);
                return abResource.bundle;
            }
            m_LoadingBundleSet.Add(bundleName);

#if !UNITY_WEBGL
            bool isUptodate = bundleInfo.changeState == ChangeState.Uptodate;
            LoggerInternal.LogFormat("ResourceProvider bundle[{0}] uptodate ? {1}", bundleName, isUptodate);
            if (!isUptodate)
            {
                bool success = false;
                //TODO:macdeng bugs here. Will cause many serialization operations at once.

                if (!ResourceManager.m_CTSCache.TryGetValue("default", out CancellationTokenSource new_cts))
                {
                    new_cts = new CancellationTokenSource();
                    ResourceManager.m_CTSCache["default"] = new_cts;
                }

                ResourceManager.AssetBundleModule.DownloadBundleAsync(new_cts, bundleName, bundleInfo.size, bundleInfo.crc, groupId, null, null, null,
                    downloadSuccess =>
                    {
                        LoggerInternal.Log($"ResourceProvider downloaded bundle:[{bundleName}]  downloadSuccess: {downloadSuccess}");
                        isUptodate = true;
                        success = downloadSuccess;
                    },
                    () =>
                    {
                        isUptodate = true;
                        success = false;
                    },
                    true,
                    DownloadingPriority.High);
                await UniTask.WaitUntil(() => isUptodate);
                if (!success)
                {
                    LoggerInternal.LogWarning("下载bundle失败：" + bundleName);
                    m_LoadingBundleSet.Remove(bundleName);
                    return null;
                }
            }
#endif

#if DEBUG_LOG
            AssetBundle bundle = await ResourceManager.AssetBundleModule.LoadBundleFromFile(bundleName, loadAssetOp.AddDepBundleResources, loadAssetOp.AssetPath, groupId);
#else
            AssetBundle bundle = await ResourceManager.AssetBundleModule.LoadBundleFromFile(bundleName, loadAssetOp.AddDepBundleResources, groupId);
#endif
            LoggerInternal.LogFormat("ResourceProvider loaded completed bundle: [{0}]", bundleName);
            m_LoadingBundleSet.Remove(bundleName);
            return bundle;
        }
        private static async UniTask<bool> LoadDependencyBundles(DependencyBundle[] deps, LoadAssetOp loadAssetOp)
        {
            int depLen = deps.Length;
            List<UniTask<AssetBundle>> tasks = new List<UniTask<AssetBundle>>();
            List<string> bundlenames = new List<string>();
            for (int i = 0; i < depLen; i++)
            {
                DependencyBundle depBundle = deps[i];
                string bundleName = depBundle.bundleName;
                if (TryGetBundleFromCache(bundleName, out AssetBundleResource bundleResource))
                {
                    bundleResource.referenceCount += 1;
#if DEBUG_LOG
                    bundleResource.referencedAssets.Add(loadAssetOp.AssetPath);
#endif
                    loadAssetOp.AddDepBundleResources(bundleResource);
                    continue;
                }
                string groupId = depBundle.groupId;

                BundleInfo bundleInfo = await ResourceManager.AssetBundleModule.GetBundleInfo(bundleName, groupId);
#if DEBUG_LOG
                UniTask<AssetBundle> task = LoadBundleInternal(bundleName, bundleInfo, groupId, loadAssetOp, loadAssetOp.AssetPath);
#else
                UniTask<AssetBundle> task = LoadBundleInternal(bundleName, bundleInfo, groupId, loadAssetOp);
#endif
                tasks.Add(task);
                bundlenames.Add(bundleName);
            }
            AssetBundle[] results = await UniTask.WhenAll(tasks);
            for (int i = 0; i < results.Length; i++)
            {
                if (results[i] == null)
                {
                    LoggerInternal.LogWarning($"加载依赖bundle失败: bundleName : {bundlenames[i]}");
                    return false;
                }
            }
            return true;
        }

        internal static async UniTask<AssetBundle> ProvideAssetBundle(string assetPath, string groupId, LoadAssetOp loadAssetOp)
        {
            await UniTask.WaitUntil(() => !m_LoadingAssetGroupSet.Contains(groupId));
            m_LoadingAssetGroupSet.Add(groupId);
            AssetMappingDictionary assetMapping = await ResourceManager.AssetBundleModule.GetAssetMappingByGroupId(groupId);

            if (assetMapping == null)
            {
                m_LoadingAssetGroupSet.Remove(groupId);
                return null;
            }

            if (assetMapping.TryGetValue(assetPath, out string bundleName))
            {
                LoggerInternal.Log($"GetBundleInfo  { assetPath} { bundleName } { groupId }");
                BundleInfo bundleInfo = await ResourceManager.AssetBundleModule.GetBundleInfo(bundleName, groupId);
                m_LoadingAssetGroupSet.Remove(groupId);
                if (bundleInfo == null) return null;
                LoggerInternal.Log(bundleInfo);
                if (bundleInfo.dependencies.Length > 0 && !await LoadDependencyBundles(bundleInfo.dependencies, loadAssetOp))
                {
                    LoggerInternal.LogWarning("加载依赖bundle失败");
                    return null;
                }

                if (TryGetBundleFromCache(bundleName, out AssetBundleResource bundleResource))
                {
                    bundleResource.referenceCount += 1;
#if DEBUG_LOG
                    bundleResource.referencedAssets.Add(loadAssetOp.AssetPath);
#endif
                    loadAssetOp.AddDepBundleResources(bundleResource);
                    return bundleResource.bundle;
                }
#if DEBUG_LOG
                return await LoadBundleInternal(bundleName, bundleInfo, groupId, loadAssetOp, loadAssetOp.AssetPath);
#else
                return await LoadBundleInternal(bundleName, bundleInfo, groupId, loadAssetOp);
#endif
            }
            m_LoadingAssetGroupSet.Remove(groupId);
            return null;
        }
        #endregion
        #region Asset
        internal static Dictionary<string, ResourceMapping> m_ResourceMappingCache = new Dictionary<string, ResourceMapping>();
        internal static Queue<string> m_ResourceMappingCacheKeyPool = new Queue<string>();
        internal static int m_ResourceMappingCacheKeyPoolSizeLimit = 5;
        internal static void CacheOrDirtyResourceMapping(ResourceMapping resourceMapping, string groupId)
        {
            if (resourceMapping == null)
            {
                return;
            }
            if (m_ResourceMappingCache.ContainsKey(groupId))
            {
                m_ResourceMappingCache[groupId] = resourceMapping;
                return;
            }
            if (m_ResourceMappingCacheKeyPool.Count > m_ResourceMappingCacheKeyPoolSizeLimit)
            {
                string oldestGroupId = m_ResourceMappingCacheKeyPool.Dequeue();
                if (m_ResourceMappingCache.ContainsKey(oldestGroupId))
                {
                    m_ResourceMappingCache.Remove(oldestGroupId);
                }
                else
                {
                    m_ResourceMappingCacheKeyPoolSizeLimit -= 1;
                }
            }
            m_ResourceMappingCache.Add(groupId, resourceMapping);
            m_ResourceMappingCacheKeyPool.Enqueue(groupId);
        }

        internal static bool ProvideCachedResourceMapping(string groupId, out ResourceMapping resourceMapping)
        {
            LoggerInternal.LogFormat("ProvideCachedResourceMapping, groupId: {0}", groupId);
            return m_ResourceMappingCache.TryGetValue(groupId, out resourceMapping);
        }

        internal static bool TryRemoveCachedResourceMapping(string groupId)
        {
            if (m_ResourceMappingCache.ContainsKey(groupId))
            {
                m_ResourceMappingCache.Remove(groupId);
                m_ResourceMappingCacheKeyPoolSizeLimit += 1;
                return true;
            }
            return false;
        }

        internal static Dictionary<string, SubCatalog> m_SubCatalogCache = new Dictionary<string, SubCatalog>();
        internal static Queue<string> m_SubCatalogCacheKeyPool = new Queue<string>();
        internal static int m_SubCatalogCacheKeyPoolSizeLimit = 5;

        internal static void CacheOrDirtySubCatalog(SubCatalog subCatalog, string groupId)
        {
            if (subCatalog == null)
            {
                return;
            }
            if (m_SubCatalogCache.ContainsKey(groupId))
            {
                m_SubCatalogCache[groupId] = subCatalog;
                return;
            }
            if (m_SubCatalogCacheKeyPool.Count > m_SubCatalogCacheKeyPoolSizeLimit)
            {
                string oldestGroupId = m_SubCatalogCacheKeyPool.Dequeue();
                if (m_SubCatalogCache.ContainsKey(oldestGroupId))
                {
                    m_SubCatalogCache.Remove(oldestGroupId);
                }
                else
                {
                    m_SubCatalogCacheKeyPoolSizeLimit -= 1;
                }
            }
            m_SubCatalogCache.Add(groupId, subCatalog);
            m_SubCatalogCacheKeyPool.Enqueue(groupId);
        }

        internal static bool ProvideCachedSubCatalog(string groupId, out SubCatalog subCatalog)
        {
            return m_SubCatalogCache.TryGetValue(groupId, out subCatalog);
        }

        internal static bool TryRemoveCachedSubCatalog(string groupId)
        {
            if (m_SubCatalogCache.ContainsKey(groupId))
            {
                m_SubCatalogCache.Remove(groupId);
                m_SubCatalogCacheKeyPoolSizeLimit += 1;
                return true;
            }
            return false;
        }

        #endregion


        private static HashSet<string> m_DownloadingAssetGroupMap = new HashSet<string>();
        internal static void MarkAssetGroupAsDownloading(string groupId)
        {
            if (m_DownloadingAssetGroupMap.Contains(groupId))
            {
                LoggerInternal.LogWarningFormat("{0} is already in downloading map", groupId);
                return;
            }
            m_DownloadingAssetGroupMap.Add(groupId);
        }

        internal static bool IsAssetGroupDownloading(string groupId)
        {
            return m_DownloadingAssetGroupMap.Contains(groupId);
        }

        internal static void ClearAssetGroupDownloadingState(string groupId)
        {
            if (!m_DownloadingAssetGroupMap.Contains(groupId))
            {
                LoggerInternal.LogWarningFormat("{0} is not in downloading map", groupId);
                return;
            }
            m_DownloadingAssetGroupMap.Remove(groupId);
        }


        internal static Dictionary<string, SubCatalog> m_PendingRemoteSubCatalogMap = new Dictionary<string, SubCatalog>();
        internal static bool TryGetPendingRemoteSubCatalog(string groupId, out SubCatalog subCatalog)
        {
            return m_PendingRemoteSubCatalogMap.TryGetValue(groupId, out subCatalog);
        }

        internal static void PendingRemoteSubCatalog(string groupId, SubCatalog subCatalog)
        {
            if (m_PendingRemoteSubCatalogMap.ContainsKey(groupId))
            {
                LoggerInternal.LogWarningFormat("{0} is already in pending map", groupId);
            }
            m_PendingRemoteSubCatalogMap[groupId] = subCatalog;
        }

        internal static void RemovePendingRemoteSubCatalog(string groupId)
        {
            if (!m_PendingRemoteSubCatalogMap.ContainsKey(groupId))
            {
                LoggerInternal.LogWarningFormat("{0} is not in pending map", groupId);
                return;
            }
            m_PendingRemoteSubCatalogMap.Remove(groupId);
        }

        private static int m_LoadingAssetsCount;

        internal static int LoadingAssetsCount => m_LoadingAssetsCount;

        internal static void ResetLoadedAssetsCount()
        {
            m_LoadingAssetsCount = 0;
#if DEBUG_LOG
            LoadingAssets.Clear();
#endif
        }

#if DEBUG_LOG
        internal static List<string> LoadingAssets = new List<string>();
        internal static void IncreaseLoadingAssetsCount(string assetPath)
#else
        internal static void IncreaseLoadingAssetsCount()
#endif
        {
            m_LoadingAssetsCount += 1;
            //Debug.Log($"IncreaseLoadingAssetsCount ++: {assetPath}  m_LoadingAssetsCount:{m_LoadingAssetsCount}");
#if DEBUG_LOG
            LoadingAssets.Add(assetPath);
#endif
        }
#if DEBUG_LOG
        internal static void DecreaseLoadingAssetsCount(string assetPath)
#else
        internal static void DecreaseLoadingAssetsCount()
#endif
        {
            m_LoadingAssetsCount -= 1;
            //Debug.Log($"IncreaseLoadingAssetsCount --: {assetPath}  m_LoadingAssetsCount:{m_LoadingAssetsCount}");
#if DEBUG_LOG
            LoadingAssets.Remove(assetPath);
#endif
        }

    }

}
