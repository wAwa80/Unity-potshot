using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

namespace GameCenter.Util
{
		public class DownLoadManager : MonoBehaviour
	{
				public static DownLoadManager GetInstance()
		{
			if (DownLoadManager._instance == null)
			{
				GameObject gameObject = new GameObject("DownLoadManager");
				DownLoadManager._instance = gameObject.AddComponent<DownLoadManager>();
				UnityEngine.Object.DontDestroyOnLoad(gameObject);
			}
			if (DownLoadManager._downloadTasks == null)
			{
				DownLoadManager._downloadTasks = new List<DownloadTask>();
			}
			return DownLoadManager._instance;
		}

				public void DownLoadFile(DownloadTask task)
		{
			base.StartCoroutine(this.C_DownloadFile(task));
		}

				private IEnumerator C_DownloadFile(DownloadTask task)
		{
			if (DownLoadManager._downloadTasks.Contains(task))
			{
				yield break;
			}
			DownLoadManager._downloadTasks.Add(task);
			if (File.Exists(task.filePath) && task.md5 != Utils.CalculateMD5Hash(task.filePath))
			{
				File.Delete(task.filePath);
			}
			UnityWebRequest uwr = new UnityWebRequest(task.url, "GET")
			{
				chunkedTransfer = false
			};
			DownloadHandlerFile dh = new DownloadHandlerFile(task.filePath, 4096, FileShare.ReadWrite)
			{
				removeFileOnAbort = true
			};
			uwr.downloadHandler = dh;
			yield return uwr.Send();
			if (!uwr.isNetworkError)
			{
				if (uwr.isDone)
				{
					if (task.OnDownloadCompelete != null)
					{
						task.OnDownloadCompelete(task);
					}
					DownLoadManager._downloadTasks.Remove(task);
				}
			}
			yield break;
		}

				private static DownLoadManager _instance;

				private static List<DownloadTask> _downloadTasks;
	}
}
