using System;
using GameCenter.GameCenter;
using GameCenter.Util;
using UnityEngine;

namespace GameCenter.GameCenterButton
{
		public class GameCenterButton : Singleton<GameCenterButton>
	{
				protected override void Awake()
		{
			base.Awake();
			this._shake = base.GetComponent<Animator>();
			this._rectTransform = base.GetComponent<RectTransform>();
		}

				public void StartAnimation()
		{
			this._shake.enabled = true;
			if (this.AnimationTime > 0)
			{
				base.Invoke("StopAnimation", (float)this.AnimationTime);
			}
		}

				public void StopAnimation()
		{
			this._rectTransform.rotation = Quaternion.identity;
			this._shake.enabled = false;
		}

				public void OnGameCenterClick()
		{
			if (this.UseNativeGameCenter)
			{
				GameCenterManager.ShowNativeGameCenter();
			}
			else if (!GameCenterManager.Instance.ShowGameCenter())
			{
				GameCenterManager.ShowNativeGameCenter();
			}
		}

				[Header("是否使用原生游戏中心")]
		public bool UseNativeGameCenter;

				[Header("动画播放时长，0表示一直播放")]
		public int AnimationTime = 3;

				private Animator _shake;

				private RectTransform _rectTransform;
	}
}
