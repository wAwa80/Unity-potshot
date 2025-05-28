using System;
using GameCenter.Util;
using UnityEngine;

namespace GameCenter.GameCenter
{
		public class GameCenterManager : MonoBehaviour
	{
				private void Awake()
		{
			if (GameCenterManager.Instance == null)
			{
				GameCenterManager.Instance = this;
				this._gameCenterCanvas = base.transform.GetChild(0).gameObject;
				UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			}
		}

				private void OnDestroy()
		{
			GameCenterManager.Instance = null;
		}

				public bool ShowGameCenter()
		{
			if (this._gameCenterCanvas != null)
			{
				this._gameCenterCanvas.SetActive(true);
				return true;
			}
			return false;
		}

				public void HindGameCenter()
		{
			this._gameCenterCanvas.SetActive(false);
		}

				public static void ShowNativeGameCenter()
		{
			GameCenterAndroidUtil.StartGameCenterActivity("org.machsystem.recommend.GameCenterActivity");
		}

				private const string NativeGameCenterName = "org.machsystem.recommend.GameCenterActivity";

				public static GameCenterManager Instance;

				private GameObject _gameCenterCanvas;
	}
}
