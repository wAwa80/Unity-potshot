using System;
using System.Collections;
using Game.Walker;
using UnityEngine;
using UnityEngine.UI;

public class SpinWheel : MonoBehaviour
{
				public int SelectedReward
	{
		get
		{
			return this._selectReward;
		}
		set
		{
			this._selectReward = Mathf.Clamp(value, 0, SpinWheelSetup.Instance.rewarItem.Length);
		}
	}

		private void Awake()
	{
		this.chunkAllSp = Resources.LoadAll<Sprite>("Skins/Chunk");
		this.dotAllSp = Resources.LoadAll<Sprite>("Skins/Dot");
		this.circleBorderAllSp = Resources.LoadAll<Sprite>("Skins/Border");
		this.arrowAllSp = Resources.LoadAll<Sprite>("Skins/BgArrow");
		int theme = (int)SpinWheelSetup.Instance.theme;
		this.chunkSp[0] = this.chunkAllSp[theme];
		this.pointSp[0] = this.dotAllSp[theme];
		this.circleBorderSp = this.circleBorderAllSp[theme];
		this.arrowBgSp = this.arrowAllSp[theme];
		this.SetupWheel();
	}

		private void Start()
	{
	}

		private void OnEnable()
	{
		



		this.BtnBack.SetActive(true);
		this.TextSuperFireReady.SetActive(false);
		this.TextTrialCannon.SetActive(false);
		this.EffectReward.SetActive(false);
		this.OnClickStartSpin();
	}

		private void OnDisable()
	{
		this.WheelAnimation(false);
	}

		public void Init(int baseValue, Action onClose = null, SpinOrigin origin = SpinOrigin.LevelWin)
	{
		this.BaseValue = baseValue;
		this.originFrom = origin;
		foreach (ChunkSlice chunkSlice in this.chunkSlices)
		{
			chunkSlice.UpdateValueText(baseValue.ToString());
		}
		if (onClose != null)
		{
			this.OnClose = onClose;
		}
	}

		public void OnThemeChanged(int themeID)
	{
		this.SetWheelTheme(themeID);
	}

		private void SetWheelTheme(int index)
	{
		this.chunkSp[0] = this.chunkAllSp[index];
		this.pointSp[0] = this.dotAllSp[index];
		this.circleBorderSp = this.circleBorderAllSp[index];
		this.arrowBgSp = this.arrowAllSp[index];
		this.circleBorderSpRend.overrideSprite = this.circleBorderSp;
		this.arrowBgSpRend.overrideSprite = this.arrowBgSp;
	}

		private void SetupWheel()
	{
        
		this.spinning = false;
		this.anglePerItem = (float)(360 / SpinWheelSetup.Instance.rewarItem.Length);
		this.chunkSlices = this.chunksParent.GetComponentsInChildren<ChunkSlice>();
		for (int i = 0; i < 8; i++)
		{
			this.chunkSlices[i].transform.localEulerAngles = new Vector3(0f, 0f, (float)i * -this.anglePerItem);
		}
		this.circleBorderSpRend.overrideSprite = this.circleBorderSp;
		this.arrowBgSpRend.overrideSprite = this.arrowBgSp;
		this.audSource = new AudioSource[5];
		for (int j = 0; j < 5; j++)
		{
			AudioSource audioSource = base.gameObject.AddComponent<AudioSource>();
			audioSource.playOnAwake = false;
			audioSource.loop = false;
			this.audSource[j] = audioSource;
		}
		this.MessageImgDiamond.gameObject.SetActive(false);
		this.MessageImgSkill.gameObject.SetActive(false);
		this.MessageImgCannon.gameObject.SetActive(false);
		this.MessagePanel.SetActive(false);
	}

