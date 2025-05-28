using System;
using UnityEngine;
using UnityEngine.UI;

public class CollectionRewardButton : MonoBehaviour
{
		private void Start()
	{
	}

		public void Init(string collectionId, bool rewarded, int unlockedCount, CollectionRewardInfo rewardInfo, int rewardIndex)
	{
		this.CollectionId = collectionId;
		this.RewardInfo = rewardInfo;
		this.UnlockedCount = unlockedCount;
		this.RewardIndex = rewardIndex;
		this.ImgIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + rewardInfo.RewardId);
		this.TextCount.text = "x" + rewardInfo.Count;
		if (rewarded)
		{
			this.State = CollectionRewardState.Rewarded;
		}
		else if (unlockedCount >= rewardInfo.CollectionCount)
		{
			this.State = CollectionRewardState.CanGet;
		}
		else
		{
			this.State = CollectionRewardState.Locked;
		}
		this.UpdateState();
	}

		private void UpdateState()
	{
		CollectionRewardState state = this.State;
		if (state != CollectionRewardState.Locked)
		{
			if (state != CollectionRewardState.CanGet)
			{
				if (state == CollectionRewardState.Rewarded)
				{
					this.ImgMask.SetActive(false);
					this.ImgGet.SetActive(false);
				}
			}
			else
			{
				this.ImgMask.SetActive(false);
				this.ImgGet.SetActive(true);
			}
		}
		else
		{
			this.TextCurrent.text = this.UnlockedCount.ToString();
			this.TextTarget.text = this.RewardInfo.CollectionCount.ToString();
			this.ImgMask.SetActive(true);
			this.ImgGet.SetActive(false);
		}
	}

		private void Update()
	{
	}

		public void OnClick()
	{
		if (this.State == CollectionRewardState.CanGet)
		{
			RewardType type = this.RewardInfo.Type;
			if (type != RewardType.Diamond)
			{
				if (type == RewardType.Cannon)
				{
					GameMenu.Instance.UnlockedAvatarIds.Add(this.RewardInfo.RewardId);
				}
			}
			else
			{
				EventDispatcher.TriggerEvent<Vector3>(Texts.EventSpawnUIDiamonds, base.transform.position);
				EventDispatcher.TriggerEvent<int>(Texts.EventSpinRewardDiamond, this.RewardInfo.Count);
			}
			EventDispatcher.TriggerEvent<CollectionRewardInfo>(Texts.EventShowCollectionReward, this.RewardInfo);
			GameMenu.Instance.CollectionRewardedIndexsDic[this.CollectionId].Add(this.RewardIndex);
			this.State = CollectionRewardState.Rewarded;
			this.UpdateState();
		}
		else if (this.State == CollectionRewardState.Locked)
		{
			EventDispatcher.TriggerEvent(Texts.EventShakeUI);
		}
	}

		public Image ImgIcon;

		public GameObject ImgMask;

		public GameObject ImgGet;

		public Text TextCurrent;

		public Text TextTarget;

		public Text TextCount;

		private CollectionRewardState State;

		private CollectionRewardInfo RewardInfo;

		private string CollectionId;

		private int UnlockedCount;

		private int RewardIndex;
}
