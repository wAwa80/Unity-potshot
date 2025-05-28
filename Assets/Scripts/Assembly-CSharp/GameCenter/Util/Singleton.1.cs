using System;
using UnityEngine;

namespace GameCenter.Util
{
		public class Singleton<T> : MonoBehaviour where T : Singleton<T>
	{
				protected virtual void Awake()
		{
			if (Singleton<T>.Instance == null)
			{
				Singleton<T>.Instance = (T)((object)this);
			}
			else
			{
				Debug.LogError("场景中已经有一个实例化的" + typeof(T) + "脚本");
			}
		}

				private void OnDestroy()
		{
			Singleton<T>.Instance = (T)((object)null);
		}

				public static T Instance;
	}
}
