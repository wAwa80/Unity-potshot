using Game.Addresssables.AsyncOperations;
using Game.Addresssables.Common;
using Game.Addresssables.Config;
using Game.Addresssables.Module;
using Game.Addresssables.Type;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Threading;
using Game.Addresssables.ModuleImpl;
using UnityEngine;

namespace Game.Addresssables
{
    /// <summary>
    /// TODO List:
    /// 1. add retry method when any exception happens.
    /// 2. optimize runtime bundle lifecycle management using Directed Acyclic Graph(Low Priority cause current solution is work and don't have performance issues).
    /// 3. cache LoadAssetOp by ResourceKey
    /// 
    /// Fixed Issues:
    /// 1. only one material changed. but other materials bundle changed when rebuild bundle(won't fix, 
    /// if Asset a in Bundle A reference material1, material2, material3. each material is a bundle. 
    /// if material1 changed. rebuild bundle. then all material bundle changed. 
    /// But if asset a in bundle A refrence materia1, asset b in Bundle B refrenece material2, 
    /// asset c in Bundle C refrenece material3, then material 1 changed, rebuild bundle, other material bundle don't change).
    /// 2. when second request is in first request's aync callback, when can't create second request(fix method: modify first request to sync style, I'll deep into the issue in the future).
    /// 3. Do not append hash to bundle name. Asset names in one asset group must be distinct. I'll fix this issue in future release(won't fix).
    /// 
    /// 
    /// Known Issues:
    /// 1. 覆盖安装或者第一次安装时，会有问题，会判定为需要下载maincatalog.data
    /// 2. NullReferenceException: Object reference not set to an instance of an object AssetBundleModule.cs:1265 触发条件：机器下载完成的瞬间断网
    /// 
    /// </summary>
    public static class ResourceManager
    {
        private static IAssetModule m_AssetModule;

        private static IAssetBundleModule m_AssetBundleModule;

        public static DownloaderModule DownloaderModule = new DownloaderModule();

        public static IAssetModule AssetModule
        {
            get { return m_AssetModule; }
        }

        public static IAssetBundleModule AssetBundleModule
        {
            get { return m_AssetBundleModule; }
        }

        public static void PrepareModules(IAssetModule assetModule, IAssetBundleModule assetBundleModule)
        {
            m_AssetModule = assetModule;
            m_AssetBundleModule = assetBundleModule;

            m_AssetModule.Init();
            m_AssetBundleModule.Init();
            DownloaderModule.Init();
        }

        public static void DestoryModules()
        {
            m_AssetModule?.Destroy();
            m_AssetBundleModule?.Destroy();
            DownloaderModule?.Destroy();
        }

        public static void LoadAssetAsync(string assetPath, Action<AsyncOperationBase> onCompleted, string groupId = "0", bool silent = false, bool isAtals = false)
        {
            m_AssetModule.LoadAssetAsync(assetPath, onCompleted, groupId, silent, isAtals);
        }

        public static void Init(string serverAddress, string webVersion = "", string gameId = "")
        {
            AddressablesConfig.ServerAddress = serverAddress;
            AddressablesConfig.WebVersion = webVersion;
            AddressablesConfig.GameId = gameId;
        }

        public static void CacheMainCatalogHash(bool catalogHashChanged)
        {
            m_AssetBundleModule.CacheMainCatalogHash(catalogHashChanged);
        }

        public static void CacheRemoteMainCatalog()
        {
            m_AssetBundleModule.CacheMainCatalog(m_AssetBundleModule.MainCatalogRemote);
        }

        public static async UniTask<CompareMainCatalogResult> CompareMainCatalogBetweenClientAndRemote()
        {
            return await m_AssetBundleModule.CompareMainCatalogBetweenClientAndRemote();
        }

        public static void DownloadOrRemoveChangedBundlesInMainGroupAsync(Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCancel)
        {
            CancellationTokenSource new_cts = new CancellationTokenSource();
            m_CTSCache["0"] = new_cts;
            m_AssetBundleModule.DownloadOrRemoveChangedBundlesAsync(new_cts, m_AssetBundleModule.MainCatalogRemote.MainBundleInfoMap, true, null, "0", onProgressValueChanged, onCompleted, onCancel, DownloadingPriority.Normal);
        }

        public static void DeleteAdditionalGroups(List<string> toDeleteGroupIdList)
        {
            m_AssetBundleModule.DeleteAdditionalGroups(toDeleteGroupIdList);
        }

        public static bool IsAssetGroupUptodate(string groupId)
        {
            return m_AssetBundleModule.IsAssetGroupUptodate(groupId);
        }

        public static bool IsAssetGroupDownloading(string groupId)
        {
            return ResourceProvider.IsAssetGroupDownloading(groupId);
        }

        public static DownloadStatus GetAssetGroupDownloadStatus(string groupId)
        {
            if (IsAssetGroupDownloading(groupId))
            {
                return DownloadStatus.Downloading;
            }
            else if (IsAssetGroupUptodate(groupId))
            {
                return DownloadStatus.Uptodate;
            }
            else
            {
                return DownloadStatus.NeedDownload;
            }
        }

        public static bool IsLoadingAnyAsset()
        {
            return m_AssetModule.IsLoadingAnyAsset();
        }

