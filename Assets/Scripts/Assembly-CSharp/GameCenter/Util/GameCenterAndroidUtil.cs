using System;
using UnityEngine;

namespace GameCenter.Util
{
		public static class GameCenterAndroidUtil
	{
				public static AndroidJavaObject CurrentActivity()
		{
			AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
			return androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
		}

				public static void RunOnUiThread(Action cb)
		{
			GameCenterAndroidUtil.CurrentActivity().Call("runOnUiThread", new object[]
				{
					new AndroidJavaRunnable(cb.Invoke)
				});
		}

				public static void BackToHome()
		{
			GameCenterAndroidUtil.RunOnUiThread(delegate
				{
					GameCenterAndroidUtil.CurrentActivity().Call("moveTaskToBack", new object[]
						{
							false
						});
				});
		}

				public static int OpenUrl(string link)
		{
			link = link.Replace("market://details?id=", "https://play.google.com/store/apps/details?id=");
			AndroidJavaObject androidJavaObject = new AndroidJavaObject("android.content.Intent", new object[]
				{
					"android.intent.action.VIEW"
				});
			AndroidJavaObject androidJavaObject2 = new AndroidJavaClass("android.net.Uri").CallStatic<AndroidJavaObject>("parse", new object[]
				{
					link
				});
			androidJavaObject.Call<AndroidJavaObject>("setData", new object[]
				{
					androidJavaObject2
				});
			androidJavaObject.Call<AndroidJavaObject>("setPackage", new object[]
				{
					"com.android.vending"
				});
			if (androidJavaObject.Call<AndroidJavaObject>("resolveActivity", new object[]
				{
					GameCenterAndroidUtil.CurrentActivity().Call<AndroidJavaObject>("getPackageManager", new object[0])
				}) != null)
			{
				GameCenterAndroidUtil.CurrentActivity().Call("startActivity", new object[]
					{
						androidJavaObject
					});
				return 1;
			}
			androidJavaObject.Call<AndroidJavaObject>("setPackage", null);
			if (androidJavaObject.Call<AndroidJavaObject>("resolveActivity", new object[]
				{
					GameCenterAndroidUtil.CurrentActivity().Call<AndroidJavaObject>("getPackageManager", new object[0])
				}) != null)
			{
				GameCenterAndroidUtil.CurrentActivity().Call("startActivity", new object[]
					{
						androidJavaObject
					});
				return 0;
			}
			return -1;
		}

				public static void StartGameCenterActivity(string activityName)
		{
			AndroidJavaClass androidJavaClass = new AndroidJavaClass(activityName);
			androidJavaClass.CallStatic("startActivity", new object[]
				{
					GameCenterAndroidUtil.CurrentActivity(),
					Application.identifier
				});
		}

				public static string GetCId()
		{
			string className = "com.machbird.library.MachBirdSDK";
			AndroidJavaClass androidJavaClass = new AndroidJavaClass(className);
			string text = androidJavaClass.CallStatic<string>("getCID", new object[0]);
			return (text != null) ? text : "test";
		}

				public static bool IsInstalled(string packageName)
		{
			return !string.IsNullOrEmpty(packageName) && GameCenterAndroidUtil.GetPackageInfo(packageName) != null;
		}

				private static AndroidJavaObject GetPackageInfo(string packageName)
		{
			AndroidJavaObject result;
			try
			{
				result = GameCenterAndroidUtil.CurrentActivity().Call<AndroidJavaObject>("getPackageManager", new object[0]).Call<AndroidJavaObject>("getPackageInfo", new object[]
					{
						packageName,
						0
					});
			}
			catch (Exception)
			{
				return null;
			}
			return result;
		}

				public static DateTime GetFirstInstallTime()
		{
			AndroidJavaObject packageInfo = GameCenterAndroidUtil.GetPackageInfo(Application.identifier);
			long num = (packageInfo == null) ? 0L : packageInfo.Get<long>("firstInstallTime");
			DateTime dateTime = new DateTime(1970, 1, 1);
			return dateTime.AddMilliseconds((double)num);
		}
	}
}
