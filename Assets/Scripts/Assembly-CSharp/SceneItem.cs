using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
/// <summary>
/// Scene prefab 的脚本 ==》SceneItem
/// 包括：
///     1.Init   -- 加载ScrollVies中的content
/// </summary>
public class SceneItem : MonoBehaviour
{
				public int Index { get; set; }

				public SceneMenu SceneMenu { get; set; }

				public string SceneId { get; set; }

		private void Start()
	{
		this.Btn.onClick.AddListener(new UnityAction(this.OnClick));
	}
    /// <summary>
    /// 只加载前5个
    /// </summary>
    /// <param name="index"></param>
    /// <param name="sceneId"></param>
    /// <param name="sceneMenu"></param>
	public void Init(int index, string sceneId, SceneMenu sceneMenu)
	{
        //if (index>4)
        //{
        //    return;
        //}
		this.Index = index;
		this.SceneId = sceneId;
		this.SceneMenu = sceneMenu;
        textName.text = GameDataManager.SceneItemName[this.Index];

		if (this.Index == 0)
		{
			this.SceneIcon.overrideSprite = Resources.Load<Sprite>(Texts.RandomSceneIconPath);
			this.unlocked = true;
		}
		else
		{
			this.SceneIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + sceneId);
			this.UnlockInfo = GameDataManager.SceneBGUnlockInfoDatas[index - 1];
			this.unlocked = GameMenu.Instance.UnlockedSceneIds.Contains(sceneId);
		}
		this.SceneIcon.SetNativeSize();
		//this.ImgUnlocked.gameObject.SetActive(this.unlocked);
		this.ImgUnlocked.gameObject.SetActive(true);
		this.ImgLocked.gameObject.SetActive(!this.unlocked);
        //未解锁 图片变暗
		//this.ImgLockedFG.gameObject.SetActive(!this.unlocked);

		this.TextLevel.gameObject.SetActive(!this.unlocked);
		this.TextReachLevel.gameObject.SetActive(!this.unlocked);
		this.ImgGet.gameObject.SetActive(!this.unlocked);
		if (!this.unlocked)
		{
			if (GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel)
			{
				//this.ImgLockedFG.gameObject.SetActive(false);
				this.TextLevel.gameObject.SetActive(false);
				this.TextReachLevel.gameObject.SetActive(false);
				this.ImgGet.gameObject.SetActive(true);
                this.ImgLocked.gameObject.SetActive(false);
			}
			else
			{
                //this.ImgLockedFG.fillAmount = 1f - 1f * (float)GameMenu.Instance.currentLevel / (float)this.UnlockInfo.UnlockLevel;

                this.SceneIcon.color = new Color(130 / 225f, 130 / 225f , 130 / 225f);

                this.TextLevel.text = GameMenu.Instance.currentLevel + "/" + this.UnlockInfo.UnlockLevel;
				this.TextReachLevel.text = Texts.String_reachlevel + this.UnlockInfo.UnlockLevel;
				this.ImgGet.gameObject.SetActive(false);
			}
		}
		if (this.Index != 0 && !GameMenu.Instance.RedDotSceneIds.Contains(this.UnlockInfo.Id) && GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel)
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
	}

		public void ShowSelected(bool selected)
	{
		this.ImgSelected.gameObject.SetActive(selected);
	}

		private void OnClick()
	{

        if (this.RedDot.activeSelf && !GameMenu.Instance.RedDotSceneIds.Contains(this.UnlockInfo.Id))
		{
			GameMenu.Instance.RedDotSceneIds.Add(this.UnlockInfo.Id);
		}
		this.RedDot.SetActive(false);
		if (!this.unlocked && GameMenu.Instance.currentLevel >= this.UnlockInfo.UnlockLevel && GameMenu.Instance.Diamond >= this.UnlockInfo.UnlockDiamond)
		{
			GameHelper.LogEvent(Texts.StatisticsEventBuyScene, new string[0]);
			// GameHelper.PlayInterstitialAd(delegate
			// {
			// 	this.unlocked = true;
			// 	GameMenu.Instance.UnlockedSceneIds.Add(this.SceneId);
			// 	MachbirdSDKHelper.LogBuy(this.UnlockInfo.Id);
			// 	GameMenu.Instance.AddDiamond(this.UnlockInfo.UnlockDiamond * -1);
			// 	this.ImgGet.gameObject.SetActive(false);
			// 	GameMenu.Instance.SetPlayerData();
			// 	this.SceneMenu.OnSelectedItem(this.Index);
			// }, Texts.VideoParameterBuyScene, GameMenu.Instance.currentLevel.ToString());

			this.unlocked = true;
			GameMenu.Instance.UnlockedSceneIds.Add(this.SceneId);
			MachbirdSDKHelper.LogBuy(this.UnlockInfo.Id);
			GameMenu.Instance.AddDiamond(this.UnlockInfo.UnlockDiamond * -1);
			this.ImgGet.gameObject.SetActive(false);
			GameMenu.Instance.SetPlayerData();
			this.SceneMenu.OnSelectedItem(this.Index);
            //SceneItem  插屏逻辑
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
            //    //hack 买21
            //    if (Analytics.Instance != null)
            //    {
            //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.beijingchapingbofang_cishu, 1 + "");
            //        Analytics.Instance.SendMessageByID(AllDataInGameTest.beijingchapingbofang_cishu, 1 + "");

            //    }
            //}
            //else
            //{
            //    IronSource.Agent.loadInterstitial();
            //}

            //hack  买20
            if (Analytics.Instance != null)
            {
                Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.beijingjiesuo_cishu, SceneId);
                Analytics.Instance.SendMessageByID(AllDataInGameTest.beijingjiesuo_cishu, SceneId);

            }

        }
		else
		{
			this.SceneMenu.OnSelectedItem(this.Index);
		}
	}

		public Button Btn;

		public Image SceneIcon;

		public Image ImgSelected;//被选中的外圈

		public Image ImgUnlocked;

		public Image ImgLocked;

		public Image ImgLockedFG;

		public Image ImgGet;

		public GameObject RedDot;

		public Text TextLevel;

		public Text TextReachLevel;

		private bool unlocked;

		private SceneBGUnlockInfo UnlockInfo;

        public Text textName;
}