        public static Dictionary<string, CancellationTokenSource> m_CTSCache = new Dictionary<string, CancellationTokenSource>();
        public static void UpdateAssetGroupAsync(string groupId, Action<long> onGetDownloadSize, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCanceled)
        {
            if (ResourceProvider.IsAssetGroupDownloading(groupId))
            {
                LoggerInternal.LogError($"正在有相同的group在下载: groupId{groupId}");
            }
            Debug.Log($"c# 开始下载group: {groupId}");

            ResourceProvider.MarkAssetGroupAsDownloading(groupId);

            CancellationTokenSource new_cts = new CancellationTokenSource();
            m_CTSCache[groupId] = new_cts;

            //CancellationTokenSource cts = ResourceProvider.ProvideCancellationTokenSourceByAssetGroupId(groupId, true);
            m_AssetBundleModule.UpdateAssetGroup(new_cts, groupId, onGetDownloadSize, onProgressValueChanged,
                (bCompleted) =>
                    {
                        Debug.Log($"c# 结束下载回调group: {groupId}   onCompleted: {bCompleted}   cts.IsCancellationRequested: {new_cts.IsCancellationRequested}");
                        ResourceProvider.ClearAssetGroupDownloadingState(groupId);
                        if (m_CTSCache.ContainsKey(groupId))// 如果池里还有这个cts，证明lua侧没有过取消
                        {
                            m_CTSCache.Remove(groupId);
                            onCompleted?.Invoke(bCompleted);
                        }
                        else
                        {
                            onCanceled?.Invoke();
                        }
                    }
                ,
                () =>
                    {
                        ResourceProvider.ClearAssetGroupDownloadingState(groupId);
                        Debug.Log($"c# 取消下载回调group: {groupId}");
                        onCanceled?.Invoke();
                    });
        }

        public static void CancelDownloadAssetGroup(string groupId)
        {
            Debug.Log($"c# CancelDownloadAssetGroup取消group: {groupId}");

            if (m_CTSCache.TryGetValue(groupId, out CancellationTokenSource cts))
            {
                cts.Cancel();
                m_CTSCache.Remove(groupId);
            }
            else
            {
                Debug.LogError($"c# 取消group失败，没找到这个groupId: {groupId}");
            }
        }
        /// <summary>
        /// 删除机器资源
        /// </summary>
        /// <param name="groupId">groupId</param>
        /// <returns></returns>
        public static bool ClearAssetGroup(string groupId)
        {
            if (IsAssetGroupDownloading(groupId))
            {
                LoggerInternal.LogErrorFormat("Asset group[{0}] is being download!", groupId);
            }
            return m_AssetBundleModule.ClearAssetGroup(groupId);
        }

        public static ResourceMapping GetMainGroupResourceMapping()
        {
            return m_AssetBundleModule.MainGroupResouceMapping;
        }

#if DEBUG_LOG
        public static string PrintLoadingAssets()
        {
            List<string> loadingAssets = ResourceProvider.LoadingAssets;
            if (ResourceProvider.LoadingAssetsCount != loadingAssets.Count)
            {
                return "Internal Error! Please check your code!";
            }
            if (loadingAssets.Count == 0)
            {
                return "没有正在加载的资源";
            }
            else
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.AppendFormat("正在加载{0}个资源：\n", loadingAssets.Count);
                int index = 0;
                foreach (string asset in loadingAssets)
                {
                    sb.AppendFormat("{0}.{1}\n", ++index, asset);
                }
                return sb.ToString();

            }
        }

        public static int LoadingBundlesCount
        {
            get { return ResourceProvider.m_LoadingBundleSet.Count; }
        }

        public static int LoadedBundlesCount
        {
            get { return ResourceProvider.m_AssetBundleCache.Count; }
        }

        private static System.Text.StringBuilder sbLoadingBundles;
        public static string GetLoadingBundlesString()
        {
            if (sbLoadingBundles == null)
            {
                sbLoadingBundles = new System.Text.StringBuilder();
            }
            sbLoadingBundles.Length = 0;
            foreach (string bundleName in ResourceProvider.m_LoadingBundleSet)
            {
                sbLoadingBundles.Append(bundleName + ",\n");
            }
            return sbLoadingBundles.ToString();
        }

        private static System.Text.StringBuilder sbLoadedBundles;
        public static string GetLoadedBundlesString()
        {
            if (sbLoadedBundles == null)
            {
                sbLoadedBundles = new System.Text.StringBuilder();
            }
            sbLoadedBundles.Length = 0;
            foreach (var entry in ResourceProvider.m_AssetBundleCache)
            {
                string bundleName = entry.Key;
                sbLoadedBundles.Append(bundleName + ",\n");
            }
            return sbLoadedBundles.ToString();
        }

        public static List<string> GetLoadedBundleList()
        {
            List<string> loadedBundle = new List<string>();
            foreach (var entry in ResourceProvider.m_AssetBundleCache)
            {
                string bundleName = entry.Key;
                loadedBundle.Add(bundleName);
            }
            return loadedBundle;
        }

        public static int GetBundleReferenceCount(string bundleName)
        {
            AssetBundleResource bundleResource = ResourceProvider.m_AssetBundleCache[bundleName];
            return bundleResource.referenceCount;
        }

        public static List<string> GetBundleRefAssetList(string bundleName)
        {
            List<string> refAssetList = new List<string>();
            AssetBundleResource bundleResource = ResourceProvider.m_AssetBundleCache[bundleName];
            List<string> refAssets = bundleResource.referencedAssets;
            foreach (string assetPath in refAssets)
            {
                refAssetList.Add(assetPath);
            }
            return refAssetList;
        }

        public static System.Text.StringBuilder MainGroupHotupdateInfoSB = new System.Text.StringBuilder();
        public static Dictionary<string, System.Text.StringBuilder> SubGroupHotupdateInfoSbMap = new Dictionary<string, System.Text.StringBuilder>();
#endif
    }
}
