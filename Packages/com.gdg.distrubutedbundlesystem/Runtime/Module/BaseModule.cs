using Game.Addresssables.Common;
using UnityEngine;
namespace Game.Addresssables.Module
{
    public abstract class BaseModule : MonoBehaviour, IModule
    {
        protected bool initialized = false;
        protected bool destroyed = false;
        public virtual void Init()
        {
            initialized = true;
        }

        public virtual void Destroy()
        {
            destroyed = true;
        }
    }
}
