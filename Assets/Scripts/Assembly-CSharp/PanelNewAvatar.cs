using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.UI;

public class PanelNewAvatar : MonoBehaviour
{
		private void Awake()
	{
		EventDispatcher.AddEventListener<bool, string>(Texts.EventShowNewAvatar, new Action<bool, string>(this.Show));
	}

		private void Start()
	{
	}

		private void Update()
	{
	}

		private void Show(bool show, string avatarId)
	{
		if (show)
		{
			this.NewAvatar.SetActive(show);
			this.info = GameDataManager.AvatarInfoDatas[GameDataManager.PlayerAvatarIds.IndexOf(avatarId)];
			this.ImgIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + avatarId);
			if (GameMenu.Instance.currentLevel >= this.info.UnlockLevel)
			{
				this.TextDiamond.text = this.info.UnlockDiamond.ToString();
				this.BtnDiamond.SetActive(true);
				this.BtnVideo.SetActive(false);
			}
			else
			{
				this.TextDiamondVideo.text = this.info.UnlockDiamond.ToString();
				this.BtnDiamond.SetActive(false);
				this.BtnVideo.SetActive(true);
			}
		}
		else
		{
			this.NewAvatar.SetActive(show);
		}
	}

		public void OnClickDiamond()
	{
		if (GameMenu.Instance.currentLevel >= this.info.UnlockLevel && GameMenu.Instance.Diamond >= this.info.UnlockDiamond)
		{
			GameHelper.LogEvent(Texts.StatisticsEventBuyAvatarOnNewWindowDiamond, new string[0]);
			MachbirdSDKHelper.LogBuy(this.info.Id);
			GameMenu.Instance.AddDiamond(this.info.UnlockDiamond * -1);
			GameMenu.Instance.UnlockedAvatarIds.Add(this.info.Id);
			// GameHelper.PlayInterstitialAd(new Action(this.OnClickUse), Texts.VideoParameterBuyAvatar, GameMenu.Instance.currentLevel.ToString());
			this.OnClickUse();
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
	}

		public void OnClickVideo()
	{
		GameHelper.LogEvent(Texts.StatisticsEventBuyAvatarOnNewWindowVideo, new string[]
		{
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
		GameHelper.PlayRewardVideo(this.OnVideoReward, this.OnVideoEnd, this.OnVideoFailed, Texts.VideoParameterBuyAvatarOnNewWindow, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
	}

		private void OnVideoReward()
	{
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		GameHelper.LogEvent(Texts.StatisticsEventBuyAvatarOnNewWindowVideoSucceed, new string[]
		{
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
		MachbirdSDKHelper.LogBuy(this.info.Id);
		GameMenu.Instance.AddDiamond(this.info.UnlockDiamond * -1);
		GameMenu.Instance.UnlockedAvatarIds.Add(this.info.Id);
		this.OnClickUse();
	}

		private void OnVideoEnd()
	{
		//IronSourceEvents.onRewardedVideoAdEndedEvent -= this.OnVideoEnd;
		//IronSourceEvents.onRewardedVideoAdClosedEvent -= this.OnVideoEnd;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
	}

		private void OnVideoFailed()
	{
		//IronSourceEvents.onRewardedVideoAdShowFailedEvent -= this.OnVideoFailed;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
		{
			Content = Texts.String_VideoFailedContent
		});
	}

		private void OnClickUse()
	{
		if (!GameMenu.Instance.RedDotAvatarIds.Contains(this.info.Id))
		{
			GameMenu.Instance.RedDotAvatarIds.Add(this.info.Id);
		}
		GameMenu.Instance.CurrentAvatarId = this.info.Id;
		if (GameMenu.Instance.TrialCannonSubLevel <= 0)
		{
			GameWorld.Instance.PlayerCtrl.LoadAvatar(GameMenu.Instance.CurrentAvatarId);
            //print("测试6");
        }
		GameMenu.Instance.UpdateUnlockInfo();
		this.OnClickClose();
	}

		public void OnClickClose()
	{
		this.NewAvatar.SetActive(false);
	}

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener<bool, string>(Texts.EventShowNewAvatar, new Action<bool, string>(this.Show));
	}

		public GameObject NewAvatar;

		public Image ImgIcon;

		public GameObject BtnVideo;

		public GameObject BtnDiamond;

		public Text TextDiamond;

		public Text TextDiamondVideo;

		private AvatarInfo info;
}
