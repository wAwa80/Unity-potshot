using System;
using System.IO;
using System.Linq;
using GameCenter.Util;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using UnityEngine.Video;

namespace GameCenter.Video
{
		public class PlayerController : Singleton<PlayerController>
	{
				protected override void Awake()
		{
			base.Awake();
			this._videoFrameButton = base.GetComponent<Button>();
			this._videoFrameButton.interactable = false;
			this._videoFrameButton.onClick.AddListener(new UnityAction(this.OnClick));
			if (this._currentUi == null)
			{
				this._currentUi = this.UiFrames[0];
			}
			this._player = base.GetComponent<VideoPlayer>();
			this._player.prepareCompleted += this.OnPrepareCompleted;
		}

				private bool CanPlayVideo()
		{
			return --PlayerController._leftIntervalTimes < 0 && VideoManager.GetEnable();
		}

				private bool PrepareVideo()
		{
			this._videoClickedClickName = string.Empty;
			this._playVideoClickName = string.Empty;
			this._packageName = string.Empty;
			if (VideoManager.VideoPath != null && VideoManager.VideoPath.Count > 0)
			{
				string key = VideoManager.VideoPath.Keys.ElementAt(PlayerController._currentCacheVideoIndex++ % VideoManager.VideoPath.Count);
				string text = VideoManager.VideoPath[key];
				string md = new FileInfo(text).Name.Split(new char[]
					{
						'.'
					})[0];
				if (!Utils.FileExists(text, md))
				{
					VideoManager.FileLost(key);
					return false;
				}
				this.PlayRemoteVideo(key);
			}
			else
			{
				if (VideoManager.VideoMessages == null || VideoManager.VideoMessages.Count <= 0)
				{
					return false;
				}
				this.PlayLocalVideo();
			}
			this._player.Prepare();
			return true;
		}

				public void Play()
		{
			VideoManager.GetVideo();
			if (!this.CanPlayVideo())
			{
				return;
			}
			PlayerController._playCount++;
			this._videoFrameButton.interactable = true;
			this.ChangeUi();
			this._stopVideoCalled = false;
			if (this._player.isPrepared)
			{
				this.PlayVideo();
			}
			else if (!this.PrepareVideo())
			{
				return;
			}
			string name = "gc_20001";
			string title = this._title;
			string packageName = this._packageName;
			string gameLabel = VideoManager.Label();
			string installedPackages = VideoManager.GetInstalledPackages();
			ClickHelper.LogEvent(name, title, packageName, gameLabel, null, installedPackages);
			if (!string.IsNullOrEmpty(this._playVideoClickName))
			{
				ClickHelper.LogEvent(this._playVideoClickName, this._title, this._packageName, null, null, null);
			}
			PlayerController._leftIntervalTimes = VideoManager.PlayerIntervalTimes;
		}

				private void PlayVideo()
		{
			this._player.Play();
			this.VideoContent.SetActive(true);
		}

				private void OnPrepareCompleted(VideoPlayer source)
		{
			if (this._stopVideoCalled)
			{
				return;
			}
			this.PlayVideo();
		}

				private void PlayRemoteVideo(string key)
		{
			this._videoClickedClickName = "gc_20005";
			this._playVideoClickName = "gc_20002";
			this._packageName = VideoManager.packages[key];
			this._link = VideoManager.links[key];
			this._title = VideoManager.titles[key];
			this._player.url = VideoManager.VideoPath[key];
		}

				private void PlayLocalVideo()
		{
			this._playVideoClickName = "gc_20003";
			this._videoClickedClickName = "gc_20006";
			int index = PlayerController._currentLocalVideoIndex++ % VideoManager.VideoMessages.Count;
			VideoMessage videoMessage = VideoManager.VideoMessages[index];
			this._link = videoMessage.gpLink;
			this._title = videoMessage.title;
			this._packageName = videoMessage.packageName;
			this._player.clip = videoMessage.video;
		}

				private void ChangeUi()
		{
			if (--PlayerController._leftCountToChangeUi <= 0)
			{
				PlayerController._leftCountToChangeUi = this.PlayCountToChangeUi;
				foreach (GameObject gameObject in this.UiFrames)
				{
					gameObject.SetActive(false);
				}
				this._currentUi = this.UiFrames[PlayerController._currentUiIndex++ % this.UiFrames.Length];
			}
			this._currentUi.SetActive(true);
			this._animator = this._currentUi.transform.GetComponentInChildren<Animator>();
			this._animator.enabled = true;
			this._currentUi.transform.Find("Title").GetComponent<Text>().text = this._title;
		}

				public void StopPlay()
		{
			this._stopVideoCalled = true;
			this.VideoContent.SetActive(false);
			if (this._animator != null)
			{
				this._animator.enabled = false;
			}
			if (this._player.isPlaying)
			{
				this._player.Stop();
			}
			this._videoFrameButton.interactable = false;
			this.PrepareVideo();
		}

				private void OnClick()
		{
			if (!string.IsNullOrEmpty(this._videoClickedClickName))
			{
				ClickHelper.LogEvent(this._videoClickedClickName, this._title, this._packageName, null, null, null);
			}
			int num = GameCenterAndroidUtil.OpenUrl(this._link);
			ClickHelper.LogEvent("gc_20004", this._title, this._packageName, VideoManager.Label(), num.ToString(), null);
			ClickHelper.RecordClickTime(this._packageName, 1);
		}

				public GameObject VideoContent;

				private VideoPlayer _player;

				public GameObject[] UiFrames;

				public int PlayCountToChangeUi = 2;

				private bool _stopVideoCalled;

				private static int _playCount;

				private static int _currentCacheVideoIndex;

				private static int _currentLocalVideoIndex;

				private static int _leftCountToChangeUi;

				private static int _currentUiIndex;

				private GameObject _currentUi;

				private Animator _animator;

				private string _link;

				private string _title;

				private string _videoClickedClickName;

				private string _packageName;

				private string _playVideoClickName;

				private Button _videoFrameButton;

				private static int _leftIntervalTimes = 1;
	}
}
