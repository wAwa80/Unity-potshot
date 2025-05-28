using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class ChunkSlice : MonoBehaviour
{
		private void Start()
	{
		this.myIndex = base.transform.GetSiblingIndex();
		this.rewardType = SpinWheelSetup.Instance.rewarItem[this.myIndex].rewardType;
		this.iconSpRend.overrideSprite = SpinWheelSetup.Instance.rewarItem[this.myIndex].rewardSprite;
		switch (this.rewardType)
		{
		case RewardType.Diamond:
			if (this.ImgTrial != null)
			{
				this.ImgTrial.SetActive(false);
			}
			this.valueText.text = SpinWheelSetup.Instance.rewarItem[this.myIndex].rewardQuantity.ToString();
			if (this.diamondRatioText != null)
			{
				this.diamondRatioText.gameObject.SetActive(false);
			}
			break;
		case RewardType.SuperFire:
			if (this.ImgTrial != null)
			{
				this.ImgTrial.SetActive(true);
			}
			this.valueText.text = string.Empty;
			if (this.diamondRatioText != null)
			{
				this.diamondRatioText.gameObject.SetActive(false);
			}
			break;
		case RewardType.Cannon:
			if (this.ImgTrial != null)
			{
				this.ImgTrial.SetActive(true);
			}
			this.valueText.text = string.Empty;
			if (this.diamondRatioText != null)
			{
				this.diamondRatioText.gameObject.SetActive(false);
			}
			break;
		case RewardType.DiamondRatio:
			if (this.ImgTrial != null)
			{
				this.ImgTrial.SetActive(false);
			}
			if (this.diamondRatioText != null)
			{
				this.diamondRatioText.text = SpinWheelSetup.Instance.rewarItem[this.myIndex].rewardQuantity.ToString();
				this.diamondRatioText.gameObject.SetActive(true);
			}
			break;
		}
	}

		public void UpdateValueText(string text)
	{
		this.valueText.text = text;
	}

		private void OnTriggerEnter2D(Collider2D other)
	{
		this.spRend.overrideSprite = SpinWheel.Instance.chunkSp[1];
	}

		private void OnTriggerExit2D(Collider2D other)
	{
		this.spRend.overrideSprite = SpinWheel.Instance.chunkSp[0];
	}

		public void AnimatePoints(bool animate)
	{
		if (animate)
		{
			base.StartCoroutine(this.AnimatePointsRoutine());
		}
		else
		{
			base.StopAllCoroutines();
			foreach (PointCollider pointCollider in this.pointCollider)
			{
				if (pointCollider)
				{
					pointCollider.pointSprite.overrideSprite = SpinWheel.Instance.pointSp[0];
				}
			}
		}
	}

		private IEnumerator AnimatePointsRoutine()
	{
		if (this.pointCollider[0])
		{
			this.pointCollider[0].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[1];
		}
		yield return new WaitForSeconds(0.1f);
		if (this.pointCollider[0])
		{
			this.pointCollider[0].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[0];
		}
		if (this.pointCollider[1])
		{
			this.pointCollider[1].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[1];
		}
		yield return new WaitForSeconds(0.1f);
		if (this.pointCollider[1])
		{
			this.pointCollider[1].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[0];
		}
		if (this.pointCollider[2])
		{
			this.pointCollider[2].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[1];
		}
		yield return new WaitForSeconds(0.1f);
		if (this.pointCollider[2])
		{
			this.pointCollider[2].pointSprite.overrideSprite = SpinWheel.Instance.pointSp[0];
		}
		this.AnimatePoints(true);
		yield break;
	}

		public Image iconSpRend;

		public Image spRend;

		public RewardType rewardType;

		public Text valueText;

		public Text diamondRatioText;

		public PointCollider[] pointCollider;

		public GameObject ImgTrial;

		private int myIndex;
}
