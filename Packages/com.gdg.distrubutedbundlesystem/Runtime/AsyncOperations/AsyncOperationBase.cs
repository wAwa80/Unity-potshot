using Game.Addresssables.Common;
using System;
using UObject = UnityEngine.Object;

namespace Game.Addresssables.AsyncOperations
{
    public abstract class AsyncOperationBase
    {
        private int m_ReferenceCount = 1;

        public UObject Result;

        public UObject[] ResultArray;

        public AsyncOperationStatus m_Status;

        private Action<AsyncOperationBase> Completed;
        public virtual void Init(Action<AsyncOperationBase> completed)
        {
            Completed = completed;
        }

        internal void InvokeCompletionEvent()
        {
            try
            {
                Completed?.Invoke(this);
            }
            catch (Exception ex)
            {
                LoggerInternal.LogError($"AsyncOperationBase Error: [{ex}]");
            }
            Completed = null;
        }

        public void Retain()
        {
            m_ReferenceCount++;
            OnIncrementReferenceCount();
        }
        public void Release()
        {
            m_ReferenceCount--;
            OnDecrementReferenceCount();
        }

        public void ForceRelelase()
        {
            ForceReleaseAssetBundle();
        }
        protected virtual void ForceReleaseAssetBundle() { }
        protected virtual void OnDecrementReferenceCount() { }

        protected virtual void OnIncrementReferenceCount() { }

    }
}