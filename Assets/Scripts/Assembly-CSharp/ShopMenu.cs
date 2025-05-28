using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.UI;

public class ShopMenu : MonoBehaviour
{

	private static ShopMenu instance;

	public static ShopMenu Instance
    {
        get
        {
			return instance; 
		}
    }

	void Awake ()
	{
		instance = this;
		this.BtnPriceCanUseImg = Resources.Load<Sprite>(Texts.ShopDiamondButtonImg0);
		this.BtnPriceCantUseImg = Resources.Load<Sprite>(Texts.ShopDiamondButtonImg1);
        Debug.Log("shop img");
	}

		private void OnEnable()
	{
		base.transform.localPosition = Vector3.zero;
		this.BtnVideo.gameObject.SetActive(false);
	}

		private void Start()
	{
		for (int i = 0; i < GameDataManager.PlayerAvatarIds.Count; i++)
		{
			string avatarId = GameDataManager.PlayerAvatarIds[i];
			AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[i];
			if (avatarInfo.UnlockType != UnlockType.SpinWheel)
			{
				GameObject original = Resources.Load<GameObject>(Texts.UIAvatarPlatformItemPath);
				GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(original, Vector3.zero, Quaternion.identity);
				gameObject.transform.parent = this.ScrollContent;
				gameObject.transform.localPosition = Vector3.zero;
				gameObject.transform.localScale = Vector3.one;
				gameObject.transform.GetComponent<AvatarPlatformItem>().Init (avatarId, i);
			}
		}
		CenterOnChild_UGUI scrollView = this.ScrollView;
		scrollView.ActionOnBeginDrag = (Action)Delegate.Combine(scrollView.ActionOnBeginDrag, new Action(this.OnScrollViewBeginDrag));
		CenterOnChild_UGUI scrollView2 = this.ScrollView;
		scrollView2.ActionOnEndDrag = (Action<int>)Delegate.Combine(scrollView2.ActionOnEndDrag, new Action<int>(this.OnScrollViewEndDrag));
		this.ScrollView.gameObject.SetActive(true);
	}

		private void OnScrollViewBeginDrag()
	{
		for (int i = 0; i < this.ScrollView._content.childCount; i++)
		{
			Transform child = this.ScrollView._content.GetChild(i);
			child.GetComponent<AvatarPlatformItem>().StopJump();
		}
	}

		private void OnScrollViewEndDrag(int index)
	{
		this.ScrollView.CurCenterChildItem.GetComponent<AvatarPlatformItem>().Jump();
		this.selectedIndex = index;
		AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[this.selectedIndex];
		string item = GameDataManager.PlayerAvatarIds[this.selectedIndex];
		if (GameMenu.Instance.UnlockedAvatarIds.Contains(item))
		{
			this.TextDescClearLevel.gameObject.SetActive(false);
			this.BtnUse.gameObject.SetActive(true);
			this.BtnPrice.gameObject.SetActive(false);
			this.BtnLock.gameObject.SetActive(false);
		}
		else
		{
			this.BtnUse.gameObject.SetActive(false);
			UnlockType unlockType = avatarInfo.UnlockType;
			if (unlockType == UnlockType.LevelAndDiamond)
			{
				this.TextDescClearLevel.text = string.Concat(new object[]
				{
					Texts.String_DescLevelUnlock,
					GameMenu.Instance.currentLevel,
					"/",
					avatarInfo.UnlockLevel
				});
				this.TextDescClearLevel.gameObject.SetActive(true);
				this.TextDiamondCount.text = avatarInfo.UnlockDiamond.ToString();
				if (GameMenu.Instance.currentLevel < avatarInfo.UnlockLevel || GameMenu.Instance.Diamond < avatarInfo.UnlockDiamond)
				{
					this.BtnPrice.image.overrideSprite = this.BtnPriceCantUseImg;
					this.TextDiamondCount.color = this.BtnPriceCantUseColor;
				}
				else
				{
					this.BtnPrice.image.overrideSprite = this.BtnPriceCanUseImg;
					this.TextDiamondCount.color = this.whiteColor;
				}
				this.BtnPrice.gameObject.SetActive(true);
				this.BtnLock.gameObject.SetActive(false);
			}
		}
		if (!GameMenu.Instance.RedDotAvatarIds.Contains(item) && GameMenu.Instance.currentLevel >= avatarInfo.UnlockLevel)
		{
			this.RedDot.SetActive(true);
		}
		else
		{
			this.RedDot.SetActive(false);
		}
	}

		private void Update()
	{
		if (this.isShaking)
		{
			base.transform.localPosition = UnityEngine.Random.insideUnitSphere * this.ShakeLevel;
			if (Time.time - this.shakeEnterTime >= this.ShakeDuration)
			{
				this.isShaking = false;
				base.transform.localPosition = Vector3.zero;
			}
		}
	}

		public void OnClickUse()
	{
		GameMenu.Instance.CurrentAvatarId = GameDataManager.PlayerAvatarIds[this.selectedIndex];
		GameWorld.Instance.PlayerCtrl.LoadAvatar(GameMenu.Instance.CurrentAvatarId);
        //print("测试6");
        this.OnClickBtnBack();
	}

