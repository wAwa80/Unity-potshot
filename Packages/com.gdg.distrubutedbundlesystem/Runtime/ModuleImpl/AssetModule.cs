using Game.Addresssables.AsyncOperations;
using Game.Addresssables.Module;
using Game.Addresssables.Utils;
using System;

namespace Game.Addresssables.ModuleImpl
{
    public class AssetModule : BaseModule, IAssetModule
    {
        public override void Init()
        {
            if (initialized)
            {
                return;
            }
            base.Init();
            ResourceProvider.ResetLoadedAssetsCount();
        }

        public void LoadAssetAsync(string assetPath, Action<AsyncOperationBase> onCompleted, string groupId = "0", bool silent = false, bool isAtlas = false)
        {
            bool isSubAsset;
            string resourceKey;
            bool isArrayAsset;
            UnityEngine.Object[] resultArray = null;
            if (GameUtils.ExtractKeyAndSubKey(assetPath, out string mainKey, out string subKey))
            {
                resourceKey = mainKey;
                isSubAsset = true;
                isArrayAsset = false;
            }
            else if (isAtlas)
            {
                resourceKey = assetPath;
                isSubAsset = false;
                isArrayAsset = true;
            }
            else
            {
                resourceKey = assetPath;
                isSubAsset = false;
                isArrayAsset = false;
            }

            LoadAssetOp op = new LoadAssetOp();
            op.Init(onCompleted, resourceKey, groupId, silent, isSubAsset, subKey, isArrayAsset);
            op.Start().Forget();
        }

        public bool IsLoadingAnyAsset()
        {
            return ResourceProvider.LoadingAssetsCount > 0;
        }


    }
}