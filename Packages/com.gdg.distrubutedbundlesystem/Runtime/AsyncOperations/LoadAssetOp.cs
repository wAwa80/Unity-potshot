using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using UnityEngine;

namespace Game.Addresssables.AsyncOperations
{
    public class LoadAssetOp : AsyncOperationBase
    {
#if DEBUG_LOG
        public string AssetPath => m_IsSubAsset ? m_AssetPath + "[" + m_SubKey + "]" : m_AssetPath;
#endif
        private string m_AssetPath;
        private string m_SubKey;
        private bool m_IsSubAsset;
        private bool m_IsArrayAsset; // ��ǰ��Ҫ���ص��Ƿ���array����(Atlas)�Ķ���
        private string m_GroupId;
        private bool m_Silent;
        private AssetBundle m_AssetBundle;
        private List<AssetBundleResource> depBundleResources = new List<AssetBundleResource>();

        internal void AddDepBundleResources(AssetBundleResource bundleResource)
        {
            depBundleResources.Add(bundleResource);
        }

        public void Init(Action<AsyncOperationBase> completed, string assetPath, string groupId, bool silent, bool isSubAsset, string subKey = null, bool isArrayAsset = false)
        {
            base.Init(completed);
            m_Silent = silent;
            if (!m_Silent)
            {
                ResourceProvider.IncreaseLoadingAssetsCount(
#if DEBUG_LOG
                     isSubAsset ? assetPath + "[" + subKey + "]" : assetPath
#endif
                    );
            }
            m_AssetPath = assetPath;
            m_IsSubAsset = isSubAsset;
            m_SubKey = m_IsSubAsset ? subKey : null;
            m_GroupId = groupId;
            m_IsArrayAsset = isArrayAsset; 
        }
        protected override void OnDecrementReferenceCount()
        {
            base.OnDecrementReferenceCount();
            foreach (AssetBundleResource bundleResource in depBundleResources)
            {
                bundleResource.referenceCount--;
                LoggerInternal.LogFormat("referenceCount of {0} decreased to {1}", bundleResource.bundleName, bundleResource.referenceCount);

#if DEBUG_LOG
                bundleResource.referencedAssets.Remove(AssetPath);
#endif
                if (bundleResource.referenceCount == 0)
                {
                    bundleResource.Unload();
                    ResourceProvider.RemoveBundleFromCache(bundleResource.bundleName);
                    LoggerInternal.LogFormat("successfully unload bundle: [{0}]", bundleResource.bundleName);
                }
            }
        }

        /// <summary>
        /// 强制释放所有AssetBundle
        /// </summary>
        protected override void ForceReleaseAssetBundle()
        {
            LoggerInternal.LogFormat("Force Release AssetBundle of {0} ",  m_AssetPath);
            base.ForceReleaseAssetBundle();
            foreach (AssetBundleResource bundleResource in depBundleResources)
            {
                bundleResource.referenceCount = 0;
                LoggerInternal.LogFormat("referenceCount of {0} decreased to {1}", bundleResource.bundleName, bundleResource.referenceCount);

#if DEBUG_LOG
                bundleResource.referencedAssets.Remove(AssetPath);
#endif
                if (bundleResource.referenceCount == 0)
                {
                    bundleResource.Unload();
                    ResourceProvider.RemoveBundleFromCache(bundleResource.bundleName);
                    LoggerInternal.LogFormat("successfully unload bundle: [{0}]", bundleResource.bundleName);
                }
            }
        }

        protected override void OnIncrementReferenceCount()
        {
            base.OnIncrementReferenceCount();
            foreach (AssetBundleResource bundleResource in depBundleResources)
            {
                bundleResource.referenceCount += 1;
#if DEBUG_LOG
                bundleResource.referencedAssets.Add(AssetPath);
#endif
            }
        }

        public async UniTaskVoid Start()
        {
            LoggerInternal.Log("@@@@Start m_AssetPath m_GroupId :" + m_AssetPath + ", group : " + m_GroupId);
            m_AssetBundle = await ResourceProvider.ProvideAssetBundle(m_AssetPath, m_GroupId, this);
            if (m_AssetBundle == null)
            {
                LoggerInternal.LogWarning($"can't load asset[{m_AssetPath}]");
                Complete(false);
                return;
            }
            AssetBundleRequest request = m_IsSubAsset ? m_AssetBundle.LoadAssetWithSubAssetsAsync<UnityEngine.Object>(m_AssetPath) :
            (m_IsArrayAsset ? m_AssetBundle.LoadAssetWithSubAssetsAsync<UnityEngine.Object>(m_AssetPath) : m_AssetBundle.LoadAssetAsync<UnityEngine.Object>(m_AssetPath));
            request.completed += OnLoadAssetCompleted;
        }

        private void OnLoadAssetCompleted(AsyncOperation obj)
        {
            AssetBundleRequest req = (AssetBundleRequest)obj;
            if (m_IsSubAsset)
            {
                if (req.allAssets != null)
                {
                    Result = req.allAssets[int.Parse(m_SubKey)];
                    Complete(Result != null);
                }
                else
                {
                    Complete(false);
                }
            }
            else if (m_IsArrayAsset)
            {
                if (req.allAssets != null)
                {
                    ResultArray = req.allAssets;
                    Complete(ResultArray != null);
                }
                else
                {
                    Complete(false);
                }
            }
            else
            {
                if (req.asset != null)
                {
                    Result = req.asset;
                    Complete(true);
                }
                else
                {
                    Complete(false);
                }
            }
        }
        public void Complete(bool success)
        {
            m_Status = success ? AsyncOperationStatus.Succeeded : AsyncOperationStatus.Failed;
            if (!m_Silent)
            {
                ResourceProvider.DecreaseLoadingAssetsCount(
#if DEBUG_LOG
                    AssetPath
#endif
                    );
            }
            InvokeCompletionEvent();
        }

#if UNITY_EDITOR
        public void FakeComplete(bool success)
        {
            if (success)
            {
                m_Status = AsyncOperationStatus.Succeeded;
            }
            else
            {
                m_Status = AsyncOperationStatus.Failed;
                LoggerInternal.LogErrorFormat("Failed to load asset: {0}[{1}]", m_AssetPath, m_SubKey);
            }
            InvokeCompletionEvent();
        }
        public override void Init(Action<AsyncOperationBase> completed)
        {
            base.Init(completed);
            depBundleResources = null;
        }
#endif
    }
}