using System;
using System.Collections;
using GameCenter.Util;
using UnityEngine;

namespace GameCenter.GameCenterButton
{
		public class GameCenterButtonBar : Singleton<GameCenterButtonBar>
	{
				protected override void Awake()
		{
			base.Awake();
			this._targetPosition = base.transform.Find("ButtonMoveTarget").GetComponent<RectTransform>().anchoredPosition;
			this._originPosition = this._buttonRectTransform.anchoredPosition;
			float num = Vector3.Distance(this._targetPosition, this._originPosition);
			this._moveSpeed = num / this.moveTime;
			this.StartMove();
		}

				public void StartMove()
		{
			this._buttonRectTransform.anchoredPosition = this._originPosition;
			base.StartCoroutine(this.C_Move());
		}

				private IEnumerator C_Move()
		{
			while (this._buttonRectTransform.anchoredPosition.x > this._targetPosition.x)
			{
				this._buttonRectTransform.anchoredPosition = this._buttonRectTransform.anchoredPosition - new Vector2(this._moveSpeed * Time.deltaTime, 0f);
				yield return 0;
			}
			this._buttonRectTransform.anchoredPosition = this._targetPosition;
			Singleton<GameCenterButton>.Instance.StartAnimation();
			yield break;
		}

				[Header("游戏中心按钮")]
		public RectTransform _buttonRectTransform;

				[Header("飞入动画持续时间")]
		public float moveTime;

				private Vector3 _targetPosition;

				private float _moveSpeed;

				private Vector3 _originPosition;
	}
}
