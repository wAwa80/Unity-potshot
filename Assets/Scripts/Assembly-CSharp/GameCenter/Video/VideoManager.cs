using System;
using System.Collections.Generic;
using System.IO;
using GameCenter.Util;
using UnityEngine;

namespace GameCenter.Video
{
		public class VideoManager
	{
								public static int PlayerIntervalTimes { get; private set; }

				public static void Init()
		{
            //TODO VideoMgr 入口
            //HACK 真机测试 Java注释
            return;
			VideoManager.SqcardCloudV5 = new AndroidJavaClass("org.machsystem.recommend.cloudv5.SqcardCloudV5");
			VideoManager.SqcardCloudV5.CallStatic("init", new object[]
				{
					GameCenterAndroidUtil.CurrentActivity()
				});
			VideoManager.SqcardCloudV5.CallStatic("setSqcardCloudInterListener", new object[]
				{
					new SqcardCloudInter()
				});
			VideoManager.PlayerIntervalTimes = VideoManager.SqcardCloudV5.CallStatic<int>("getPlayerIntervalTimes", new object[0]);
			VideoManager._path = Path.Combine(Application.persistentDataPath, "Videos");
			if (!Directory.Exists(VideoManager._path))
			{
				Directory.CreateDirectory(VideoManager._path);
			}
			VideoManager.videoLinks = new Dictionary<string, string>();
			VideoManager.links = new Dictionary<string, string>();
			VideoManager.titles = new Dictionary<string, string>();
			VideoManager.VideoPath = new Dictionary<string, string>();
			VideoManager.packages = new Dictionary<string, string>();
			LocalVideoInfo localVideoInfo = Resources.Load<LocalVideoInfo>("VideoInfo");
			VideoManager.VideoMessages = new List<VideoMessage>();
			for (int i = 0; i < localVideoInfo.Videos.Length; i++)
			{
				if (!GameCenterAndroidUtil.IsInstalled(localVideoInfo.Videos[i].packageName))
				{
					VideoManager.VideoMessages.Add(localVideoInfo.Videos[i]);
				}
			}
			VideoManager._isInit = true;
		}

				public static string Label()
		{
			return VideoManager.SqcardCloudV5.CallStatic<string>("GetSqCardLabel", new object[0]);
		}

				public static bool GetEnable()
		{
            //TODO VideoMgr Call Methos
            //HACK 真机测试 Java注释
            return true;
			if (!VideoManager._isInit)
			{
				VideoManager.Init();
			}
			return VideoManager.SqcardCloudV5.CallStatic<int>("getSqcardEnable", new object[0]) == 1;
		}

				public static string GetInstalledPackages()
		{
			return VideoManager.SqcardCloudV5.CallStatic<string>("GetInstalledPackage", new object[0]);
		}

				public static void GetVideo()
		{
            //TODO GetVideo  
            //HACK 真机测试 Java注释
            return;
			if (!VideoManager.GetEnable())
			{
				return;
			}
			string text = VideoManager.SqcardCloudV5.CallStatic<string>("getSqcardInfo", new object[]
				{
					GameCenterAndroidUtil.CurrentActivity(),
					Application.identifier,
					Application.version
				});
			if (string.IsNullOrEmpty(text) || VideoManager.lastSQCardInfoString == text)
			{
				return;
			}
			VideoManager.lastSQCardInfoString = text;
			VideoManager.videoLinks.Clear();
			VideoManager.links.Clear();
			VideoManager.titles.Clear();
			VideoManager.packages.Clear();
			VideoData[] array = Utils.FromJson<VideoData>(text);
			List<string> list = new List<string>();
			for (int i = 0; i < array.Length; i++)
			{
				string[] array2 = array[i].video_url.Split(new char[]
					{
						'&'
					});
				string text2 = array2[1];
				list.Add(text2);
				VideoManager.videoLinks.Add(text2, array2[0]);
				VideoManager.links.Add(text2, array[i].pkg_url);
				VideoManager.titles.Add(text2, array[i].text_title);
				VideoManager.packages.Add(text2, array[i].package_name);
			}
			FileInfo[] files = new DirectoryInfo(VideoManager._path).GetFiles("*.mp4");
			for (int j = 0; j < files.Length; j++)
			{
				string text3 = files[j].Name.Split(new char[]
					{
						'.'
					})[0];
				if (VideoManager.videoLinks.ContainsKey(text3))
				{
					if (Utils.FileExists(files[j].FullName, text3))
					{
						if (!VideoManager.VideoPath.ContainsKey(text3))
						{
							VideoManager.VideoPath.Add(text3, files[j].FullName);
						}
						list.Remove(text3);
					}
				}
				else
				{
					if (VideoManager.VideoPath.ContainsKey(text3))
					{
						VideoManager.VideoPath.Remove(text3);
					}
					File.Delete(files[j].FullName);
				}
			}
			foreach (string text4 in list)
			{
				VideoManager.LoadVideo(text4, VideoManager.videoLinks[text4]);
			}
		}

				public static void FileLost(string key)
		{
			VideoManager.videoLinks.Remove(key);
			VideoManager.links.Remove(key);
			VideoManager.titles.Remove(key);
			VideoManager.packages.Remove(key);
			VideoManager.GetVideo();
		}

				private static void LoadVideo(string name, string url)
		{
			string path = Path.Combine(VideoManager._path, name + ".mp4");
			DownLoad.Instance.AddDownLoadTask(new DownLoad.DownloadTask(path, url, name, delegate(DownLoad.DownloadTask task)
				{
					if (!VideoManager.VideoPath.ContainsKey(name))
					{
						VideoManager.VideoPath.Add(name, path);
					}
				}, delegate(DownLoad.DownloadTask task)
				{
					Debug.Log(task.FilePath + "下载失败");
				}));
		}

				private const string AndroidObjectName = "org.machsystem.recommend.cloudv5.SqcardCloudV5";

				private static string lastSQCardInfoString;

				public static Dictionary<string, string> VideoPath;

				public static List<VideoMessage> VideoMessages;

				public static Dictionary<string, string> links;

				public static Dictionary<string, string> titles;

				public static Dictionary<string, string> packages;

				private static string _path;

				private static Dictionary<string, string> videoLinks;

				private static AndroidJavaClass SqcardCloudV5;

				private static bool _isInit;
	}
}
