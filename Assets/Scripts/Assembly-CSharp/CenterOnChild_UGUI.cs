using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class CenterOnChild_UGUI : MonoBehaviour, IEndDragHandler, IDragHandler, IBeginDragHandler, IEventSystemHandler
{
				public Transform _content { get; set; }

			public GameObject CurCenterChildItem
	{
		get
		{
			GameObject result = null;
			if (this._content != null && this._curCenterChildIndex >= 0 && this._curCenterChildIndex < this._content.childCount)
			{
				result = this._content.GetChild(this._curCenterChildIndex).gameObject;
			}
			return result;
		}
	}

		private void Awake()
	{
		this._curCenterChildIndex = 0;
		this._scrollView = base.GetComponent<ScrollRect>();
		if (this._scrollView == null)
		{
			Debug.LogError("错误：ScrollRect为空");
			return;
		}
		this._content = this._scrollView.content;
		LayoutGroup component = this._content.GetComponent<LayoutGroup>();
		if (component == null)
		{
			Debug.LogError("错误：LayoutGroup Component为空");
		}
		this._scrollView.movementType = ScrollRect.MovementType.Unrestricted;
		ScrollDir_UGUI dir = this.Dir;
		if (dir != ScrollDir_UGUI.Horizontal)
		{
			if (dir == ScrollDir_UGUI.Vertical)
			{
				if (component is VerticalLayoutGroup)
				{
					float num = -this._scrollView.GetComponent<RectTransform>().rect.height * 0.5f + this.GetChildItemHeight(0) * 0.5f;
					float spacing = (component as VerticalLayoutGroup).spacing;
					this._childrenPos.Add(num);
					for (int i = 1; i < this._content.childCount; i++)
					{
						num += this.GetChildItemHeight(i) * 0.5f + this.GetChildItemHeight(i - 1) * 0.5f + spacing;
						this._childrenPos.Add(num);
					}
				}
				else if (component is GridLayoutGroup)
				{
					GridLayoutGroup gridLayoutGroup = component as GridLayoutGroup;
					float num2 = -this._scrollView.GetComponent<RectTransform>().rect.height * 0.5f + gridLayoutGroup.cellSize.y * 0.5f;
					this._childrenPos.Add(num2);
					for (int j = 1; j < this._content.childCount; j++)
					{
						num2 += gridLayoutGroup.cellSize.y + gridLayoutGroup.spacing.y;
						this._childrenPos.Add(num2);
					}
				}
				else
				{
					Debug.LogError("错误：Vertical ScrollView正在使用HorizontalLayoutGroup");
				}
			}
		}
		else if (component is HorizontalLayoutGroup)
		{
			float num3 = this._scrollView.GetComponent<RectTransform>().rect.width * 0.5f - this.GetChildItemWidth(0) * 0.5f;
			float spacing = (component as HorizontalLayoutGroup).spacing;
			this._childrenPos.Add(num3);
			for (int k = 1; k < this._content.childCount; k++)
			{
				num3 -= this.GetChildItemWidth(k) * 0.5f + this.GetChildItemWidth(k - 1) * 0.5f + spacing;
				this._childrenPos.Add(num3);
			}
		}
		else if (component is GridLayoutGroup)
		{
			GridLayoutGroup gridLayoutGroup2 = component as GridLayoutGroup;
			float num4 = this._scrollView.GetComponent<RectTransform>().rect.width * 0.5f - gridLayoutGroup2.cellSize.x * 0.5f;
			this._childrenPos.Add(num4);
			for (int l = 0; l < this._content.childCount - 1; l++)
			{
				num4 -= gridLayoutGroup2.cellSize.x + gridLayoutGroup2.spacing.x;
				this._childrenPos.Add(num4);
			}
		}
		else
		{
			Debug.LogError("错误：Horizontal ScrollView正在使用VerticalLayoutGroup");
		}
	}

		private void OnEnable()
	{
		this.SetCenterChild(GameDataManager.PlayerAvatarIds.IndexOf(GameMenu.Instance.CurrentAvatarId));
	}

		private float GetChildItemWidth(int index)
	{
		return (this._content.GetChild(index) as RectTransform).sizeDelta.x;
	}

		private float GetChildItemHeight(int index)
	{
		return (this._content.GetChild(index) as RectTransform).sizeDelta.y;
	}

		private void Update()
	{
		for (int i = 0; i < this._content.childCount; i++)
		{
			float num = 1f;
			Transform child = this._content.GetChild(i);
			RectTransform rectTransform = child as RectTransform;
			ScrollDir_UGUI dir = this.Dir;
			if (dir != ScrollDir_UGUI.Horizontal)
			{
				if (dir == ScrollDir_UGUI.Vertical)
				{
					num = Mathf.Abs(child.localPosition.y + this._content.localPosition.y - this._scrollView.viewport.rect.height * 0.5f - this._scrollView.transform.localPosition.y) / rectTransform.sizeDelta.y;
				}
			}
			else
			{
				num = Mathf.Abs(child.localPosition.x + this._content.localPosition.x - this._scrollView.viewport.rect.width * 0.5f - this._scrollView.transform.localPosition.x) / rectTransform.sizeDelta.x;
			}
			num = Mathf.Clamp(num, 0f, 1f);
			float z = 1f + (1f - num) * (this.MaxScale - 1f);
			this.scaleTemp.x = (this.scaleTemp.y = (this.scaleTemp.z = z));
			child.localScale = this.scaleTemp;
		}
	}

		public void OnDrag(PointerEventData eventData)
	{
	}

		public void OnEndDrag(PointerEventData eventData)
	{
		ScrollDir_UGUI dir = this.Dir;
		if (dir != ScrollDir_UGUI.Horizontal)
		{
			if (dir == ScrollDir_UGUI.Vertical)
			{
				this._targetPos = this.FindClosestChildPos(this._content.localPosition.y, out this._curCenterChildIndex);
				LeanTween.moveLocalY(this._content.gameObject, this._targetPos, this.MoveTime).setEaseInSine();
			}
		}
		else
		{
			this._targetPos = this.FindClosestChildPos(this._content.localPosition.x, out this._curCenterChildIndex);
			LeanTween.moveLocalX(this._content.gameObject, this._targetPos, this.MoveTime).setEaseInSine();
		}
		if (this.ActionOnEndDrag != null)
		{
			this.ActionOnEndDrag(this._curCenterChildIndex);
		}
	}

		public void OnBeginDrag(PointerEventData eventData)
	{
		this._curCenterChildIndex = -1;
		if (this.ActionOnBeginDrag != null)
		{
			this.ActionOnBeginDrag();
		}
	}

		private float FindClosestChildPos(float currentPos, out int curCenterChildIndex)
	{
		float result = 0f;
		float num = float.PositiveInfinity;
		curCenterChildIndex = -1;
		for (int i = 0; i < this._childrenPos.Count; i++)
		{
			float num2 = this._childrenPos[i];
			float num3 = Mathf.Abs(num2 - currentPos);
			if (num3 < num)
			{
				num = num3;
				result = num2;
				curCenterChildIndex = i;
			}
		}
		return result;
	}

		public void SetCenterChild(int _index)
	{
		this._curCenterChildIndex = _index;
		this._targetPos = this._childrenPos[_index];
		ScrollDir_UGUI dir = this.Dir;
		if (dir != ScrollDir_UGUI.Horizontal)
		{
			if (dir == ScrollDir_UGUI.Vertical)
			{
				LeanTween.moveLocalY(this._content.gameObject, this._targetPos, this.MoveTime).setEaseInSine();
			}
		}
		else
		{
			LeanTween.moveLocalX(this._content.gameObject, this._targetPos, this.MoveTime).setEaseInSine();
		}
		if (this.ActionOnEndDrag != null)
		{
			this.ActionOnEndDrag(this._curCenterChildIndex);
		}
	}

		public ScrollDir_UGUI Dir;

		public float MoveTime = 0.2f;

		public float MaxScale = 3f;

		private ScrollRect _scrollView;

		private List<float> _childrenPos = new List<float>();

		private float _targetPos;

		private int _curCenterChildIndex;

		public Action ActionOnBeginDrag;

		public Action<int> ActionOnEndDrag;

		private Vector3 scaleTemp = Vector3.one;
}
