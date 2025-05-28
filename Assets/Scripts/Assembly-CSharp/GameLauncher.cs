using System;
using UnityEngine;

public class GameLauncher
{
				public Action OnInterstitialEndListener { get; set; }

				public Action OnInterstitialShowListener { get; set; }

				public Action OnInterstitialAdClickedListener { get; set; }

			public static GameLauncher Instance
	{
		get
		{
			if (GameLauncher.self == null)
			{
				GameLauncher.self = new GameLauncher();
			}
			return GameLauncher.self;
		}
	}

		public void Awake(GameObject[] objects)
	{
		if (!GameLauncher.IsAwaked)
		{
			GameLauncher.IsAwaked = true;
			if (objects != null)
			{
				foreach (GameObject original in objects)
				{
					UnityEngine.Object.Instantiate<GameObject>(original);
				}
			}
			Screen.sleepTimeout = -1;
			this.GameStartTime = Time.time;
			/*IronSource.Agent.init("8a886b85", new string[]
			{
				IronSourceAdUnits.REWARDED_VIDEO,
				IronSourceAdUnits.INTERSTITIAL
			});
			IronSource.Agent.shouldTrackNetworkState(true);
			IronSourceEvents.onInterstitialAdReadyEvent += this.onInterstitialAdReadyEvent;
			IronSourceEvents.onInterstitialAdLoadFailedEvent += this.onInterstitialAdLoadFailedEvent;
			IronSourceEvents.onInterstitialAdClickedEvent += this.onInterstitialAdClickedEvent;
			IronSourceEvents.onInterstitialAdOpenedEvent += this.onInterstitialAdOpenedEvent;
			IronSourceEvents.onInterstitialAdClosedEvent += this.onInterstitialAdClosedEvent;
			IronSource.Agent.loadInterstitial();
			IronSourceEvents.onBannerAdLoadedEvent += this.onBannerAdLoadedEvent;
			IronSourceEvents.onBannerAdLoadFailedEvent += this.onBannerAdLoadFailedEvent;*/
			MachbirdSDKHelper.Init();
		}
	}

		public void Start()
	{
		if (!GameLauncher.IsStarted)
		{
			GameLauncher.IsStarted = true;
			//IronSource.Agent.validateIntegration();
		}
	}

		private void OnInitComplete()
	{
	}

		private void OnHideUnity(bool isGameShown)
	{
		Debug.LogWarning("FB: Is game shown: " + isGameShown);
	}

		public void OnApplicationPause(bool isPaused)
	{
		//IronSource.Agent.onApplicationPause(isPaused);
	}

		public void OnApplicationQuit()
	{
		Debug.Log("Application ending after " + Time.time + " seconds");
	}

		private void onInterstitialAdReadyEvent()
	{
	}

		private void onInterstitialAdLoadFailedEvent()
	{
		//Debug.Log("onInterstitialAdLoadFailedEvent: " + error.ToString());
		//IronSource.Agent.loadInterstitial();
		this.OnInterstitialEndListener = null;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
	}

		private void onInterstitialAdOpenedEvent()
	{
		if (this.OnInterstitialShowListener != null)
		{
			this.OnInterstitialShowListener();
			this.OnInterstitialShowListener = null;
		}
	}

		private void onInterstitialAdClickedEvent()
	{
		if (this.OnInterstitialAdClickedListener != null)
		{
			this.OnInterstitialAdClickedListener();
			this.OnInterstitialAdClickedListener = null;
		}
	}

		private void onInterstitialAdClosedEvent()
	{
		Debug.Log("onInterstitialAdClosedEvent ");
		//IronSource.Agent.loadInterstitial();
		if (this.OnInterstitialEndListener != null)
		{
			this.OnInterstitialEndListener();
			this.OnInterstitialEndListener = null;
		}
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
	}

		private void onBannerAdLoadedEvent()
	{
		Debug.Log("onBannerAdLoadedEvent ");
		this.IsBannerLoaded = true;
	}

		private void onBannerAdLoadFailedEvent()
	{
		//Debug.Log("onBannerAdLoadFailedEvent: " + error.ToString());
	}

		[NonSerialized]
	public bool IsBannerLoaded;

		public static bool IsAwaked;

		public static bool IsStarted;

		private static GameLauncher self;

		public float GameStartTime;
}
