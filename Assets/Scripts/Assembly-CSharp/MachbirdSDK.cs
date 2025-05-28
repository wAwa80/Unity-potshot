using System;
using System.Collections.Generic;

public static class MachbirdSDK
{
		public static void Init()
	{
		if (MachbirdSDK.inited)
		{
			return;
		}
		MachbirdSDK.inited = true;
		MachbirdSDK.mCore.Init();
	}

		public static void SetPersonalizedAdAgree(bool consent)
	{
		MachbirdSDK.mCore.SetPersonalizedAdAgree(consent);
	}

		public static bool IsPersonalizedAdAgree()
	{
		return MachbirdSDK.mCore.IsPersonalizedAdAgree();
	}

		public static bool IsEurope()
	{
		return MachbirdSDK.mCore.IsEurope();
	}

		public static void LogMainPageShow()
	{
		MachbirdSDK.mCore.LogMainPageShow();
	}

		public static void LogRegister(string accountId, string accountType, int age, Gender gender)
	{
		MachbirdSDK.mCore.LogRegister(accountId, accountType, age, gender);
	}

		public static void LogLogin()
	{
		MachbirdSDK.mCore.LogLogin();
	}

		public static void LogLogin(string accountId, string accountLevel)
	{
		MachbirdSDK.mCore.LogLogin(accountId, accountLevel);
	}

		public static void LogPaySuccess(string transactionId, string paymentType, string currencyType, double realCoinNum, long virtualCoinNum, string iapName, long iapNum)
	{
		MachbirdSDK.mCore.LogPaySuccess(transactionId, paymentType, currencyType, realCoinNum, virtualCoinNum, iapName, iapNum);
	}

		public static void LogBuy(string itemName)
	{
		MachbirdSDK.mCore.LogBuy(itemName);
	}

		public static void LogBuy(string itemName, long itemNum, double itemTotalPrice)
	{
		MachbirdSDK.mCore.LogBuy(itemName, itemNum, itemTotalPrice);
	}

		public static void LogSell(string itemName, long itemNum, double itemTotalPrice)
	{
		MachbirdSDK.mCore.LogSell(itemName, itemNum, itemTotalPrice);
	}

		public static void LogQuestBegin(int questIndex)
	{
		MachbirdSDK.mCore.LogQuestBegin(questIndex);
	}

		public static void LogQuestBegin(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		MachbirdSDK.mCore.LogQuestBegin(questIndex, questType, questId, questName, progress, times);
	}

		public static void LogQuestCompleted(int questIndex)
	{
		MachbirdSDK.mCore.LogQuestCompleted(questIndex);
	}

		public static void LogQuestCompleted(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		MachbirdSDK.mCore.LogQuestCompleted(questIndex, questType, questId, questName, progress, times);
	}

		public static void LogQuestFailed(int questIndex)
	{
		MachbirdSDK.mCore.LogQuestFailed(questIndex);
	}

		public static void LogQuestFailed(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		MachbirdSDK.mCore.LogQuestFailed(questIndex, questType, questId, questName, progress, times);
	}

		public static void LogSubscribe(string subscriptionId, string paymentType, string currencyType, double realCoinNum)
	{
		MachbirdSDK.mCore.LogSubscribe(subscriptionId, paymentType, currencyType, realCoinNum);
	}

		public static void LogCustomEvent(string name, string customParamsJson)
	{
		MachbirdSDK.mCore.LogCustomEvent(name, customParamsJson);
	}

		public static void LogAdvReady(string trigger, ADVType advType, bool isReady)
	{
		MachbirdSDK.mCore.LogAdvReady(trigger, advType, isReady);
	}

		public static void LogAdvOpen(string trigger, ADVType advType)
	{
		MachbirdSDK.mCore.LogAdvOpen(trigger, advType);
	}

		public static void LogAdvClose(string trigger, ADVType advType)
	{
		MachbirdSDK.mCore.LogAdvClose(trigger, advType);
	}

		public static void LogAdvContentShow(string trigger, ADVType advType)
	{
		MachbirdSDK.mCore.LogAdvContentShow(trigger, advType);
	}

		public static void LogAdvContentClick(string trigger, ADVType advType)
	{
		MachbirdSDK.mCore.LogAdvContentClick(trigger, advType);
	}

		public static void LogAdvRewarded(string trigger)
	{
		MachbirdSDK.mCore.LogAdvRewarded(trigger);
	}

		public static void OnInterstitialRequest(string trigger, bool isReady)
	{
		MachbirdSDK.mCore.LogAdvReady(trigger, ADVType.INTERSTITIAL, isReady);
	}

		public static void OnInterstitialShow(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentShow(trigger, ADVType.INTERSTITIAL);
	}

		public static void OnRewardRequest(string trigger, bool isReady)
	{
		MachbirdSDK.mCore.LogAdvReady(trigger, ADVType.REWARD, isReady);
	}

		public static void OnRewardOpen(string trigger)
	{
		MachbirdSDK.mCore.LogAdvOpen(trigger, ADVType.REWARD);
	}

		public static void OnRewardShow(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentShow(trigger, ADVType.REWARD);
	}

		public static void OnBannerRequest(string trigger, bool isReady)
	{
		MachbirdSDK.mCore.LogAdvReady(trigger, ADVType.BANNER, isReady);
	}

		public static void OnBannerShow(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentShow(trigger, ADVType.BANNER);
	}

		public static void OnNativeRequest(string trigger, bool isReady)
	{
		MachbirdSDK.mCore.LogAdvReady(trigger, ADVType.NATIVE, isReady);
	}

		public static void OnNativeShow(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentShow(trigger, ADVType.NATIVE);
	}

		public static string GetCloudFileContent(string fileName)
	{
		return MachbirdSDK.mCore.GetCloudFileContent(fileName);
	}

		public static void LogGdprPageShow()
	{
		MachbirdSDK.mCore.LogGdprPageShow();
	}

		public static void LogGdprAgree()
	{
		MachbirdSDK.mCore.LogGdprAgree();
	}

		public static void LogByBranch(string eventName)
	{
		MachbirdSDK.mCore.LogByBranch(eventName);
	}

		public static void LogByBranch(string eventName, Dictionary<string, string> dic)
	{
		MachbirdSDK.mCore.LogByBranch(eventName, dic);
	}

		public static void OnInterstitialClick(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentClick(trigger, ADVType.INTERSTITIAL);
	}

		public static void OnInterstitialClose(string trigger)
	{
		MachbirdSDK.mCore.LogAdvClose(trigger, ADVType.INTERSTITIAL);
	}

		public static void OnRewardClick(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentClick(trigger, ADVType.REWARD);
	}

		public static void OnRewardFinish(string trigger)
	{
		MachbirdSDK.mCore.LogAdvRewarded(trigger);
	}

		public static void OnRewardClose(string trigger)
	{
		MachbirdSDK.mCore.LogAdvClose(trigger, ADVType.REWARD);
	}

		public static void OnBannerClick(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentClick(trigger, ADVType.BANNER);
	}

		public static void OnNativeClick(string trigger)
	{
		MachbirdSDK.mCore.LogAdvContentClick(trigger, ADVType.NATIVE);
	}

		private static readonly MachbirdUnitySDKCore mCore = new MachbirdUnitySDKCore();

		private static bool inited = false;

		public static int GENDER_MALE = 1;

		public static int GENDER_FEMALE = 2;

		public static int GENDER_OTHER = 0;
}
