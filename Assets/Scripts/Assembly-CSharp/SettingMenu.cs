using System;
using Game.Walker;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SettingMenu : MonoBehaviour
{
		private void Start()
	{
		this.enableVoiceImg = Resources.Load<Sprite>(Texts.EnableVoiceImg);
		this.disableVoiceImg = Resources.Load<Sprite>(Texts.DisableVoiceImg);
		this.enableShakeImg = Resources.Load<Sprite>(Texts.EnableShakeImg);
		this.disableShakeImg = Resources.Load<Sprite>(Texts.DisableShakeImg);
		this.enablePersonalizedAdImg = Resources.Load<Sprite>(Texts.EnablePersonalizedImg);
		this.disablePersonalizedAdImg = Resources.Load<Sprite>(Texts.DisenablePersonalizedImg);
		this.ImgVoice.overrideSprite = ((!GameMenu.Instance.EnableVoice) ? this.disableVoiceImg : this.enableVoiceImg);
		this.ImgShake.overrideSprite = ((!GameMenu.Instance.EnableShake) ? this.disableShakeImg : this.enableShakeImg);
		this.ImgPersonalizedAd.overrideSprite = ((!MachbirdSDKHelper.IsPersonalizedAdAgree()) ? this.disablePersonalizedAdImg : this.enablePersonalizedAdImg);
		AudioListener.pause = !GameMenu.Instance.EnableVoice;
	}

		private void Update()
	{
	}

		public void OnClickBtnVoice()
	{
		GameMenu.Instance.EnableVoice = !GameMenu.Instance.EnableVoice;
		GameMenu.Instance.SetPlayerData();
		AudioListener.pause = !GameMenu.Instance.EnableVoice;
		this.ImgVoice.overrideSprite = ((!GameMenu.Instance.EnableVoice) ? this.disableVoiceImg : this.enableVoiceImg);
        //hack bg
        this.imgBtnVoice.overrideSprite = ((!GameMenu.Instance.EnableVoice) ? this.disablePersonalizedAdImg : this.enablePersonalizedAdImg);
        GameHelper.LogEvent(Texts.StatisticsEventVoiceState, new string[]
		{
			"enableState",
			GameMenu.Instance.EnableVoice.ToString()
		});

        AllDataInGameTest.nyinyue_kaiguan = ImgVoice.overrideSprite == this.disableVoiceImg ? 0 : 1; //hack 关5
    }

		public void OnClickBtnShake()
	{
		GameMenu.Instance.EnableShake = !GameMenu.Instance.EnableShake;
		GameMenu.Instance.SetPlayerData();
		this.ImgShake.overrideSprite = ((!GameMenu.Instance.EnableShake) ? this.disableShakeImg : this.enableShakeImg);
        //hack bg
        this.imgBtnShake.overrideSprite = ((!GameMenu.Instance.EnableShake) ? this.disablePersonalizedAdImg : this.enablePersonalizedAdImg);
        GameHelper.LogEvent(Texts.StatisticsEventShakeState, new string[]
		{
			"enableShake",
			GameMenu.Instance.EnableShake.ToString()
		});
        AllDataInGameTest.zhendong_kaiguan = ImgShake.overrideSprite == this.disablePersonalizedAdImg  ? 0 : 1; //hack 关4
	}

		public void OnClickLinkPP()
	{
		Application.OpenURL(Texts.URLPrivacyPolicy);
	}

		public void OnClickLinkUA()
	{
		Application.OpenURL(Texts.URLUserAgreement);
	}

		public void OnClickPersonalizedAd()
	{
		MachbirdSDKHelper.SetPersonalizedAdAgree(!MachbirdSDKHelper.IsPersonalizedAdAgree());
		this.ImgPersonalizedAd.overrideSprite = ((!MachbirdSDKHelper.IsPersonalizedAdAgree()) ? this.disablePersonalizedAdImg : this.enablePersonalizedAdImg);
	}

		public void OnClickEmptyAllData()
	{
		PlayerPrefs.DeleteAll();
		SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);

        AllDataInGameTest.nqingchushuju_renci++; // hack 关6
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.qingchushuju_renci, AllDataInGameTest.njinruxiaoguan_renci+"");
	}

		public void OnClickClose()
	{
		base.gameObject.SetActive(false);
	}

		public Image ImgVoice;

		public Image ImgShake;

		public Image ImgPersonalizedAd;

		private Sprite enableVoiceImg;

		private Sprite disableVoiceImg;

		private Sprite enableShakeImg;

		private Sprite disableShakeImg;

		private Sprite enablePersonalizedAdImg;

		private Sprite disablePersonalizedAdImg;

        public Image imgBtnShake;
        public Image imgBtnVoice;
}
