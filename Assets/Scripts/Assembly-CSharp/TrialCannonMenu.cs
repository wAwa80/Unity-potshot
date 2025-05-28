using System;
using Game.Walker;
using UnityEngine;

public class TrialCannonMenu : MonoBehaviour
{

    private static TrialCannonMenu _instance;
    public static TrialCannonMenu Instance
    {
        get
        {
            if (TrialCannonMenu._instance == null)
            {
                TrialCannonMenu._instance = UnityEngine.Object.FindObjectOfType<TrialCannonMenu>();
            }
            return TrialCannonMenu._instance;
        }
    }
        private void Start()
	{
	}

		private void OnEnable()
	{
		GameHelper.LogEvent(Texts.StatisticsEventTrialCannonAgainPanelShow, new string[]
		{
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
	}

		private void Update()
	{
	}

		public void OnClickBtnTrial()
	{
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.goumaitishi_renshu, 1 + "");//hack mai 12

        GameHelper.LogEvent(Texts.StatisticsEventTrialCannonAgainVideo, new string[]
		{
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
        // 判断奖励视频是否准备好
        // if (PolyAndroidCall.isRewardReady())
        // {
        //     // 显示视频
        //     PolyAndroidCall.showRewardAd();
        //     PolyAndroidCall.nState = 4;




        // }
        //hack  买4
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.shipindapao_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.shipindapao_renci, 1 + "");

        }

        GameHelper.PlayRewardVideo(this.OnVideoReward, this.OnVideoEnd, this.OnVideoFailed, Texts.VideoParameterTrialCannon, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
		Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.goumaizhanshishipinbofang_cishu, 1 + "");//hack mai 12
    }

		private void OnVideoReward()
	{
        //IronSourceEvents.onRewardedVideoAdRewardedEvent -= this.OnVideoReward;

        //hack  买26
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.shipindapaook_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.shipindapaook_renci, 1 + "");

        }
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		GameHelper.LogEvent(Texts.StatisticsEventTrialCannonAgainVideoSucceed, new string[]
		{
			"level",
			GameMenu.Instance.currentLevel.ToString(),
			"prefabName",
			GameWorld.Instance.CurrentParefabName
		});
		EventDispatcher.TriggerEvent<string, int>(Texts.EventSpinRewardCannon, GameDataManager.TrialCannonId, GameDataManager.TrialCannonSubLevels);
		this.OnClickBtnBack();
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

		public void OnClickBtnBack()
	{
		base.gameObject.SetActive(false);
	}

		private void OnDestroy()
	{
	}
}
