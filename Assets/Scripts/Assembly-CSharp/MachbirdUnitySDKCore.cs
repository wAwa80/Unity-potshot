using System;
using System.Collections.Generic;
using UnityEngine;

public sealed class MachbirdUnitySDKCore
{
		public MachbirdUnitySDKCore()
	{
		this.mSdkClz = new AndroidJavaClass("com.machbird.library.MachBirdSDK");
	}

		public void Init()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] init() called");
		}
	}

		public void SetPersonalizedAdAgree(bool consent)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] SetPersonalizedAdAgree() called with: consent=",
				consent
			}));
		}
		this.mSdkClz.CallStatic("setPersonalizedAdAgree", new object[]
		{
			consent
		});
	}

		public bool IsPersonalizedAdAgree()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] IsPersonalizedAdAgree() called with:");
		}
		return this.mSdkClz.CallStatic<bool>("isPersonalizedAdEnable", new object[0]);
	}

		public bool IsEurope()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] IsEurope() called");
		}
		return this.mSdkClz.CallStatic<bool>("isEurope", new object[0]);
	}

		public void LogMainPageShow()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogMainPageShow() called");
		}
		this.mSdkClz.CallStatic("logMainPageShow", new object[0]);
	}

		public void LogRegister(string accountId, string accountType, int age, Gender gender)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogRegister() called with: accountId=",
				accountId,
				", accountType=",
				accountType,
				", age=",
				age,
				", gender=",
				gender
			}));
		}
		int num = MachbirdSDK.GENDER_OTHER;
		if (gender == Gender.MALE)
		{
			num = MachbirdSDK.GENDER_MALE;
		}
		else if (gender == Gender.FEMALE)
		{
			num = MachbirdSDK.GENDER_FEMALE;
		}
		this.mSdkClz.CallStatic("logRegister", new object[]
		{
			accountId,
			accountType,
			age,
			num
		});
	}

		public void LogLogin()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogLogin() called");
		}
		this.mSdkClz.CallStatic("logLogin", new object[0]);
	}

		public void LogLogin(string accountId, string accountLevel)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogLogin() called with: accountId=",
				accountId,
				", accountLevel=",
				accountLevel
			}));
		}
		this.mSdkClz.CallStatic("logLogin", new object[]
		{
			accountId,
			accountLevel
		});
	}

		public void LogPaySuccess(string transactionId, string paymentType, string currencyType, double realCoinNum, long virtualCoinNum, string iapName, long iapNum)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogPaySuccess() called with: transactionId=",
				transactionId,
				", paymentType=",
				paymentType,
				", currencyType=",
				currencyType,
				", realCoinNum=",
				realCoinNum,
				", virtualCoinNum=",
				virtualCoinNum,
				", iapName=",
				iapName,
				", iapNum=",
				iapNum
			}));
		}
		this.mSdkClz.CallStatic("logPaySuccess", new object[]
		{
			transactionId,
			paymentType,
			currencyType,
			realCoinNum,
			virtualCoinNum,
			iapName,
			iapNum
		});
	}

		public void LogBuy(string itemName)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogBuy() called with: itemName=" + itemName);
		}
		this.mSdkClz.CallStatic("logBuy", new object[]
		{
			itemName
		});
	}

		public void LogBuy(string itemName, long itemNum, double itemTotalPrice)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogBuy() called with: itemName=",
				itemName,
				", itemNum=",
				itemNum,
				", itemTotalPrice=",
				itemTotalPrice
			}));
		}
		this.mSdkClz.CallStatic("logBuy", new object[]
		{
			itemName,
			itemNum,
			itemTotalPrice
		});
	}

		internal void LogSubscribe(string subscriptionId, string paymentType, string currencyType, double realCoinNum)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogSubscribe() called with: subscriptionId=",
				subscriptionId,
				", paymentType=",
				paymentType,
				", currencyType=",
				currencyType,
				", realCoinNum=",
				realCoinNum
			}));
		}
		this.mSdkClz.CallStatic("logSubscribe", new object[]
		{
			subscriptionId,
			paymentType,
			currencyType,
			realCoinNum
		});
	}

		public void LogSell(string itemName, long itemNum, double itemTotalPrice)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogSell() called with: itemName=",
				itemName,
				", itemNum=",
				itemNum,
				", itemTotalPrice=",
				itemTotalPrice
			}));
		}
		this.mSdkClz.CallStatic("logSell", new object[]
		{
			itemName,
			itemNum,
			itemTotalPrice
		});
	}

		private static string VerifyQuestType(QuestType questType)
	{
		switch (questType)
		{
		case QuestType.NEW:
			return MachbirdUnitySDKCore.QUEST_TYPE_NEW;
		case QuestType.MAIN:
			return MachbirdUnitySDKCore.QUEST_TYPE_MAIN;
		case QuestType.SUB:
			return MachbirdUnitySDKCore.QUEST_TYPE_SUB;
		default:
			return string.Empty;
		}
	}

		private static string VerifyCoreOpeType(CoreOpeStatus coreOpeType)
	{
		switch (coreOpeType)
		{
		case CoreOpeStatus.BEGIN:
			return MachbirdUnitySDKCore.CORE_OPE_STATUS_BEGIN;
		case CoreOpeStatus.COMPLETED:
			return MachbirdUnitySDKCore.CORE_OPE_STATUS_COMPLETED;
		case CoreOpeStatus.FAILED:
			return MachbirdUnitySDKCore.CORE_OPE_STATUS_FAILED;
		default:
			return string.Empty;
		}
	}

		public void LogQuestBegin(int questIndex)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestBegin() called with: questIndex=",
				questIndex
			}));
		}
		this.mSdkClz.CallStatic("logQuestBegin", new object[]
		{
			questIndex
		});
	}

		public void LogQuestBegin(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		string text = MachbirdUnitySDKCore.VerifyQuestType(questType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestBegin() called with: questIndex=",
				questIndex,
				" ,questType=",
				text,
				", questType=",
				text,
				", questId=",
				questId,
				", questName=",
				questName,
				", progress=",
				progress,
				", times=",
				times
			}));
		}
		this.mSdkClz.CallStatic("logQuestBegin", new object[]
		{
			questIndex,
			text,
			questId,
			questName,
			progress,
			times
		});
	}

		public void LogQuestCompleted(int questIndex)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestCompleted() called with: questIndex=",
				questIndex
			}));
		}
		this.mSdkClz.CallStatic("logQuestCompleted", new object[]
		{
			questIndex
		});
	}

		public void LogQuestCompleted(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		string text = MachbirdUnitySDKCore.VerifyQuestType(questType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestCompleted() called with: questIndex=",
				questIndex,
				" ,questType=",
				text,
				", questType=",
				text,
				", questId=",
				questId,
				", questName=",
				questName,
				", progress=",
				progress,
				", times=",
				times
			}));
		}
		this.mSdkClz.CallStatic("logQuestCompleted", new object[]
		{
			questIndex,
			text,
			questId,
			questName,
			progress,
			times
		});
	}

		public void LogQuestFailed(int questIndex)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestFailed() called with: questIndex=",
				questIndex
			}));
		}
		this.mSdkClz.CallStatic("logQuestFailed", new object[]
		{
			questIndex
		});
	}

		public void LogQuestFailed(int questIndex, QuestType questType, string questId, string questName, int progress, int times)
	{
		string text = MachbirdUnitySDKCore.VerifyQuestType(questType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogQuestFailed() called with: questIndex=",
				questIndex,
				" ,questType=",
				text,
				", questType=",
				text,
				", questId=",
				questId,
				", questName=",
				questName,
				", progress=",
				progress,
				", times=",
				times
			}));
		}
		this.mSdkClz.CallStatic("logQuestFailed", new object[]
		{
			questIndex,
			text,
			questId,
			questName,
			progress,
			times
		});
	}

		public void LogCustomEvent(string name, string customParamsJson)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogCustomEvent() called with: name=",
				name,
				", customParamsJson=",
				customParamsJson
			}));
		}
		this.mSdkClz.CallStatic("logCustomEvent", new object[]
		{
			name,
			customParamsJson
		});
	}

		private static string VerifyADVType(ADVType aDVType)
	{
		switch (aDVType)
		{
		case ADVType.REWARD:
			return MachbirdUnitySDKCore.ADV_TYPE_REWARD;
		case ADVType.INTERSTITIAL:
			return MachbirdUnitySDKCore.ADV_TYPE_INTERSTITIAL;
		case ADVType.BANNER:
			return MachbirdUnitySDKCore.ADV_TYPE_BANNER;
		case ADVType.NATIVE:
			return MachbirdUnitySDKCore.ADV_TYPE_NATIVE;
		default:
			return string.Empty;
		}
	}

		public void LogAdvReady(string trigger, ADVType advType, bool isReady)
	{
		string text = MachbirdUnitySDKCore.VerifyADVType(advType);
		int num = (!isReady) ? 0 : 1;
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogAdvReady() called with: trigger=",
				trigger,
				", advType=",
				text,
				", isReady=",
				isReady
			}));
		}
		this.mSdkClz.CallStatic("logAdvReady", new object[]
		{
			trigger,
			text,
			num
		});
	}

		public void LogAdvOpen(string trigger, ADVType advType)
	{
		string text = MachbirdUnitySDKCore.VerifyADVType(advType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogAdvOpen() called with: trigger=",
				trigger,
				", advType",
				text
			}));
		}
		this.mSdkClz.CallStatic("logAdvOpen", new object[]
		{
			trigger,
			text
		});
	}

		public void LogAdvClose(string trigger, ADVType advType)
	{
		string text = MachbirdUnitySDKCore.VerifyADVType(advType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogAdvClose() called with: trigger=",
				trigger,
				", advType=",
				text
			}));
		}
		this.mSdkClz.CallStatic("logAdvClose", new object[]
		{
			trigger,
			text
		});
	}

		public void LogAdvContentShow(string trigger, ADVType advType)
	{
		string text = MachbirdUnitySDKCore.VerifyADVType(advType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogAdvContentShow() called with: trigger=",
				trigger,
				", advType=",
				text
			}));
		}
		this.mSdkClz.CallStatic("logAdvContentShow", new object[]
		{
			trigger,
			text
		});
	}

		public void LogAdvContentClick(string trigger, ADVType advType)
	{
		string text = MachbirdUnitySDKCore.VerifyADVType(advType);
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogAdvContentClick() called with: trigger=",
				trigger,
				", advType=",
				advType
			}));
		}
		this.mSdkClz.CallStatic("logAdvContentClick", new object[]
		{
			trigger,
			text
		});
	}

		public void LogAdvRewarded(string trigger)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogAdvRewarded() called with: trigger=" + trigger);
		}
		this.mSdkClz.CallStatic("logAdvRewarded", new object[]
		{
			trigger
		});
	}

		public void LogGdprPageShow()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogGdprPageShow() called with: ");
		}
		this.mSdkClz.CallStatic("logGdprPageShow", new object[0]);
	}

		public void LogGdprAgree()
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogGdprAgree() called with: ");
		}
		this.mSdkClz.CallStatic("logGdprAgree", new object[0]);
	}

		public string GetCloudFileContent(string fileName)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] GetCloudFileContent() called with: fileName=" + fileName);
		}
		string text = string.Empty;
		text = this.mSdkClz.CallStatic<string>("getCloudFileContent", new object[]
		{
			fileName
		});
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new string[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] GetCloudFileContent() fileName=",
				fileName,
				", result=",
				text
			}));
		}
		return text;
	}

		public void LogByBranch(string eventName)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log("[" + MachbirdUnitySDKCore.LOG_TAG + "] LogByBranch() called with: eventName=" + eventName);
		}
		this.mSdkClz.CallStatic("logByBranch", new object[]
		{
			eventName
		});
	}

		public void LogByBranch(string eventName, Dictionary<string, string> args)
	{
		if (Debug.isDebugBuild)
		{
			Debug.Log(string.Concat(new object[]
			{
				"[",
				MachbirdUnitySDKCore.LOG_TAG,
				"] LogByBranch() called with: eventName=",
				eventName,
				", args=",
				args
			}));
		}
		AndroidJavaObject androidJavaObject = new AndroidJavaObject(MachbirdUnitySDKCore.PackageBundle, new object[0]);
		foreach (string text in args.Keys)
		{
			androidJavaObject.Call("putString", new object[]
			{
				text,
				args[text]
			});
		}
		this.mSdkClz.CallStatic("logByBranch", new object[]
		{
			eventName,
			androidJavaObject
		});
	}

		private static readonly string LOG_TAG = "MachbirdSDK";

		public static string QUEST_TYPE_NEW = "new";

		public static string QUEST_TYPE_MAIN = "main";

		public static string QUEST_TYPE_SUB = "sub";

		public static string ADV_TYPE_REWARD = "reward";

		public static string ADV_TYPE_INTERSTITIAL = "interstitial";

		public static string ADV_TYPE_BANNER = "banner";

		public static string ADV_TYPE_NATIVE = "native";

		public static readonly string CORE_OPE_STATUS_BEGIN = "a";

		public static readonly string CORE_OPE_STATUS_COMPLETED = "c";

		public static readonly string CORE_OPE_STATUS_FAILED = "f";

		private AndroidJavaClass mSdkClz;

		private static readonly string PackageBundle = "android.os.Bundle";
}
