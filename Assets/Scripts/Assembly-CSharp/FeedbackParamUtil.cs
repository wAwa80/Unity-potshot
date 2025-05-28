using System;
using System.Text;
using a;
using UnityEngine;

public class FeedbackParamUtil
{
		public string GetCommonCode(int pid)
	{
		return FeedbackParamUtil.Encode(this.getCommonParams(pid));
	}

		public static string Encode(string json)
	{
		return EncryptUtil.UrlEncode(EncryptUtil.DesEncrypt(json, "a#p$u^s&"));
	}

		public string getCommonParams(int uiVersion)
	{
		string specifiedParam = this.getSpecifiedParam(false, uiVersion, new FeedbackParamUtil.ParamKey[]
		{
			FeedbackParamUtil.ParamKey.client_id,
			FeedbackParamUtil.ParamKey.product_id,
			FeedbackParamUtil.ParamKey.channel_id,
			FeedbackParamUtil.ParamKey.version_code,
			FeedbackParamUtil.ParamKey.version_name,
			FeedbackParamUtil.ParamKey.mode,
			FeedbackParamUtil.ParamKey.manufacturer,
			FeedbackParamUtil.ParamKey.sdk,
			FeedbackParamUtil.ParamKey.os,
			FeedbackParamUtil.ParamKey.network,
			FeedbackParamUtil.ParamKey.country_code,
			FeedbackParamUtil.ParamKey.locale,
			FeedbackParamUtil.ParamKey.pkg,
			FeedbackParamUtil.ParamKey.width,
			FeedbackParamUtil.ParamKey.height,
			FeedbackParamUtil.ParamKey.densityDpi
		});
		return this.handleFirstParamLazy(specifiedParam, true);
	}

		private string handleFirstParamLazy(string param, bool isNoOtherParam)
	{
		if (string.IsNullOrEmpty(param))
		{
			return param;
		}
		if (isNoOtherParam && param.StartsWith("&"))
		{
			return param.Substring(1);
		}
		if (!isNoOtherParam && !param.StartsWith("&"))
		{
			return "&" + param;
		}
		return param;
	}

		private string getSpecifiedParam(bool needEncode, int uiVersion, params FeedbackParamUtil.ParamKey[] keys)
	{
		if (keys == null || keys.Length == 0)
		{
			return string.Empty;
		}
		StringBuilder stringBuilder = new StringBuilder(256);
		for (int i = 0; i < keys.Length; i++)
		{
			switch (keys[i])
			{
			case FeedbackParamUtil.ParamKey.client_id:
				stringBuilder.Append("&clientId=");
				try
				{
					string value = FeedbackParamUtil.MachBirdSDK.CallStatic<string>("getCID", new object[0]);
					stringBuilder.Append(value);
				}
				catch (Exception value2)
				{
					stringBuilder.Append(string.Empty);
					Console.WriteLine(value2);
					throw;
				}
				break;
			case FeedbackParamUtil.ParamKey.product_id:
				stringBuilder.Append("&pid=");
				stringBuilder.Append(uiVersion.ToString());
				break;
			case FeedbackParamUtil.ParamKey.version_code:
				stringBuilder.Append("&versionCode=");
				stringBuilder.Append(CurrentBundleVersion.version);
				break;
			case FeedbackParamUtil.ParamKey.version_name:
				stringBuilder.Append("&versionName=");
				stringBuilder.Append(Application.version);
				break;
			case FeedbackParamUtil.ParamKey.mode:
			{
				stringBuilder.Append("&model=");
				string text = SystemInfo.deviceModel.ToLower();
				stringBuilder.Append((!needEncode) ? text : EncryptUtil.UrlEncode(text));
				break;
			}
			case FeedbackParamUtil.ParamKey.manufacturer:
			{
				stringBuilder.Append("&manufacturer=");
				string text2 = this.GetManufactyrer().ToLower();
				stringBuilder.Append((!needEncode) ? text2 : EncryptUtil.UrlEncode(text2));
				break;
			}
			case FeedbackParamUtil.ParamKey.os:
				stringBuilder.Append("&os=");
				stringBuilder.Append(SystemInfo.operatingSystem);
				break;
			case FeedbackParamUtil.ParamKey.country_code:
				stringBuilder.Append("&ccode=");
				stringBuilder.Append(this.getLocale());
				break;
			case FeedbackParamUtil.ParamKey.locale:
				stringBuilder.Append("&locale=");
				stringBuilder.Append(this.getLocale());
				break;
			case FeedbackParamUtil.ParamKey.pkg:
				stringBuilder.Append("&packageName=");
				stringBuilder.Append(Application.identifier);
				break;
			}
		}
		return stringBuilder.ToString();
	}

		private string getLocale()
	{
		AndroidJavaObject androidJavaObject = new AndroidJavaClass("java.util.Locale").CallStatic<AndroidJavaObject>("getDefault", new object[0]);
		if (androidJavaObject == null)
		{
			return string.Empty;
		}
		return (androidJavaObject.Call<string>("getLanguage", new object[0]) + "_" + androidJavaObject.Call<string>("getCountry", new object[0])).ToLower();
	}

		public string GetManufactyrer()
	{
		return FeedbackParamUtil.Build.GetStatic<string>("MANUFACTURER");
	}

		public static FeedbackParamUtil Instance = new FeedbackParamUtil();

		private static AndroidJavaClass Build = new AndroidJavaClass("android.os.Build");

		private static AndroidJavaClass Locale;

		private static AndroidJavaClass MachBirdSDK = new AndroidJavaClass("com.machbird.library.MachBirdSDK");

		private static AndroidJavaClass Local;

		public class FeedBackJosn
	{
				public FeedBackJosn(string feedbackId, string email, string contactWay, string content, string requestTime, string commonCode)
		{
			this.feedback_id = feedbackId;
			this.email = email;
			this.contact_way = contactWay;
			this.content = content;
			this.request_time = requestTime;
			this.common_code = commonCode;
		}

				public string feedback_id;

				public string email;

				public string contact_way;

				public string content;

				public string request_time;

				public string common_code;
	}

		private enum ParamKey
	{
				client_id,
				product_id,
				channel_id,
				version_code,
				version_name,
				mode,
				manufacturer,
				sdk,
				os,
				network,
				country_code,
				locale,
				pkg,
				width,
				height,
				densityDpi,
				network_int
	}
}
