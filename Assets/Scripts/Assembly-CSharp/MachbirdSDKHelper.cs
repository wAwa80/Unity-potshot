using System;
using System.Collections.Generic;
using GameCenter.Util;
using GameCenter.Video;

public static class MachbirdSDKHelper
{
		public static void Init()
	{
		MachbirdSDKHelper.inited = true;
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.Init();
		}
	}

		public static void LogMainPageShow()
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogMainPageShow();
		}
	}

		public static bool IsEurope()
	{
		return MachbirdSDKHelper.inited && MachbirdSDK.IsEurope();
	}

		public static void LogQuestBegin(int questIndex)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestBegin(questIndex);
		}
	}

		public static void LogQuestBegin(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestBegin(questIndex, questType, questId, questName, progress, times);
		}
	}

		public static void LogQuestCompleted(int questIndex)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestCompleted(questIndex);
		}
	}

		public static void LogQuestCompleted(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestCompleted(questIndex, questType, questId, questName, progress, times);
		}
	}

		public static void LogQuestFailed(int questIndex)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestFailed(questIndex);
		}
	}

		public static void LogQuestFailed(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogQuestFailed(questIndex, questType, questId, questName, progress, times);
		}
	}

		public static void LogBuy(string itemName)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogBuy(itemName);
			MachbirdSDKHelper.LogByBranch("Buy", new Dictionary<string, string>
			{
				{
					"item",
					itemName
				}
			});
		}
	}

		public static void OnInterstitialRequest(string trigger, bool isReady)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnInterstitialRequest(trigger, isReady);
		}
	}

		public static void OnInterstitialShow(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnInterstitialShow(trigger);
		}
	}

		public static void OnInterstitialClick(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnInterstitialClick(trigger);
		}
	}

		public static void OnInterstitialClose(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnInterstitialClose(trigger);
		}
	}

		public static void OnRewardRequest(string trigger, bool isReady)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardRequest(trigger, isReady);
		}
	}

		public static void OnRewardOpen(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardOpen(trigger);
		}
	}

		public static void OnRewardShow(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardShow(trigger);
		}
	}

		public static void OnRewardClick(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardClick(trigger);
		}
	}

		public static void OnRewardFinish(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardFinish(trigger);
		}
	}

		public static void OnRewardClose(string trigger)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.OnRewardClose(trigger);
		}
	}

		public static void LogCustomEvent(string name, string customParamsJson)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogCustomEvent(name, customParamsJson);
		}
	}

		public static void SetPersonalizedAdAgree(bool consent)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.SetPersonalizedAdAgree(consent);
		}
	}

		public static bool IsPersonalizedAdAgree()
	{
		return !MachbirdSDKHelper.inited || MachbirdSDK.IsPersonalizedAdAgree();
	}

		public static void LogGdprPageShow()
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogGdprPageShow();
		}
	}

		public static void LogGdprAgree()
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogGdprAgree();
		}
	}

		public static void PlayVideo()
	{
		Singleton<PlayerController>.Instance.Play();
	}

		public static void StopPlayVideo()
	{
		Singleton<PlayerController>.Instance.StopPlay();
	}

		public static void LogByBranch(string eventName)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogByBranch("AKick_" + eventName);
		}
	}

		public static void LogByBranch(string eventName, Dictionary<string, string> dic)
	{
		if (MachbirdSDKHelper.inited)
		{
			MachbirdSDK.LogByBranch("AKick_" + eventName, dic);
		}
	}

		private static bool inited;
}
