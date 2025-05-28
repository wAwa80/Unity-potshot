using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class SuperFireItem : MonoBehaviour
{
    
				public int Index { get; set; }

				public SuperFireMenu SuperFireMenu { get; set; }

				public string SuperFireId { get; set; }

		private void Start()
	{
		EventDispatcher.AddEventListener(Texts.EventUpdateSuperFireItem, new Action(this.UpdateTextPrice));
		this.Btn.onClick.AddListener(new UnityAction(this.OnClick));
	}

		public void Init(int index, string superFireId, SuperFireMenu superFireMenu)
	{
		this.Index = index;
		this.SuperFireId = superFireId;
		this.SuperFireMenu = superFireMenu;
		this.SuperFireIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + superFireId);
		this.UnlockInfo = GameDataManager.SuperFireInfoDatas[index];
		this.unlocked = GameMenu.Instance.UnlockedSuperFireIds.Contains(superFireId);
		this.SuperFireIcon.SetNativeSize();
		//this.ImgUnlocked.gameObject.SetActive(this.unlocked);
		this.ImgUnlocked.gameObject.SetActive(true);
		this.ImgLocked.gameObject.SetActive(!this.unlocked);
		//this.ImgLockedFG.gameObject.SetActive(!this.unlocked);
		this.TextLevel.gameObject.SetActive(!this.unlocked);
		this.TextReachLevel.gameObject.SetActive(!this.unlocked);
		this.ImgGet.gameObject.SetActive(!this.unlocked);
		this.TextDiamond.gameObject.SetActive(!this.unlocked);
		this.TextDiamond.text = this.UnlockInfo.UnlockDiamond.ToString();

		this.TextName.text = this.UnlockInfo.Name;
        
		if (!this.unlocked)
		{
			this.TextDiamond.color = ((GameMenu.Instance.Diamond < this.UnlockInfo.UnlockDiamond) ? this.redColor : this.whiteColor);
			if (GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel)
			{
				this.ImgGet.gameObject.SetActive(true);
                this.ImgLocked.gameObject.SetActive(false);
                TextDiamond.color = new Color(254 / 255f, 1f, 153 / 255f);
				//this.ImgLockedFG.gameObject.SetActive(false);
				this.TextLevel.gameObject.SetActive(false);
				this.TextReachLevel.gameObject.SetActive(false);
				if (GameMenu.Instance.Diamond >= this.UnlockInfo.UnlockDiamond)
				{
					this.ImgGet.color = this.whiteColor;
				}
				else
				{
					this.ImgGet.color = this.grayColor;
				}
			}
			else
			{
                //this.ImgLockedFG.fillAmount = 1f - 1f * (float)GameMenu.Instance.currentLevel / (float)this.UnlockInfo.UnlockLevel;
                //未解锁时 图片颜色调暗
                this.SuperFireIcon.color = new Color(130 / 225f, 130 / 225f, 130 / 225f);
                this.TextLevel.text = GameMenu.Instance.currentLevel + "/" + this.UnlockInfo.UnlockLevel;
				this.TextReachLevel.text = Texts.String_reachlevel + this.UnlockInfo.UnlockLevel;
				//this.ImgLockedFG.gameObject.SetActive(true);
				this.ImgGet.gameObject.SetActive(false);
			}
		}
		if (!GameMenu.Instance.RedDotSuperFireIds.Contains(this.UnlockInfo.Id) && GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel)
		{
			this.RedDot.SetActive(true);
		}
		else
		{
			this.RedDot.SetActive(false);
		}
	}

		private void UpdateTextPrice()
	{
		this.TextDiamond.color = ((GameMenu.Instance.Diamond < this.UnlockInfo.UnlockDiamond) ? this.redColor : this.whiteColor);
	}

		private void Update()
	{
	}

		public void ShowSelected(bool selected)
	{
		this.ImgSelected.gameObject.SetActive(selected);
        
        
	}

		private void OnClick()
	{
        


        if (this.RedDot.activeSelf && !GameMenu.Instance.RedDotSuperFireIds.Contains(this.UnlockInfo.Id))
		{
			GameMenu.Instance.RedDotSuperFireIds.Add(this.UnlockInfo.Id);
		}
		this.RedDot.SetActive(false);
		if (!this.unlocked && GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel && GameMenu.Instance.Diamond >= this.UnlockInfo.UnlockDiamond)
		{
			GameHelper.LogEvent(Texts.StatisticsEventBuySuperFire, new string[0]);
			// GameHelper.PlayInterstitialAd(delegate
			// {
			// 	this.unlocked = true;
			// 	GameMenu.Instance.UnlockedSuperFireIds.Add(this.SuperFireId);
			// 	MachbirdSDKHelper.LogBuy(this.UnlockInfo.Id);
			// 	GameMenu.Instance.AddDiamond(this.UnlockInfo.UnlockDiamond * -1);
			// 	this.ImgGet.gameObject.SetActive(false);
			// 	this.TextDiamond.gameObject.SetActive(false);
			// 	GameMenu.Instance.SetPlayerData();
			// 	this.SuperFireMenu.OnSelectedItem(this.Index);
			// }, Texts.VideoParameterBuySuperFire, GameMenu.Instance.currentLevel.ToString());

			this.unlocked = true;
			GameMenu.Instance.UnlockedSuperFireIds.Add(this.SuperFireId);
			MachbirdSDKHelper.LogBuy(this.UnlockInfo.Id);
			GameMenu.Instance.AddDiamond(this.UnlockInfo.UnlockDiamond * -1);
			this.ImgGet.gameObject.SetActive(false);

            

            this.TextDiamond.gameObject.SetActive(false);
			GameMenu.Instance.SetPlayerData();
			this.SuperFireMenu.OnSelectedItem(this.Index);
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
            //    //hack  买25
            //    if (Analytics.Instance != null)
            //    {
            //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengchapingbofang_cishu, 1 + "");
            //        Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengchapingbofang_cishu, 1 + "");

            //    }
            //}
            //else
            //{
            //    IronSource.Agent.loadInterstitial();
            //}
            //hack  买24
            if (Analytics.Instance != null)
            {
                Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengchenggonggoumai_cishu, SuperFireId + "");
                Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengchenggonggoumai_cishu, SuperFireId + "");

            }
        }
		else
		{
			this.SuperFireMenu.OnSelectedItem(this.Index);
		}
		EventDispatcher.TriggerEvent(Texts.EventUpdateSuperFireItem);

        //hack  买23
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengdianjigoumai_cishu, Index+"");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengdianjigoumai_cishu, Index + "");

        }
    }

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener(Texts.EventUpdateSuperFireItem, new Action(this.UpdateTextPrice));
	}

		public Button Btn;

		public Image SuperFireIcon;

		public Image ImgSelected;

		public Image ImgUnlocked;

		public Image ImgLocked;

		public Image ImgLockedFG;

		public Image ImgGet;

		public GameObject RedDot;

		public Text TextLevel;

		public Text TextReachLevel;

		public Text TextDiamond;

		public Text TextName;

		private bool unlocked;

		private SuperFireInfo UnlockInfo;

		private Color whiteColor = Color.white;

		private Color redColor = new Color(0.972549f, 0.160784319f, 0.274509817f);

		private Color grayColor = new Color(0.6039216f, 0.6117647f, 0.6117647f);
}