		public void OnClickPrice()
	{

       
        AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[this.selectedIndex];
		if (this.RedDot.activeSelf && !GameMenu.Instance.RedDotAvatarIds.Contains(avatarInfo.Id))
		{
			this.RedDot.SetActive(false);
			GameMenu.Instance.RedDotAvatarIds.Add(avatarInfo.Id);
		}

        //hack  买16
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaodianjigoumai_cishu, avatarInfo.ToString());
            Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaodianjigoumai_cishu, avatarInfo.ToString());

        }

        if (avatarInfo.UnlockType == UnlockType.LevelAndDiamond)
		{
			if (GameMenu.Instance.currentLevel >= avatarInfo.UnlockLevel && GameMenu.Instance.Diamond >= avatarInfo.UnlockDiamond)
			{
				GameHelper.LogEvent(Texts.StatisticsEventBuyAvatar, new string[]
				{
					"id",
					avatarInfo.Id
				});
				MachbirdSDKHelper.LogBuy(avatarInfo.Id);
				GameMenu.Instance.AddDiamond(avatarInfo.UnlockDiamond * -1);
				GameMenu.Instance.UnlockedAvatarIds.Add(avatarInfo.Id);
				// GameHelper.PlayInterstitialAd(new Action(this.OnClickUse), Texts.VideoParameterBuyAvatar, GameMenu.Instance.currentLevel.ToString());
				
				this.OnClickUse ();
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
                    
                //    //hack  买18
                //    if (Analytics.Instance != null)
                //    {
                //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaochapingbofang_cishu, 1 + "");
                //        Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaochapingbofang_cishu, 1 + "");

                //    }


                //}
                //else
                //{
                //    IronSource.Agent.loadInterstitial();
                //}
                ////hack  买17
                //if (Analytics.Instance != null)
                //{
                //    Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaochenggonggoumai_cishu, 1 + "");
                //    Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaochenggonggoumai_cishu, 1 + "");

                //}


            }
			else
			{
				this.OnClickLock();
			}
		}
	}

		public void OnClickVideo()
	{
		AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[this.selectedIndex];
		if (this.RedDot.activeSelf && !GameMenu.Instance.RedDotAvatarIds.Contains(avatarInfo.Id))
		{
			this.RedDot.SetActive(false);
			GameMenu.Instance.RedDotAvatarIds.Add(avatarInfo.Id);
		}
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);
		GameHelper.LogEvent(Texts.StatisticsEventBuyAvatarOnShopVideo, new string[]
		{
			"id",
			avatarInfo.Id,
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
		GameHelper.PlayRewardVideo(this.OnVideoReward,this.OnVideoEnd, this.OnVideoFailed, Texts.VideoParameterBuyAvatarOnShop, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
	}

		private void OnVideoReward()
	{
		//IronSourceEvents.onRewardedVideoAdRewardedEvent -= this.OnVideoReward;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[this.selectedIndex];
		GameHelper.LogEvent(Texts.StatisticsEventBuyAvatarOnShopVideoSucceed, new string[]
		{
			"id",
			avatarInfo.Id,
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
		GameMenu.Instance.UnlockedAvatarIds.Add(avatarInfo.Id);
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

		public void OnClickLock()
	{
		AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[this.selectedIndex];
		this.isShaking = true;
		this.shakeEnterTime = Time.time;
		if (this.RedDot.activeSelf && !GameMenu.Instance.RedDotAvatarIds.Contains(avatarInfo.Id))
		{
			this.RedDot.SetActive(false);
			GameMenu.Instance.RedDotAvatarIds.Add(avatarInfo.Id);
		}
	}

		public void OnClickBtnBack()
	{
		base.gameObject.SetActive(false);
		GameMenu.Instance.UpdateUnlockInfo();
		GameMenu.Instance.SetPlayerData();
	}

		private void OnDestroy()
	{
		CenterOnChild_UGUI scrollView = this.ScrollView;
		scrollView.ActionOnBeginDrag = (Action)Delegate.Remove(scrollView.ActionOnBeginDrag, new Action(this.OnScrollViewBeginDrag));
		CenterOnChild_UGUI scrollView2 = this.ScrollView;
		scrollView2.ActionOnEndDrag = (Action<int>)Delegate.Remove(scrollView2.ActionOnEndDrag, new Action<int>(this.OnScrollViewEndDrag));
	}

		public CenterOnChild_UGUI ScrollView;

		public Transform ScrollContent;

		public Text TextDescClearLevel;

		public Button BtnUse;

		public Button BtnPrice;

		public Button BtnVideo;

		public Button BtnLock;

		public Text TextDiamondCount;

		public GameObject RedDot;

		public int selectedIndex;

		public float ShakeDuration = 0.2f;

		public float ShakeLevel = 3f;

		private bool isShaking;

		private float shakeEnterTime;

		private Sprite BtnPriceCanUseImg;

		private Sprite BtnPriceCantUseImg;

		private Color whiteColor = Color.white;

		private Color BtnPriceCantUseColor = new Color(254/255f, 0f, 0f);
}
