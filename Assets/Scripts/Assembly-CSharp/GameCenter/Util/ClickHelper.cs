using System;
using System.Collections;
using UnityEngine;

namespace GameCenter.Util
{
		public static class ClickHelper
	{
				static ClickHelper()
		{
			ClickHelper.XalLogUtil = new AndroidJavaClass("org.machsystem.recommend.cloudv5.XalLogUtil");
		}

				public static void LogEvent(string name, string title = null, string packageName = null, string gameLabel = null, string if_gpstore = null, string installed_pkg = null)
		{
			ClickHelper.LogEvent(name, ClickHelper.getClickType(name), title, packageName, gameLabel, if_gpstore, installed_pkg);
		}

				private static ClickHelper.ClickType getClickType(string name)
		{
			string text = name.Substring(0, 4);
			if (text != null)
			{
				if (text == "gc_1")
				{
					return ClickHelper.ClickType.GameCenter;
				}
				if (text == "gc_2")
				{
					return ClickHelper.ClickType.SqCard;
				}
				if (text == "gc_3")
				{
					return ClickHelper.ClickType.Splash;
				}
			}
			return ClickHelper.ClickType.Unknown;
		}

				public static void RecordClickTime(string packageName, int promoteType)
		{
			try
			{
				if (ClickHelper.XalLogUtil != null)
				{
					ClickHelper.XalLogUtil.CallStatic("RecordClickTime", new object[]
						{
							packageName,
							promoteType
						});
				}
			}
			catch (Exception ex)
			{
			}
		}

				public static void LogEvent(string name, ClickHelper.ClickType type, string title = null, string packageName = null, string gameLabel = null, string if_gpstore = null, string installed_pkg = null)
		{
			Hashtable hashtable = new Hashtable
			{
				{
					"name_s",
					name
				},
				{
					"type_s",
					type.ToString()
				}
			};
			if (gameLabel != null)
			{
				hashtable.Add("game_label_s", gameLabel);
			}
			if (title != null)
			{
				hashtable.Add("title_s", title);
			}
			if (packageName != null)
			{
				hashtable.Add("target_pkg_name_s", packageName);
			}
			if (if_gpstore != null)
			{
				hashtable.Add("if_gpstore_s", if_gpstore);
			}
			if (installed_pkg != null)
			{
				hashtable.Add("installed_pkg_s", installed_pkg);
			}
			if (ClickHelper.XalLogUtil != null)
			{
				ClickHelper.XalLogUtil.CallStatic("LogEvent", new object[]
					{
						ClickHelper.CreateAndroidBundleObject(hashtable)
					});
			}
		}

				private static AndroidJavaObject CreateAndroidBundleObject(Hashtable hastableObj)
		{
			AndroidJavaObject androidJavaObject = new AndroidJavaObject(ClickHelper.PackageBundle, new object[0]);
			IEnumerator enumerator = hastableObj.Keys.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					object obj2 = hastableObj[obj];
					if (obj2 is string)
					{
						androidJavaObject.Call("putString", new object[]
							{
								obj,
								obj2
							});
					}
					else if (obj2 is int || obj2 is long)
					{
						androidJavaObject.Call("putLong", new object[]
							{
								obj,
								obj2
							});
					}
					else if (obj2 is float || obj2 is double)
					{
						androidJavaObject.Call("putDouble", new object[]
							{
								obj,
								obj2
							});
					}
					else
					{
						if (!(obj2 is bool))
						{
							throw new Exception("Hashtable里只能放值类型, key=" + obj);
						}
						androidJavaObject.Call("putBoolean", new object[]
							{
								obj,
								obj2
							});
					}
				}
			}
			finally
			{
				IDisposable disposable;
				if ((disposable = (enumerator as IDisposable)) != null)
				{
					disposable.Dispose();
				}
			}
			return androidJavaObject;
		}

				private const string XalLogUtilName = "org.machsystem.recommend.cloudv5.XalLogUtil";

				public static AndroidJavaClass XalLogUtil;

				public const string _10001 = "gc_10001";

				public const string _10002 = "gc_10002";

				public const string _10003 = "gc_10003";

				public const string _10004 = "gc_10004";

				public const string _1001x = "gc_1001";

				public const string _20001 = "gc_20001";

				public const string _20002 = "gc_20002";

				public const string _20003 = "gc_20003";

				public const string _20004 = "gc_20004";

				public const string _20005 = "gc_20005";

				public const string _20006 = "gc_20006";

				public const string _30001 = "gc_30001";

				public const string _30002 = "gc_30002";

				public const string _30003 = "gc_30003";

				public const string _30004 = "gc_30004";

				public const string _30005 = "gc_30005";

				public static string PackageBundle = "android.os.Bundle";

				private const int XGAME_PROMOTE = 84039029;

				public const string XGAME_PROMOTE_NAME_STRING = "name_s";

				public const string XGAME_PROMOTE_TYPE_STRING = "type_s";

				public const string XGAME_PROMOTE_TITLE_STRING = "title_s";

				public const string XGAME_PROMOTE_TARGET_PKG_NAME_STRING = "target_pkg_name_s";

				public const string XGAME_PROMOTE_INSTALL_NUM_INT = "install_num_l";

				public const string XGAME_PROMOTE_GAME_LABEL_STRING = "game_label_s";

				public const string XGAME_PROMOTE_INSTALLED_PKG_STRING = "installed_pkg_s";

				public const string XGAME_PROMOTE_IF_GPSTORE_STRING = "if_gpstore_s";

				public enum ClickType
		{
						Unknown,
						GameCenter,
						SqCard,
						Splash
		}
	}
}
