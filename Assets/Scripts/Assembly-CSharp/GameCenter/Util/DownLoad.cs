using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

namespace GameCenter.Util
{
		public class DownLoad : MonoBehaviour
	{
						public static DownLoad Instance
		{
			get
			{
				if (DownLoad._instance == null)
				{
					GameObject gameObject = new GameObject("DownLoadManager");
					DownLoad._instance = gameObject.AddComponent<DownLoad>();
					UnityEngine.Object.DontDestroyOnLoad(gameObject);
				}
				return DownLoad._instance;
			}
		}

				private void Awake()
		{
			this._tasks = new Queue<DownLoad.DownloadTask>();
		}

				public void AddDownLoadTask(DownLoad.DownloadTask task)
		{
			this._tasks.Enqueue(task);
			if (!this._isDownloding)
			{
				base.StartCoroutine(this.C_DownloadFile());
			}
		}

				private void DownloadNext()
		{
			this._isDownloding = false;
			if (Application.internetReachability == NetworkReachability.NotReachable)
			{
				return;
			}
			if (this._tasks.Count > 0)
			{
				base.StartCoroutine(this.C_DownloadFile());
			}
		}

				private IEnumerator C_DownloadFile()
		{
			this._isDownloding = true;
			DownLoad.DownloadTask task = this._tasks.Dequeue();
			if (File.Exists(task.FilePath))
			{
				if (!(task.Md5 != Utils.CalculateMD5Hash(task.FilePath)))
				{
					this.DownloadNext();
					yield break;
				}
				File.Delete(task.FilePath);
			}
			UnityWebRequest uwr = new UnityWebRequest(task.Url, "GET")
			{
				downloadHandler = new DownloadHandlerFile(task.FilePath, 4096, FileShare.ReadWrite)
				{
					removeFileOnAbort = true
				},
				timeout = 600
			};
			yield return uwr.Send();
			if (uwr.isNetworkError)
			{
				if (task.OnDownloadFailed != null)
				{
					task.OnDownloadFailed(task);
				}
				this._tasks.Enqueue(task);
			}
			else if (uwr.isDone && task.OnDownloadComplete != null)
			{
				task.OnDownloadComplete(task);
			}
			this.DownloadNext();
			yield break;
		}

				private static DownLoad _instance;

				private Queue<DownLoad.DownloadTask> _tasks;

				private bool _isDownloding;

				public sealed class DownloadTask
		{
						public DownloadTask(string filePath, string url, string md5, Action<DownLoad.DownloadTask> onDownloadComplete = null, Action<DownLoad.DownloadTask> onDownloadFailed = null)
			{
				this.FilePath = filePath;
				this.Url = url;
				this.Md5 = md5;
				this.OnDownloadComplete = onDownloadComplete;
				this.OnDownloadFailed = onDownloadFailed;
			}

						public readonly string FilePath;

						public readonly string Url;

						public readonly string Md5;

						public readonly Action<DownLoad.DownloadTask> OnDownloadComplete;

						public readonly Action<DownLoad.DownloadTask> OnDownloadFailed;
		}
	}
}