		public void WheelAnimation(bool playAnim)
	{
		foreach (ChunkSlice chunkSlice in this.chunkSlices)
		{
			chunkSlice.AnimatePoints(playAnim);
			chunkSlice.spRend.overrideSprite = this.chunkSp[0];
		}
		if (playAnim)
		{
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(this.chunkSp[0], this.chunkSp[1]));
		}
		else
		{
			if (this.anim1 != null)
			{
				base.StopCoroutine(this.anim1);
			}
			if (this.anim2 != null)
			{
				base.StopCoroutine(this.anim2);
			}
			if (this.anim3 != null)
			{
				base.StopCoroutine(this.anim3);
			}
		}
	}

		private IEnumerator PlayChunkPatternRoutine(int index)
	{
		if (index > 7)
		{
			this.count = 0;
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(this.chunkSp[0], this.chunkSp[1]));
		}
		else
		{
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[1];
			yield return new WaitForSeconds(0.1f);
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[0];
			yield return new WaitForSeconds(0f);
			this.anim2 = base.StartCoroutine(this.PlayChunkPatternRoutine(index + 1));
		}
		yield break;
	}

		private IEnumerator PlayLoopRoutine(Sprite sp1, Sprite sp2)
	{
		yield return new WaitForSeconds(0.2f);
		this.count++;
		for (int i = 0; i < this.chunkSlices.Length; i++)
		{
			this.chunkSlices[i].spRend.overrideSprite = ((i % 2 != 0) ? sp2 : sp1);
		}
		if (this.count < UnityEngine.Random.Range(10, 25))
		{
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(sp2, sp1));
		}
		else
		{
			this.anim2 = base.StartCoroutine(this.PlayChunkPatternRoutine(0));
		}
		yield break;
	}

		private IEnumerator PlayRewardChunk(int index)
	{
		for (int i = 0; i < 8; i++)
		{
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[1];
			yield return new WaitForSeconds(0.15f);
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[0];
			yield return new WaitForSeconds(0.15f);
		}
		this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[1];
		yield break;
	}

		public void PlayHitClip()
	{
		for (int i = 0; i < this.audSource.Length; i++)
		{
			if (!this.audSource[i].isPlaying)
			{
				this.audSource[i].clip = this.pointHitSound;
				this.audSource[i].Play();
				break;
			}
		}
	}

			public static SpinWheel Instance
	{
		get
		{
			if (SpinWheel._instance == null)
			{
				SpinWheel._instance = UnityEngine.Object.FindObjectOfType<SpinWheel>();
			}
			return SpinWheel._instance;
		}
	}

		public void OnClickStartSpin()
	{
		if (!this.spinning)
		{
			SpinOrigin spinOrigin = this.originFrom;
			if (spinOrigin != SpinOrigin.LevelWin)
			{
				if (spinOrigin == SpinOrigin.CollectionDiamond)
				{
					GameHelper.LogEvent(Texts.StatisticsEventCollectionDiamondStartSpinVideo, new string[]
					{
						"level",
						GameMenu.Instance.currentLevel.ToString(),
						"prefabName",
						GameWorld.Instance.CurrentParefabName
					});
					GameHelper.PlayRewardVideo(this.OnVideoReward,this.OnVideoEnd, this.OnVideoFailed, Texts.VideoParameterCollectionDiamondStartSpin, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
				}
			}
			else
			{
				GameHelper.LogEvent(Texts.StatisticsEventStartSpinVideo, new string[]
				{
					"level",
					GameMenu.Instance.currentLevel.ToString(),
					"prefabName",
					GameWorld.Instance.CurrentParefabName
				});

                // 判断奖励视频是否准备好
                // if (PolyAndroidCall.isRewardReady())
                // {
                //     // 显示视频
                //     PolyAndroidCall.showRewardAd();
                //     PolyAndroidCall.nState = 3;
                // }
#if UNITY_EDITOR
                OnVideoReward();
#else
                GameHelper.PlayRewardVideo(this.OnVideoReward, this.OnVideoEnd, this.OnVideoFailed, Texts.VideoParameterStartSpin, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
#endif 
                //HACK 广告： 大转盘 屏蔽


                //HACK   买10
                if (Analytics.Instance != null)
                {

                    Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zuanshifanbeishipinbofang_cishu, 1 + "");
                    Analytics.Instance.SendMessageByID(AllDataInGameTest.zuanshifanbeishipinbofang_cishu, 1 + "");
                }

            }
		}
	}

		private void OnVideoReward()
	{
        this.WheelAnimation(true);
        //IronSourceEvents.onRewardedVideoAdRewardedEvent -= this.OnVideoReward;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		if (GameMenu.Instance.currentsubLevel == GameWorld.Instance.subLevelCount)
		{
			GameMenu.Instance.AlreadyRewardVideo = true;
		}
		SpinOrigin spinOrigin = this.originFrom;
		if (spinOrigin != SpinOrigin.LevelWin)
		{
			if (spinOrigin == SpinOrigin.CollectionDiamond)
			{
				GameHelper.LogEvent(Texts.StatisticsEventCollectionDiamondStartSpinVideoSucceed, new string[]
				{
					"level",
					GameMenu.Instance.currentLevel.ToString(),
					"prefabName",
					GameWorld.Instance.CurrentParefabName
				});
			}
		}
		else
		{
			GameHelper.LogEvent(Texts.StatisticsEventStartSpinVideoSucceed, new string[]
			{
				"level",
				GameMenu.Instance.currentLevel.ToString(),
				"prefabName",
				GameWorld.Instance.CurrentParefabName
			});

            //HACK   买11
            if (Analytics.Instance != null)
            {

                Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zuanshifanbeishipinwancheng_cishu, 1 + "");
                Analytics.Instance.SendMessageByID(AllDataInGameTest.zuanshifanbeishipinwancheng_cishu, 1 + "");
            }
        }
		this.StartSpin();
	}

		private void OnVideoEnd()
	{
		//IronSourceEvents.onRewardedVideoAdEndedEvent -= this.OnVideoEnd;
		//IronSourceEvents.onRewardedVideoAdClosedEvent -= this.OnVideoEnd;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
	}

		private void OnVideoFailed()
	{
		//IronSourceEvents.onRewardedVideoAdShowFailedEvent -= this.OnVideoFailed;
		EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
		EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
		{
			Content = Texts.String_VideoFailedContent
		});
	}

		public void StartSpin()
	{
		this.randomTime = UnityEngine.Random.Range(SpinWheelSetup.Instance.spinDurationMin, SpinWheelSetup.Instance.spinDurationMax);
		this.SelectedReward = UnityEngine.Random.Range(0, 8);
		float maxAngle = (float)(SpinWheelSetup.Instance.speed * 360 * this.randomTime) + (float)this.SelectedReward * this.anglePerItem;
		this.WheelAnimation(false);
		base.StartCoroutine(this.SpinTheWheel((float)this.randomTime, maxAngle));
		this.BtnBack.SetActive(false);
	}

		private IEnumerator SpinTheWheel(float time, float maxAngle)
	{
		this.spinning = true;
		float timer = 0f;
		float startAngle = this.chunksParent.transform.eulerAngles.z;
		maxAngle -= startAngle;
		while (timer < time)
		{
			float angle = maxAngle * this.animationCurve.Evaluate(timer / time);
			this.chunksParent.transform.eulerAngles = new Vector3(0f, 0f, angle + startAngle);
			timer += Time.deltaTime;
			yield return 0;
		}
		this.chunksParent.transform.eulerAngles = new Vector3(0f, 0f, maxAngle + startAngle);
		this.ShowReward();
		this.spinning = false;
		this.BtnBack.SetActive(true);
		yield break;
	}

		private void ShowReward()
	{
		MonoBehaviour.print("You have won " + this.SelectedReward);
		base.StartCoroutine(this.PlayRewardEffect());
		this.anim3 = base.StartCoroutine(this.PlayRewardChunk(this.SelectedReward));
		this.RewardPlayer();
	}

		public void OnClickGetReward()
	{
		this.RewardPlayer();
		this.MessagePanel.SetActive(false);
	}

		private void RewardPlayer()
	{
		switch (SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardType)
		{
		case RewardType.Diamond:
			EventDispatcher.TriggerEvent<Vector3>(Texts.EventSpawnUIDiamonds, this.DiamondEffectPoint.position);
			EventDispatcher.TriggerEvent<int>(Texts.EventSpinRewardDiamond, SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardQuantity);
			break;
		case RewardType.SuperFire:
			base.StartCoroutine(this.PlayTextSuperFireReady());
			EventDispatcher.TriggerEvent<string>(Texts.EventSpinRewardSuperFire, SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardId);
			break;
		case RewardType.Cannon:
			base.StartCoroutine(this.PlayTextTrialCannon());
			EventDispatcher.TriggerEvent<string, int>(Texts.EventSpinRewardCannon, SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardId, SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardQuantity);
			break;
		case RewardType.DiamondRatio:
			EventDispatcher.TriggerEvent<Vector3>(Texts.EventSpawnUIDiamonds, this.DiamondEffectPoint.position);
			EventDispatcher.TriggerEvent<int>(Texts.EventSpinRewardDiamond, this.BaseValue * SpinWheelSetup.Instance.rewarItem[this.SelectedReward].rewardQuantity);
			break;
		}
	}

		private IEnumerator PlayRewardEffect()
	{
		this.EffectReward.SetActive(false);
		yield return new WaitForEndOfFrame();
		this.EffectReward.SetActive(true);
		yield return new WaitForSeconds(1.5f);
		this.EffectReward.SetActive(false);
		yield break;
	}

		private IEnumerator PlayTextSuperFireReady()
	{
		this.TextSuperFireReady.SetActive(false);
		yield return new WaitForEndOfFrame();
		this.TextSuperFireReady.SetActive(true);
		yield return new WaitForSeconds(1.5f);
		this.TextSuperFireReady.SetActive(false);
		yield break;
	}

		private IEnumerator PlayTextTrialCannon()
	{
		this.TextTrialCannon.SetActive(false);
		yield return new WaitForEndOfFrame();
		this.TextTrialCannon.SetActive(true);
		yield return new WaitForSeconds(1.5f);
		this.TextTrialCannon.SetActive(false);
		yield break;
	}

		internal void HitStart(Image sp)
	{
		this.PlayHitClip();
		sp.overrideSprite = this.pointSp[1];
	}

		internal void HitEnd(Image sp)
	{
		sp.overrideSprite = this.pointSp[0];
	}

		public void OnClickBack()
	{
		base.gameObject.SetActive(false);
		if (this.OnClose != null)
		{
			this.OnClose();
		}
	}

		public Image circleBorderSpRend;

		public Image arrowBgSpRend;

		public AudioClip pointHitSound;

		public Transform chunksParent;

		public Sprite[] pointSp;

		public Sprite[] chunkSp;

		public Sprite circleBorderSp;

		public Sprite arrowBgSp;

		public AnimationCurve animationCurve;

		public Transform DiamondEffectPoint;

		public GameObject MessagePanel;

		public Image MessageImgSkill;

		public Image MessageImgDiamond;

		public Image MessageImgCannon;

		public Text MessageTextContent;

		private bool spinning;

		private float anglePerItem;

		private int randomTime;

		private AudioSource[] audSource;

		private ChunkSlice[] chunkSlices;

		private Sprite[] chunkAllSp;

		private Sprite[] dotAllSp;

		private Sprite[] circleBorderAllSp;

		private Sprite[] arrowAllSp;

		public GameObject BtnBack;

		public GameObject TextSuperFireReady;

		public GameObject TextTrialCannon;

		public GameObject EffectReward;

		public GameObject ImgTrial;

		private Coroutine anim1;

		private Coroutine anim2;

		private Coroutine anim3;

		private int _selectReward;

		private int BaseValue;

		private Action OnClose;

		public SpinOrigin originFrom;

		private int count;

		private static SpinWheel _instance;
}
