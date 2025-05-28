using Game.Addresssables.AsyncOperations;
using Game.Addresssables.Common;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;

namespace Game.Addresssables.Module
{
    public interface IAssetModule : IModule
    {
        void LoadAssetAsync(string assetPath, Action<AsyncOperationBase> onCompleted, string groupId = "0", bool silent = false, bool iaAtals = false);

        bool IsLoadingAnyAsset();
    }

}
