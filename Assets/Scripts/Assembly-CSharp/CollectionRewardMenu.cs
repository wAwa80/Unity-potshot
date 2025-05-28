using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.UI;

public class CollectionRewardMenu : MonoBehaviour
{
		private void Start()
	{
		this.CollectionRewardPanel.SetActive(false);
		EventDispatcher.AddEventListener<CollectionRewardInfo>(Texts.EventShowCollectionReward, new Action<CollectionRewardInfo>(this.OnShowRewardPanel));
	}

		private void OnShowRewardPanel(CollectionRewardInfo rewardInfo)
	{
		this.currentRewardInfo = rewardInfo;
		RewardType type = rewardInfo.Type;
		if (type != RewardType.Cannon)
		{
			if (type == RewardType.Diamond)
			{
				this.ImgCannonIcon.gameObject.SetActive(false);
				this.ImgDiamondIcon.SetActive(true);
				this.TextDiamondCount.gameObject.SetActive(true);
				this.TextDiamondCount.text = "x" + this.currentRewardInfo.Count;
				this.ButtonEquipCannon.SetActive(false);
				this.ButtonSpinWheel.SetActive(true);
			}
		}
		else
		{
			this.ImgCannonIcon.gameObject.SetActive(true);
			this.ImgDiamondIcon.SetActive(false);
			this.ImgCannonIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + rewardInfo.RewardId);
			this.TextDiamondCount.gameObject.SetActive(false);
			this.ButtonEquipCannon.SetActive(true);
			this.ButtonSpinWheel.SetActive(false);
		}
		this.CollectionRewardPanel.SetActive(true);
	}

		public void OnClickBtnEquipNow()
	{
		RewardType type = this.currentRewardInfo.Type;
		if (type == RewardType.Cannon)
		{
			GameMenu.Instance.CurrentAvatarId = this.currentRewardInfo.RewardId;
			if (GameMenu.Instance.TrialCannonSubLevel <= 0)
			{
				GameWorld.Instance.PlayerCtrl.LoadAvatar(GameMenu.Instance.CurrentAvatarId);
                //print("测试6");
			}
		}
		// GameHelper.PlayInterstitialAd(delegate
		// {
		// 	this.OnClickCloseRewardPanel(false);
		// 	if (GameMenu.Instance.currentsubLevel == GameWorld.Instance.subLevelCount)
		// 	{
		// 		GameMenu.Instance.AlreadyRewardVideo = true;
		// 	}
		// }, Texts.VideoParameterGetConllectionCannon, GameMenu.Instance.currentLevel.ToString());

		this.OnClickCloseRewardPanel(false);
		if (GameMenu.Instance.currentsubLevel == GameWorld.Instance.subLevelCount)
		{
			GameMenu.Instance.AlreadyRewardVideo = true;
		}
        //if (IronSourceEvents.Instance.isInterstitialReady())
        //{
        //    IronSourceEvents.Instance.showInterstitial();
        //    //hack  买7
        //    if (Analytics.Instance != null)
        //    {
        //        IronSourceEvents.interClose(AllDataInGameTest.InterstitialAllCount);
        //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");
        //        Analytics.Instance.SendMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");

        //    }
        //}
        //else
        //{
        //    IronSource.Agent.loadInterstitial();
        //}
    }

		public void OnClickBtnSpinWheel()
	{
		GameHelper.LogEvent(Texts.StatisticsEventCollectionSpinPanelShow, new string[0]);
		GameMenu.Instance.SpinWheelPanel.SetActive(true);
		GameMenu.Instance.SpinWheelPanel.GetComponent<SpinWheel>().Init(this.currentRewardInfo.Count, delegate
		{
			if (GameMenu.Instance.state == GameState.LevelUp)
			{
				GameMenu.Instance.winPanel.SetActive(true);
			}
		}, SpinOrigin.CollectionDiamond);
		this.OnClickCloseRewardPanel(true);
	}

		public void OnClickCloseRewardPanel(bool ignoreWinPanel)
	{
		this.CollectionRewardPanel.SetActive(false);
		if (!ignoreWinPanel && GameMenu.Instance.state == GameState.LevelUp)
		{
			GameMenu.Instance.winPanel.SetActive(true);
		}
	}

		private void Update()
	{
	}

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener<CollectionRewardInfo>(Texts.EventShowCollectionReward, new Action<CollectionRewardInfo>(this.OnShowRewardPanel));
	}

		public GameObject CollectionRewardPanel;

		public Image ImgCannonIcon;

		public GameObject ImgDiamondIcon;

		public GameObject ButtonEquipCannon;

		public GameObject ButtonSpinWheel;

		public Text TextDiamondCount;

		private CollectionRewardInfo currentRewardInfo;
}
