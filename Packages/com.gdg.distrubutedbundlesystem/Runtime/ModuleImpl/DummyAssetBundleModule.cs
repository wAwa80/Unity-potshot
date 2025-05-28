#if UNITY_EDITOR
using Game.Addresssables.Common;
using Game.Addresssables.Module;
using Game.Addresssables.Type;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using System.Collections;

namespace Game.Addresssables.ModuleImpl
{
    public class DummyAssetBundleModule : BaseModule, IAssetBundleModule
    {
        public string BundleBasePathC => throw new System.NotImplementedException();

        public string BundleBasePathP => throw new System.NotImplementedException();

        public string BundleBasePathR => throw new System.NotImplementedException();

        public MainCatalog MainCatalogClient { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        public MainCatalog MainCatalogRemote { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        public AssetMappingDictionary MainGroupAssetMapping { get => throw new NotImplementedException(); }
        public BundleMappingDictionary MainGroupBundleMapping { get => throw new NotImplementedException(); }
        public ResourceMapping MainGroupResouceMapping { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

#if DEBUG_LOG
        public async UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string assetPath, string groupId = "0")
#else
        public async UniTask<AssetBundle> LoadBundleFromFile(string bundleName, Action<AssetBundleResource> onAddedToCache, string groupId = "0")
#endif
        {
            await UniTask.Yield();
            return null;
        }

        public bool RemoveBundle(string bundleName, string groupId)
        {
            return false;
        }

        public async UniTask<bool> CheckIfMainCatalogChanged()
        {
            await UniTask.Yield();
            return false;
        }

        public void CacheMainCatalogHash(bool catalogHashChanged)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }
        public void CacheMainCatalog(MainCatalog mainCatalog)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }
        public async UniTask<bool> DownloadMainCatalog()
        {
            await UniTask.Yield();
            return false;
        }

        public async UniTask<CompareMainCatalogResult> CompareMainCatalogBetweenClientAndRemote()
        {
            await UniTask.Yield();
            return default;
        }

        public void DeleteAdditionalGroups(List<string> toDeleteGroupIdList)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }

        public async UniTask<bool> LoadMainCatalogClient()
        {
            await UniTask.Yield();
            return false;
        }

        public async UniTask<bool> LoadMainGroupMappingFile()
        {
            await UniTask.Yield();
            return false;
        }

        public bool ClearAssetGroup(string groupId)
        {
            return false;
        }

        public bool IsAssetGroupUptodate(string groupId)
        {
            return true;
        }

        public async UniTask<ResourceMapping> DownloadMappingFile(string groupId)
        {
            await UniTask.Yield();
            return null;
        }

        public async UniTask<BundleInfo> GetBundleInfo(string bundleName, string groupId = "0")
        {
            await UniTask.Yield();
            return null;
        }

        public async UniTask<AssetMappingDictionary> GetAssetMappingByGroupId(string groupId)
        {
            await UniTask.Yield();
            return null;
        }

        public void CancelDownloadAssetGroup(string groupId)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }

        public async UniTaskVoid UpdateAssetGroup(CancellationTokenSource cts, string groupId, Action<long> onGetDownloadSize, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCanceled)
        {
            LoggerInternal.Log("dummy method! won't change anything");
            await UniTask.Yield();
        }

        public void DownloadBundleAsync(CancellationTokenSource cts, string bundleName, long size, uint crc, string groupId, SubCatalog subCatalog, Action<float> onProgressChanged, Action onStarted, Action<bool> onCompleted, Action onCanceled, bool cacheSubCatalog = false, DownloadingPriority downloadingPriority = DownloadingPriority.Normal)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }

        public void DownloadOrRemoveChangedBundlesAsync(CancellationTokenSource cts, BundleInfoDictionary changedBundleInfoDict, bool isMainGroup, SubCatalog subCatalog, string groupId, Action<float> onProgressValueChanged, Action<bool> onCompleted, Action onCancel, DownloadingPriority downloadingPriority)
        {
            LoggerInternal.Log("dummy method! won't change anything");
        }

        public async UniTask<bool> CheckIfMainCatalogChanged(string serverCatalogHash)
        {
            await UniTask.Yield();
            return false;
        }

        public async UniTask<string> FetchRemoteCatalogHashAsync()
        {
            LoggerInternal.Log("dummy method! won't change anything");
            await UniTask.Yield();
            return null;
        }

        public async UniTask<SubCatalog> DownloadSubCatalog(string groupId, bool cacheSubCatalog = false)
        {
            await UniTask.Yield();
            return null;
        }

        public IEnumerator LoadMainCatalogClientFromWebGL()
        {
            throw new NotImplementedException();
        }

        public async UniTask<bool> LoadMainCatalogClientFromWebGLAsync()
        {
            await UniTask.Yield();
            return false;
        }
    }
}
#endif