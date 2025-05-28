using System;
using System.Collections.Generic;
using UnityEngine;

namespace GameCenter.Util
{
		public class Loom : MonoBehaviour
	{
				public static void Init()
		{
			object executeOnMainThreadQueue = Loom.ExecuteOnMainThreadQueue;
			lock (executeOnMainThreadQueue)
			{
				if (Loom.Instace == null)
				{
					GameObject gameObject = new GameObject("Loom");
					Loom.Instace = gameObject.AddComponent<Loom>();
				}
			}
		}

				private void Awake()
		{
			UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
		}

				public void ExecuteOnMainThread(Action action)
		{
			if (action != null)
			{
				object executeOnMainThreadQueue = Loom.ExecuteOnMainThreadQueue;
				lock (executeOnMainThreadQueue)
				{
					Loom.ExecuteOnMainThreadQueue.Enqueue(action);
				}
			}
		}

				private void Update()
		{
			while (Loom.ExecuteOnMainThreadQueue.Count > 0)
			{
				Action action = Loom.ExecuteOnMainThreadQueue.Dequeue();
				if (action != null)
				{
					action();
				}
			}
		}

				private void OnDestroy()
		{
			UnityEngine.Object.Destroy(base.gameObject);
			Loom.Instace = null;
		}

				public static Loom Instace;

				private static readonly Queue<Action> ExecuteOnMainThreadQueue = new Queue<Action>();
	}
}
