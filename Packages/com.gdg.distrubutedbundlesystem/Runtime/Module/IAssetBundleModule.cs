using Game.Addresssables.Common;
using Game.Addresssables.Type;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using System.Collections;

namespace Game.Addresssables.Module
{
    public interface IAssetBundleModule : IModule
    {
        MainCatalog MainCatalogClient { get; set; }
        MainCatalog MainCatalogRemote { get; set; }

        ResourceMapping MainGroupResouceMapping { get; set; }
        BundleMappingDictionary MainGroupBundleMapping { get; }
        AssetMappingDictionary MainGroupAssetMapping { get; }
        UniTask<AssetMappingDictionary> GetAssetMappingByGroupId(string groupId);
        string BundleBasePathC { get; }
        string BundleBasePathP { get; }
        string BundleBasePathR { get; }
        void DownloadBundleAsync(CancellationTokenSource cts, string bundleName, long size, uint crc, string groupId, SubCatalog subCatalog, Action<float> onProgressChanged, Action onStarted, Action<bool> onCompleted, Action onCanceled, bool cacheSubCatalog = false, DownloadingPriority downloadingPriority = DownloadingPriority.Normal);
        bool RemoveBundle(string bundleName, string groupId);
#if DEBUG_LOG
        UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string assetPath, string groupId = "0");
#else
        UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string groupId = "0");
#endif
        UniTask<bool> CheckIfMainCatalogChanged();

        UniTask<string> FetchRemoteCatalogHashAsync();

        UniTask<bool> CheckIfMainCatalogChanged(string serverCatalogHash);
        void CacheMainCatalogHash(bool catalogHashChanged);
        void CacheMainCatalog(MainCatalog mainCatalog);
        UniTask<bool> DownloadMainCatalog();
        UniTask<CompareMainCatalogResult> CompareMainCatalogBetweenClientAndRemote();
        void DownloadOrRemoveChangedBundlesAsync(CancellationTokenSource cts, BundleInfoDictionary changedBundleInfoDict, bool isMainGroup, SubCatalog subCatalog, string groupId, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCancel, DownloadingPriority downloadingPriority);
        void DeleteAdditionalGroups(List<string> toDeleteGroupIdList);
        UniTask<bool> LoadMainCatalogClient();
        UniTask<bool> LoadMainGroupMappingFile();

        UniTaskVoid UpdateAssetGroup(CancellationTokenSource cts, string groupId, Action<long> onGetDownloadSize, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCanceled);

        bool ClearAssetGroup(string groupId);
        bool IsAssetGroupUptodate(string groupId);
        UniTask<BundleInfo> GetBundleInfo(string bundleName, string groupId = "0");
        UniTask<ResourceMapping> DownloadMappingFile(string groupId);
        UniTask<SubCatalog> DownloadSubCatalog(string groupId, bool cacheSubCatalog = false);
        IEnumerator LoadMainCatalogClientFromWebGL();
        UniTask<bool> LoadMainCatalogClientFromWebGLAsync();
    }

}
