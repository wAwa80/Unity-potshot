using System;
using System.Collections;
using System.Collections.Generic;
using EZCameraShake;
using Game.Walker;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using Sirenix.OdinInspector;
using UnityEngine.U2D;
//using Umeng;

public enum LoseChangeStateMgr
{
    Normal,
    First,
    Second
}
public  enum LoseChangeState
{
    Normal,
    Win,
    Dying,
    Lost
}
public static  class  StateController
{
    public static LoseChangeState currentState  = LoseChangeState.Normal;
}
public class GameMenu : MonoBehaviour
{
                public int BestScore { get; set; }

                public int currentLevel { get; set; }

                public int currentsubLevel { get; set; }

                public string CurrentSceneName { get; set; }

                public bool IsRandomScene { get; set; }

                public bool TrialCannonShown { get; set; }

                public string CurrentAvatarId { get; set; }

            
    //hack  无线金币 设置
    public int Diamond;

    public int InitDiamond;
    [Button("重新设置金币", ButtonStyle.Box)]
    private void SetDiamod()
    {
        PlayerPrefs.SetInt(Texts.DiamondCount, InitDiamond);
    }


                public List<string> UnlockedAvatarIds { get; set; }

                public List<string> UnlockedSceneIds { get; set; }

                public List<string> UnlockedSuperFireIds { get; set; }

                public List<string> RedDotAvatarIds { get; set; }

                public List<string> RedDotSceneIds { get; set; }

                public List<string> RedDotSuperFireIds { get; set; }

                public List<string> RedDotCollectionIds { get; set; }

                public List<string> NewUnlockIds { get; set; }

                public List<string> NewUnlockAvatarIds { get; set; }

                public static GameMenu Instance
    {
        get
        { return GameObject.Find("ButtonCanvas").GetComponent<GameMenu>(); }


        private set { }
    }

                public string CurrentSuperFireId { get; set; }

                public SuperFireInfo CurrentSuperFireInfo
    {
        get
        {
            if (!string.IsNullOrEmpty(this.AdditionalSuperFireId))
            {
                return GameDataManager.SuperFireInfoDatas[GameDataManager.SuperFireIds.IndexOf(this.AdditionalSuperFireId)];
            }
            if (this.currentSuperFireInfo == null)
            {
                this.currentSuperFireInfo = GameDataManager.SuperFireInfoDatas[GameDataManager.SuperFireIds.IndexOf(this.CurrentSuperFireId)];
            }
            return this.currentSuperFireInfo;
        }
        set
        {
            this.currentSuperFireInfo = value;
        }
    }

                public bool EnableVoice { get; set; }

                public bool EnableShake { get; set; }

                public bool IsRateShown { get; set; }

                public bool IsGDPRAgreed { get; set; }

    SpriteAtlas saDecoration;  //图集
    public GameObject m_objPlay; // play 按钮

    public Image imgFillSupFire; //填充 遮罩图
    public int nZuan;
    public int nLevel;
    //手动设置
    public int nGold;
    public int nTepLevel; 
    private void Awake()
    {
        PlayerPrefs.SetInt(Texts.DiamondCount, nGold);
        //PlayerPrefs.SetInt(Texts.CurrentLevel, nTepLevel);
        //PlayerPrefs.SetInt(Texts.DiamondCount, 5000);
        //PlayerPrefs.SetInt(Texts.CurrentLevel, 75);
        loseTimerHolder = 5;
        cannonCtr = GameObject.Find("CannonParent").GetComponent<CannonController>();
        saDecoration = Resources.Load<SpriteAtlas>("Decoration");

        GameMenu.Instance = this;
        this.GetPlayerDatas();
        this.hudTitleLevelFrom0 = Resources.Load<Sprite>(Texts.HudTitleLevelFrom0Path);
        this.hudTitleLevelFrom1 = Resources.Load<Sprite>(Texts.HudTitleLevelFrom1Path);
        this.hudTitleLevelTo0 = Resources.Load<Sprite>(Texts.HudTitleLevelTo0Path);
        this.hudTitleLevelTo1 = Resources.Load<Sprite>(Texts.HudTitleLevelTo1Path);
        this.hudTitleSubLevelImg0 = Resources.Load<Sprite>(Texts.HudTitleSubLevelImg0);
        this.hudTitleSubLevelImg1 = Resources.Load<Sprite>(Texts.HudTitleSubLevelImg1);
        this.hudTitleSubLevelImg2 = Resources.Load<Sprite>(Texts.HudTitleSubLevelImg2);
        for (int i = 0; i < this.gradeSprites.Length; i++)
        {
            this.gradeSprites[i] = Resources.Load<Sprite>(Texts.GradeImagePaths[i]);
        }
        for (int j = 0; j < this.gradeAudioClips.Length; j++)
        {
            this.gradeAudioClips[j] = Resources.Load<AudioClip>(Texts.GradeAudioClipPath[j]);
        }
        AudioListener.pause = !this.EnableVoice;
        this.levelNoText.text = Texts.String_LEVEL + "  " + this.currentLevel;
        this.bestScoreText.text = /*Texts.String_bestscore + */this.BestScore.ToString();
        this.TextDiamond.text = this.Diamond.ToString();
        EventDispatcher.AddEventListener<bool>(Texts.EventShowLoading, new Action<bool>(this.ShowLoading));
        EventDispatcher.AddEventListener<int>(Texts.EventSpinRewardDiamond, new Action<int>(this.OnSpinRewardDiamond));
        EventDispatcher.AddEventListener<string>(Texts.EventSpinRewardSuperFire, new Action<string>(this.OnSpinRewardSuperFire));
        EventDispatcher.AddEventListener<string, int>(Texts.EventSpinRewardCannon, new Action<string, int>(this.OnSpinRewardCannon));
    }

        private void GetPlayerDatas()
    {
        this.currentLevel = PlayerPrefs.GetInt(Texts.CurrentLevel, 1);
        this.BestScore = PlayerPrefs.GetInt(Texts.BestScore, 0);
#if UNITY_EDITOR
        this.Diamond = PlayerPrefs.GetInt(Texts.DiamondCount, InitDiamond);
#else
        this.Diamond = PlayerPrefs.GetInt(Texts.DiamondCount);
#endif
        this.CurrentAvatarId = PlayerPrefs.GetString(Texts.CurrentAvatarId, GameDataManager.DefaultAvatarId);
        this.IsRandomScene = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.IsRandomScene, 1));
        this.CurrentSceneName = PlayerPrefs.GetString(Texts.CurrentSceneName, GameDataManager.DefaultSceneId);
        this.EnableVoice = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.IsEnableVoice, 1));
        this.EnableShake = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.IsEnableShake, 1));
        this.TrialCannonShown = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.TrialCannonShown, 0));
        this.CurrentSuperFireId = PlayerPrefs.GetString(Texts.CurrentSuperFireId, GameDataManager.DefaultSuperFireId);
        this.CurrentSuperFireInfo = GameDataManager.SuperFireInfoDatas[GameDataManager.SuperFireIds.IndexOf(this.CurrentSuperFireId)];
        this.IsRateShown = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.IsRateShown, 0));
        this.IsGDPRAgreed = Convert.ToBoolean(PlayerPrefs.GetInt(Texts.IsGDPRAgreed, 0));
        List<string> list = new List<string>();
        string[] stringArray = PlayerPrefsX.GetStringArray(Texts.UnlockedAvatarIds);

        //HACK GUAN 7

        if (BestScore != 0 && Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zuigaofen, BestScore + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.zuigaofen, BestScore+ "");

        }

        this.UnlockedAvatarIds = new List<string>();
        if (stringArray.Length == 0)
        {
            list.Add(GameDataManager.DefaultAvatarId);
        }
        else
        {
            list.AddRange(stringArray);
        }
        for (int i = 0; i < list.Count; i++)
        {
            string item = list[i];
            if (!this.UnlockedAvatarIds.Contains(item))
            {
                this.UnlockedAvatarIds.Add(item);
            }
        }
        list.Clear();
        string[] stringArray2 = PlayerPrefsX.GetStringArray(Texts.UnlockedSceneIds);

        this.UnlockedSceneIds = new List<string>();
        if (stringArray2.Length == 0)
        {
            list.Add(GameDataManager.DefaultSceneId);
        }
        else
        {
            list.AddRange(stringArray2);
        }
        for (int j = 0; j < list.Count; j++)
        {
            string item2 = list[j];
            if (!this.UnlockedSceneIds.Contains(item2))
            {
                this.UnlockedSceneIds.Add(item2);
            }
        }
        list.Clear();
        string[] stringArray3 = PlayerPrefsX.GetStringArray(Texts.UnlockedSuperFireIds);
        this.UnlockedSuperFireIds = new List<string>();
        if (stringArray3.Length == 0)
        {
            list.Add(GameDataManager.DefaultSuperFireId);
        }
        else
        {
            list.AddRange(stringArray3);
        }
        for (int k = 0; k < list.Count; k++)
        {
            string item3 = list[k];
            if (!this.UnlockedSuperFireIds.Contains(item3))
            {
                this.UnlockedSuperFireIds.Add(item3);
            }
        }
        list.Clear();
        string[] stringArray4 = PlayerPrefsX.GetStringArray(Texts.RedDotAvatarIds);
        this.RedDotAvatarIds = new List<string>();
        if (stringArray4.Length == 0)
        {
            list.Add(GameDataManager.DefaultAvatarId);
        }
        else
        {
            list.AddRange(stringArray4);
        }
        for (int l = 0; l < list.Count; l++)
        {
            string item4 = list[l];
            if (!this.RedDotAvatarIds.Contains(item4))
            {
                this.RedDotAvatarIds.Add(item4);
            }
        }
        list.Clear();
        string[] stringArray5 = PlayerPrefsX.GetStringArray(Texts.RedDotSceneIds);
        this.RedDotSceneIds = new List<string>();
        if (stringArray5.Length == 0)
        {
            list.Add(GameDataManager.DefaultSceneId);
        }
        else
        {
            list.AddRange(stringArray5);
        }
        for (int m = 0; m < list.Count; m++)
        {
            string item5 = list[m];
            if (!this.RedDotSceneIds.Contains(item5))
            {
                this.RedDotSceneIds.Add(item5);
            }
        }
        list.Clear();
        string[] stringArray6 = PlayerPrefsX.GetStringArray(Texts.RedDotSuperFireIds);
        this.RedDotSuperFireIds = new List<string>();
        if (stringArray6.Length == 0)
        {
            list.Add(GameDataManager.DefaultSuperFireId);
        }
        else
        {
            list.AddRange(stringArray6);
        }
        for (int n = 0; n < list.Count; n++)
        {
            string item6 = list[n];
            if (!this.RedDotSuperFireIds.Contains(item6))
            {
                this.RedDotSuperFireIds.Add(item6);
            }
        }
        list.Clear();
        string[] stringArray7 = PlayerPrefsX.GetStringArray(Texts.RedDotCollectionIds);
        this.RedDotCollectionIds = new List<string>();
        if (stringArray7.Length > 0)
        {
            list.AddRange(stringArray7);
        }
        for (int num = 0; num < list.Count; num++)
        {
            string item7 = list[num];
            if (!this.RedDotCollectionIds.Contains(item7))
            {
                this.RedDotCollectionIds.Add(item7);
            }
        }
        list.Clear();
        string[] stringArray8 = PlayerPrefsX.GetStringArray(Texts.NewUnlockIds);
        this.NewUnlockIds = new List<string>();
        if (stringArray8.Length == 0)
        {
            list.Add(GameDataManager.DefaultAvatarId);
            list.Add(GameDataManager.DefaultSceneId);
            list.Add(GameDataManager.DefaultSuperFireId);
        }
        else
        {
            list.AddRange(stringArray8);
        }
        for (int num2 = 0; num2 < list.Count; num2++)
        {
            string item8 = list[num2];
            if (!this.NewUnlockIds.Contains(item8))
            {
                this.NewUnlockIds.Add(item8);
            }
        }
        list.Clear();
        string[] stringArray9 = PlayerPrefsX.GetStringArray(Texts.NewUnlockAvatarIds);
        this.NewUnlockAvatarIds = new List<string>();
        if (stringArray9.Length == 0)
        {
            list.Add(GameDataManager.DefaultAvatarId);
        }
        else
        {
            list.AddRange(stringArray9);
        }
        for (int num3 = 0; num3 < list.Count; num3++)
        {
            string item9 = list[num3];
            if (!this.NewUnlockAvatarIds.Contains(item9))
            {
                this.NewUnlockAvatarIds.Add(item9);
            }
        }
        this.PrefabBreakTimesDic = PlayerPrefsX.GetObject<Dictionary<string, int>>(Texts.PrefabBreakTimes, new Dictionary<string, int>());
        this.CollectionRewardedIndexsDic = PlayerPrefsX.GetObject<Dictionary<string, List<int>>>(Texts.CollectionRewardedTimes, new Dictionary<string, List<int>>());
        if (GameDataManager.SuperGame)
        {
            this.UnlockedAvatarIds = new List<string>();
            this.UnlockedAvatarIds.AddRange(GameDataManager.PlayerAvatarIds);
            this.UnlockedSceneIds = new List<string>();
            this.UnlockedSceneIds.AddRange(GameDataManager.SceneBGs);
            this.UnlockedSuperFireIds = new List<string>();
            this.UnlockedSuperFireIds.AddRange(GameDataManager.SuperFireIds);
            this.RedDotAvatarIds = new List<string>();
            this.RedDotAvatarIds.AddRange(GameDataManager.PlayerAvatarIds);
            this.RedDotSceneIds = new List<string>();
            this.RedDotSceneIds.AddRange(GameDataManager.SceneBGs);
            this.RedDotSuperFireIds = new List<string>();
            this.RedDotSuperFireIds.AddRange(GameDataManager.SuperFireIds);
            this.NewUnlockIds = new List<string>();
            this.NewUnlockIds.AddRange(GameDataManager.PlayerAvatarIds);
            this.NewUnlockIds.AddRange(GameDataManager.SceneBGs);
            this.NewUnlockIds.AddRange(GameDataManager.SuperFireIds);
            this.NewUnlockAvatarIds = new List<string>();
            this.NewUnlockAvatarIds.AddRange(GameDataManager.PlayerAvatarIds);
        }
        this.UpdateUnlockInfo();
    }

        private void Start()
    {
        MachbirdSDKHelper.LogMainPageShow();
        this.BGColorChange();
        this.menuPanel.SetActive(true);
        //hack 关2
        if (Analytics.Instance != null)
           
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");

        }
        
        MachbirdSDKHelper.PlayVideo();
        this.hudPanel.SetActive(false);
        this.ImgNewUnlock.SetActive(false);
        this.winPanel.SetActive(false);
        this.losePanel.SetActive(false);
        this.TrialCannonGuidePanel.SetActive(false);
        this.currentsubLevel = 0;
        this.LoadSceneBG();
        this.LoadSuperFireIcon();
        this.CheckGDPR();
        if (GameDataManager.IsFromLost)
        {
            GameDataManager.IsFromLost = false;
            //HACK Rate 界面修改
            //this.CheckRateShown();
        }
    }

        private void CheckGDPR()
    {
        if (MachbirdSDKHelper.IsEurope())
        {
            if (!this.IsGDPRAgreed)
            {
                MachbirdSDKHelper.LogGdprPageShow();
                this.GDPRPanel.SetActive(true);
            }
        }
        else if (!this.IsGDPRAgreed || !MachbirdSDKHelper.IsPersonalizedAdAgree())
        {
            if (!this.IsGDPRAgreed)
            {
                this.IsGDPRAgreed = true;
            }
            if (!MachbirdSDKHelper.IsPersonalizedAdAgree())
            {
                MachbirdSDKHelper.SetPersonalizedAdAgree(true);
            }
            this.SetPlayerData();
        }
    }

        public void LoadSceneBG()
    {
        if (this.IsRandomScene)
        {
            this.CurrentSceneName = this.UnlockedSceneIds[UnityEngine.Random.Range(0, this.UnlockedSceneIds.Count)];
            print(CurrentSceneName + " 要加载的场景");
        }
        if (this.currentScene && this.currentScene.name != this.CurrentSceneName)
        {
            UnityEngine.Object.Destroy(this.currentScene);
            this.currentScene = null;
        }
        if (!this.currentScene)
        {
            GameObject original = Resources.Load<GameObject>(Texts.ScenePath + this.CurrentSceneName);
            Debug.Log(Texts.ScenePath + this.CurrentSceneName);
            this.currentScene = UnityEngine.Object.Instantiate<GameObject>(original);
        }
    }
    /// <summary>
    /// Load  3Dscene Background
    /// </summary>
    public void Load3DsceneBg()
    {
        if (this.IsRandomScene)
        {
            this.CurrentSceneName = this.UnlockedSceneIds[UnityEngine.Random.Range(0, this.UnlockedSceneIds.Count)];
        }
        if (this.currentScene && this.currentScene.name != this.CurrentSceneName)
        {
            UnityEngine.Object.Destroy(this.currentScene);
            this.currentScene = null;
        }
        if (!this.currentScene)
        {
            GameObject original = Resources.Load<GameObject>(Texts.ScenePath + this.CurrentSceneName);
            this.currentScene = UnityEngine.Object.Instantiate<GameObject>(original);
        }
    }

        public void LoadSuperFireIcon()
    {
        this.ImgSuperFireIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + this.CurrentSuperFireId.ToString()+"a");
        this.TextSuperFireName.text = this.CurrentSuperFireInfo.Name;
    }

        public void OnFireTouchDown()
    {
        this.isFireDown = true;
    }

        public void OnFireTouchUp()
    {
        this.isFireDown = false;
    }

        public void ToLost()
    {
        loseTimerHolder = 5;
        //loseTime = 0f;
        //if (loseTime == 0)
        //{
        //    return;
        //}
        if (this.currentLevel != 0)
        {
            //Umeng关卡失败
            //GA.FinishLevel(currentLevel + "-" + currentsubLevel);

        }
        e_loseState = LoseChangeStateMgr.First;
        MachbirdSDKHelper.LogQuestFailed(this.currentLevel);
        MachbirdSDKHelper.LogQuestFailed(this.currentLevel, QuestType.SUB, this.currentsubLevel.ToString(), GameWorld.Instance.CurrentParefabName, 0, 1);
        GameHelper.LogEvent(Texts.StatisticsEventOnFailed, new string[]
        {
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });

        this.state = GameState.Lost;
        this.losePanel.SetActive(true);
        //hack  买26
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.tanfuhuo, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.tanfuhuo, 1 + "");

        }

        if (this.currentReliveTimes < GameDataManager.ReliveMaxTimesPerSubLevel || GameDataManager.ReliveMaxTimesPerSubLevel < 0)
        {

            this.BtnContinue.SetActive(true);
            this.losePanel.GetComponent<Animation>().Play();

            if (losePanel.activeSelf)
            {
                this.BtnRetry.SetActive(false);

            }
        }
        else
        {
            this.BtnContinue.SetActive(false);           
            if (losePanel.activeSelf)
            {
                this.BtnRetry.SetActive(true);
                
            }
        }

        this.loseTimerText.gameObject.SetActive(false);
        this.hudPanel.SetActive(false);
        this.SetPlayerData();
        this.currentReliveTimes++;
        Debug.Log("currentReliveTimes====" + currentReliveTimes);

        //hack 关14
        if (Analytics.Instance != null)

        {
            //Debug.Log(" 小关 失败 关14====================" + currentLevel + "_" + currentsubLevel);
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.xiaoguanshibai_renshu, currentLevel + "_" + currentsubLevel);
            Analytics.Instance.SendMessageByID(AllDataInGameTest.xiaoguanshibai_renshu, currentLevel + "_" + currentsubLevel);
            //hack 关18
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.xiaoguanshibai_yusheshu, currentLevel + "_" + currentsubLevel + "_" + gameWord.currentPrefab.name);
            Analytics.Instance.SendMessageByID(AllDataInGameTest.xiaoguanshibai_yusheshu, currentLevel + "_" + currentsubLevel + "_" + gameWord.currentPrefab.name);
        }
        //hack 关16
        if (Analytics.Instance != null && currentsubLevel== 4)
        {
            Debug.Log(" boss 失败 关16====================" + currentLevel + "_" + currentsubLevel);
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.bossguanshibai_renshu, currentLevel + "_" + currentsubLevel + "_" + gameWord.currentPrefab.name);
            Analytics.Instance.SendMessageByID(AllDataInGameTest.bossguanshibai_renshu, currentLevel + "_" + currentsubLevel+"_"+gameWord.currentPrefab.name);

        }

    }

    public LoseChangeStateMgr e_loseState = LoseChangeStateMgr.Normal;

    
    bool bLose = false;//成功后 跳到下关 再切出倒计时
    float loseTime = 0f;
    private void Update()
    {
        //广告集成测试  
        //IronSource.Agent.validateIntegration();

        this.currentWaiting += Time.deltaTime;
        GameState gameState = this.state;
        if (gameState != GameState.Win)
        {
            if (gameState != GameState.Dying)
            {
                if (gameState != GameState.Lost)
                {
                }
            }
            else if (this.currentWaiting >= this.countdownWait)
            {
                this.timerPanel.SetActive(true);
                this.loseTimerHolder -= Time.deltaTime;
                this.loseTimerText.gameObject.SetActive(true);
                this.loseTimerText.text = Mathf.RoundToInt(this.loseTimerHolder).ToString();
                if (this.loseTimerHolder <= 0f || (GameWorld.Instance.HaveObjects() && !GameWorld.Instance.HaveMoveingObjects()))
                {
                    this.ToLost();
                }
            }
        }
        else
        {
            if (this.currentWaiting >= this.winGradeWait)
            {
                this.GradeParent.SetActive(false);
                //bGrade = false;
            }
            if (this.currentWaiting >= this.winWait)
            {
                this.Initialize();
                GameWorld.Instance.Play(this.currentLevel, this.currentsubLevel, this.extraBallsToAdd);
            }
        }
        if (this.isFireDown)
        {
            EventDispatcher.TriggerEvent(Texts.EventOnFireDownStay);
        }

    }
    public bool bGrade = false;

    public void ToWin(int extraBalls, int maxBalls)
    {
       // Initialize();
        //AllDataInGameTest.shengyuzidan.Add(nLevelCount, extraBalls); // hack  关9
        //TODO  -------------埋点：子弹剩余数 + 子弹最大数
        string currentParefabName = GameWorld.Instance.CurrentParefabName;
        int num;
        if (this.PrefabBreakTimesDic.TryGetValue(currentParefabName, out num))
        {
            this.PrefabBreakTimesDic[currentParefabName] = num + 1;
        }
        else
        {
            this.PrefabBreakTimesDic[currentParefabName] = 1;
        }
        if (this.TrialCannonSubLevel > 0)
        {

            this.TrialCannonSubLevel--;
            //修改试用炮次数
            // this.TrialCannonSubLevel = 0;
            this.TextTrialCannonRemain.text = this.TrialCannonSubLevel.ToString();
            if (this.TrialCannonSubLevel <= 0)
            {
                GameWorld.Instance.PlayerCtrl.LoadAvatar(this.CurrentAvatarId);
                // //print("测试6");
                this.TextTrialCannonRemain.gameObject.SetActive(false);
                this.BtnTrialCannon.SetActive(true);
                if (this.firstTrialCannon)
                {
                    this.firstTrialCannon = false;
                    this.TrialCannonPanel.SetActive(true);
                }
            }
        }
        if (this.state == GameState.Dying)
        {
            this.loseTimerText.gameObject.SetActive(false);
            this.loseTimerHolder = this.loseTimer;
            this.timerPanel.SetActive(false);
        }
        this.extraBallsToAdd = extraBalls;
        Debug.Log(string.Concat(new object[]
        {
            "ToWin:",
            this.currentLevel,
            ":",
            this.currentsubLevel,

            " => ",
            this.state
        }));
        
        
        this.currentWaiting = 0f;
        if (this.currentReliveTimes > 0)
        {
            this.currentSubLevelGrade = SubLevelGrade.Good;
        }
        else
        {
            int num2 = maxBalls - extraBalls;
            if (num2 <= 1)
            {
                this.currentSubLevelGrade = SubLevelGrade.Strike;
            }
            else if (num2 == 2)
            {
                this.currentSubLevelGrade = SubLevelGrade.Spare;
            }
            else if (extraBalls == 0)
            {
                this.currentSubLevelGrade = SubLevelGrade.Lucky;
            }
            else if (extraBalls > 0 && extraBalls <= 3)
            {
                this.currentSubLevelGrade = SubLevelGrade.Safe;
            }
            else
            {
                this.currentSubLevelGrade = SubLevelGrade.Good;
            }
        }
        ////print("测试3 +Towin");
        this.ImgGrade.overrideSprite = this.gradeSprites[Convert.ToInt32(this.currentSubLevelGrade)];
        this.ASGrade.clip = this.gradeAudioClips[Convert.ToInt32(this.currentSubLevelGrade)];
        this.AddScore(GameDataManager.SubLevelGradeScores[Convert.ToInt32(this.currentSubLevelGrade)]);

        //if (!bGrade)
        //{
        //     this.GradeParent.SetActive(true);
        //     bGrade = true;
        //}
             this.GradeParent.SetActive(true);


        if (this.currentLevel != 0 )
        {
            //Umeng关卡成功
            //GA.FinishLevel(currentLevel + "-" + currentsubLevel);

        }

        this.subLevelsImages[this.currentsubLevel].overrideSprite = this.hudTitleSubLevelImg0;
        MachbirdSDKHelper.LogQuestCompleted(this.currentLevel, QuestType.SUB, this.currentsubLevel.ToString(), GameWorld.Instance.CurrentParefabName, 0, 1);
        ////print("测试2+towin");
        if (this.currentsubLevel >= GameWorld.Instance.subLevelCount)
        {
            this.state = GameState.LevelUp;
            MachbirdSDKHelper.LogQuestCompleted(this.currentLevel);
            this.LevelUp();
            this.UpdateNewUnlockInfo();
            base.StartCoroutine(this.PlayWin());
        }
        else
        {
            this.state = GameState.Win;
            this.currentsubLevel++;
        }
        if (this.CurrentSuperFirePoint < (float)GameDataManager.MaxSuperFirePoint)
        {
            this.CurrentSuperFirePoint += 1f;
            if (this.CurrentSuperFirePoint >= (float)GameDataManager.MaxSuperFirePoint)
            {
                this.ImgResetSuperFireVideo.SetActive(false);
            }
        }
        this.ImgSuperFireProgress.fillAmount = 1f - this.CurrentSuperFirePoint / (float)GameDataManager.MaxSuperFirePoint;
        //hack bug尝试

        
    }

        private IEnumerator PlayWin()
    {
        yield return new WaitForSeconds(1f);
        this.GradeParent.SetActive(false);
        //bGrade = false;
        this.TreasureParent.gameObject.SetActive(true);
        yield return new WaitForSeconds(2f);
        this.TextDiamondAdditional.text = GameDataManager.DiamondPerBigLevel.ToString();
        this.DiamondAnimation.Play(Texts.AnimationDiamondUp);
        yield return new WaitForSeconds(0.4f);
        this.AddDiamond(GameDataManager.DiamondPerBigLevel);
        yield return new WaitForSeconds(0.5f);
        if (this.currentLevel >= GameDataManager.LevelVideoStart)
        {
            GameDataManager.LevelSucceedTimes++;
        }
        yield return null;
        print("显示winpanle");
        this.ShowWinPanel();
        yield break;
    }

        private void ShowWinPanel()
    {
        this.winPanel.SetActive(true);
        //Hack 修改WinPanel 的 返回按钮不 增加关卡等级的bug
        GameHelper.LogEvent(Texts.StatisticsEventOnSucceed, new string[]
        {
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        //this.UpdateNewCollectionReward();
    }

        public void ToDying()
    {
        this.BtnSpinWheel.SetActive(false);
        this.BtnTrialCannon.SetActive(false);
        if (GameWorld.Instance.cacheAliveBalls.Count == 0 && GameWorld.Instance.HaveObjects() && !GameWorld.Instance.HaveMoveingObjects())
        {
            this.ToLost();
            return;
        }
        this.state = GameState.Dying;
        this.currentWaiting = 0f;
        this.loseTimerText.gameObject.SetActive(false);
        this.loseTimerHolder = this.loseTimer;
        this.timerPanel.SetActive(false);
    }

    private void PlayInitializeInterstitialAd()
    {
        MachbirdSDKHelper.LogQuestBegin(this.currentLevel);
        if (this.currentLevel == 1 || (this.currentLevel <= 50 && this.currentLevel % 5 == 0))
        {
            MachbirdSDKHelper.LogByBranch("Level" + this.currentLevel);
        }
        if (this.AlreadyRewardVideo)
        {
            this.Initialize();
        }
        else if (GameDataManager.LevelSucceedTimes >= GameDataManager.LevelSucceedVideo)
        {
            GameDataManager.LevelSucceedTimes = 0;
            // GameHelper.PlayInterstitialAd(delegate
            // {
            //     this.Initialize();
            // }, Texts.VideoParameterManySucceedLevel, this.currentLevel.ToString());

            this.Initialize();
            //if (IronSourceEvents.Instance.isInterstitialReady())
            //{
            //    IronSourceEvents.Instance.showInterstitial();

            //    //hack  买8
            //    if (Analytics.Instance != null)
            //    {
            //        IronSourceEvents.interClose(AllDataInGameTest.InterstitialAllCount, AllDataInGameTest.GuanqianInterstiAllCount);

            //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.guanqiachapingbofang_cishu, 1 + "");
            //        Analytics.Instance.SendMessageByID(AllDataInGameTest.guanqiachapingbofang_cishu, 1 + "");

            //        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");
            //        Analytics.Instance.SendMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");


            //    }
            //}
            //else
            //{
            //    IronSource.Agent.loadInterstitial();
            //}

        }
        else if (GameDataManager.LevelFailedTimes >= GameDataManager.LevelFailedVideo)
        {
            GameDataManager.LevelFailedTimes = 0;
            // GameHelper.PlayInterstitialAd(delegate
            // {
            //     this.Initialize();
            // }, Texts.VideoParameterManyFailedLevel, this.currentLevel.ToString());

            this.Initialize();
            //if (IronSourceEvents.Instance.isInterstitialReady())
            //{
            //    IronSourceEvents.Instance.showInterstitial();
            //}
            //else
            //{
            //    IronSource.Agent.loadInterstitial();
            //}
            ////hack  买7
            //if (Analytics.Instance != null)
            //{
            //    IronSourceEvents.interClose(AllDataInGameTest.InterstitialAllCount, AllDataInGameTest.GuanqianInterstiAllCount);

            //    Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.guanqiachapingbofang_cishu, 1 + "");
            //    Analytics.Instance.SendMessageByID(AllDataInGameTest.guanqiachapingbofang_cishu, 1 + "");

            //    Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");
            //    Analytics.Instance.SendMessageByID(AllDataInGameTest.zongchaping_cishu, 1 + "");

            //}
        }
        else
        {
            this.Initialize();
        }
        this.AlreadyRewardVideo = false;
    }

        public void Initialize()
    {
        loseTimerText.gameObject.SetActive(false);
        timerPanel.SetActive(false);

        loseTimerHolder = 5f;
        loseTime = 0f;
        losePanel.SetActive(false);
        loseTimerHolder = 5;
        state = GameState.Playing;
        if (this.currentLevel != 0 && gameWord.currentPrefab != null)
        {
            Analytics.Instance.SendFirstMessageByID(currentLevel + "-" + currentsubLevel, gameWord.currentPrefab.name);
            Analytics.Instance.SendMessageByID(currentLevel + "-" + currentsubLevel, gameWord.currentPrefab.name);
            //GA.StartLevel(currentLevel + "-" + currentsubLevel);
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.xiaoguanyusheming, currentLevel + "-" + currentsubLevel+"-"+ gameWord.currentPrefab.name);
            Analytics.Instance.SendMessageByID(AllDataInGameTest.xiaoguanyusheming,currentLevel + "-" + currentsubLevel+"-"+gameWord.currentPrefab.name);
        }
        //hack 关 13
        if (this.currentLevel != 0)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.xiaoguanjinru_renshu, currentLevel + "_" + currentsubLevel);
            Analytics.Instance.SendMessageByID(AllDataInGameTest.xiaoguanjinru_renshu, currentLevel + "_" + currentsubLevel);
        }
        //hack 关15
        if (Analytics.Instance != null && currentsubLevel != 0 && currentsubLevel % 4 == 0)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.bossguanjinru_renshu, 1+"");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.bossguanjinru_renshu, 1+"");

        }
        Debug.Log("====Initialize  ============= ");
        if (Time.time - GameLauncher.Instance.GameStartTime >= GameDataManager.ShowRateTime)
        {
            //HACK Rate界面修改
            //this.CheckRateShown();
        }
        MachbirdSDKHelper.LogQuestBegin(this.currentLevel, QuestType.SUB, this.currentsubLevel.ToString(), GameWorld.Instance.CurrentParefabName, 0, 1);
        GameHelper.LogEvent(Texts.StatisticsEventOnMainMenuShow, new string[0]);
        print("init + logevent");
        this.levelFrom.text = this.currentLevel.ToString();
        this.levelTo.text = (this.currentLevel + 1).ToString();
        this.levelNoText.text = Texts.String_LEVEL + "  " + this.currentLevel;
        this.levelNoLoseText.text = Texts.String_LEVEL + " " + this.currentLevel;
        if (string.IsNullOrEmpty(this.AdditionalSuperFireId))
        {
            this.SuperFireAnimation.Play((!this.IsSuperFireState) ? Texts.AnimationSuperFireInverse : Texts.AnimationSuperFireSelecting);
            this.ImgSuperFireSelecting.gameObject.SetActive(this.IsSuperFireState);
            EventDispatcher.TriggerEvent<bool>(Texts.EventSuperFireReady, this.IsSuperFireState);
            this.EffectSuperFire.SetActive(this.IsSuperFireState);
        }
        this.ImgSuperFireProgress.fillAmount = 1f - this.CurrentSuperFirePoint / (float)GameDataManager.MaxSuperFirePoint;
        this.isFireDown = false;
        if (this.currentsubLevel >= GameWorld.Instance.subLevelCount)
        {
            this.ImgLevelTo.overrideSprite = this.hudTitleLevelTo0;
            this.levelTo.color = this.HudTitleFromToTextColors[0];
            this.NextLevelEffect.SetActive(true);
            if (!this.TrialCannonShown)
            {
                this.TrialCannonGuidePanel.SetActive(true);
                this.firstTrialCannon = true;
            }
            this.TrialCannonBtnAnimation.Play();
        }
        else
        {
            this.TrialCannonBtnAnimation.Stop();
            this.ImgLevelTo.overrideSprite = this.hudTitleLevelTo1;
            this.levelTo.color = this.HudTitleFromToTextColors[1];
            this.NextLevelEffect.SetActive(false);
        }
        this.ImgLevelFrom.overrideSprite = this.hudTitleLevelFrom0;
        this.levelFrom.color = this.HudTitleFromToTextColors[0];
        this.ImgBossLevel.SetActive(false);
        this.BtnSpinWheel.SetActive(true);
        this.scoreText.text = this.score.ToString();
        if (this.currentsubLevel == GameWorld.Instance.subLevelCount)
        {
            this.ImgBossLevel.SetActive(true);
            CameraShaker.Instance.ShakeOnce(3f, 5f, 0.5f, 0.8f);
        }
        this.subLevelsImages[this.currentsubLevel].overrideSprite = this.hudTitleSubLevelImg2;
        this.currentReliveTimes = 0;
        Debug.Log("initialize:" + this.state);
        this.state = GameState.Playing;
        this.BtnTrialCannon.SetActive(this.TrialCannonShown && this.TrialCannonSubLevel <= 0);
        if (this.IsRandomScene)
        {
            this.LoadSceneBG();
        }

        this.BGColorChange();
        this.TreasureParent.gameObject.SetActive(false);
        this.LoadingMask.SetActive(false);
        this.UpdateNewUnlockAvatar();
       
    }

        public void CheckRateShown()
    {
        if (!this.IsRateShown)
        {
            RatePanelController.ShowPanel(null, null, null, null);
            this.IsRateShown = true;
            this.SetPlayerData();
        }
    }

        public void AddScore(int add)
    {
        this.score += add;
        if (this.score > this.BestScore)
        {
            this.BestScore = this.score;
        }
        this.scoreText.text = this.score.ToString();
        this.scoreLoseText.text = Texts.String_SCORE + this.score;
        this.bestScoreText.text = Texts.String_bestscore + this.BestScore;
    }

        public void OnClickBtnDoubleDiamond(int rate)
    {
        // EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);
        // GameHelper.LogEvent(Texts.StatisticsEventDoubleDiamond, new string[]
        // {
        //     "Rate",
        //     rate.ToString(),
        //     "level",
        //     GameMenu.Instance.currentLevel.ToString(),
        //     "prefabName",
        //     GameWorld.Instance.CurrentParefabName
        // });
        // GameHelper.PlayRewardVideo(delegate (IronSourcePlacement isp)
        // {
        //     this.AlreadyRewardVideo = true;
        //     EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        //     GameHelper.LogEvent(Texts.StatisticsEventDoubleDiamondSucceed, new string[]
        //     {
        //         "Rate",
        //         rate.ToString(),
        //         "level",
        //         GameMenu.Instance.currentLevel.ToString(),
        //         "prefabName",
        //         GameWorld.Instance.CurrentParefabName
        //     });
        //     this.TreasureParent.gameObject.SetActive(false);
        //     this.StartCoroutine(this.AddDoubleDiamond(rate));
        // }, delegate
        // {
        //     EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        // }, delegate (IronSourceError ise)
        // {
        //     EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        //     EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
        //     {
        //         Content = Texts.String_VideoFailedContent
        //     });
        // }, Texts.VideoParameterDoubleDiamond, this.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
    }

        private IEnumerator AddDoubleDiamond(int rate)
    {
        this.ImgNewUnlock.SetActive(false);
        this.winPanel.SetActive(false);
        this.TreasureParent.gameObject.SetActive(true);
        yield return new WaitForSeconds(2f);
        this.TextDiamondAdditional.text = (GameDataManager.DiamondPerBigLevel * (rate - 1)).ToString();
        this.DiamondAnimation.Play(Texts.AnimationDiamondUp);
        yield return new WaitForSeconds(0.4f);
        this.AddDiamond(GameDataManager.DiamondPerBigLevel * (rate - 1));
        yield return new WaitForSeconds(0.5f);
        this.NextLevel();
        print("Ienumerator  ");
        yield break;
    }

        public void NextLevel()
    {
        this.ImgNewUnlock.SetActive(false);
        this.winPanel.SetActive(false);
        this.UpdateLevelUpSprites();
        this.TreasureParent.gameObject.SetActive(false);
        this.currentsubLevel = 0;
        //print("测试6 nextlevel");
        this.PlayInitializeInterstitialAd();
        print("----- currentLevel:"+currentLevel);
        //ChangeLevel();

        print("测试7  nextlevel" + currentLevel);
        
        GameWorld.Instance.NextLevel(this.currentLevel, this.currentsubLevel, 0);
        //print("测试8  nextlevel");

    }

        private void LevelUp()
    {


        this.UpdateUnlockInfo();
        this.SetPlayerData();
    }

        private void UpdateLevelUpSprites()
    {
        this.ImgLevelFrom.overrideSprite = this.hudTitleLevelFrom1;
        this.levelFrom.color = this.HudTitleFromToTextColors[1];
        this.ImgLevelTo.overrideSprite = this.hudTitleLevelTo1;
        this.levelTo.color = this.HudTitleFromToTextColors[1];
        this.NextLevelEffect.SetActive(false);
        for (int i = 0; i < this.subLevelsImages.Length; i++)
        {
            this.subLevelsImages[i].overrideSprite = this.hudTitleSubLevelImg1;
        }
    }

        public void UpdateUnlockInfo()
    {
        this.CheckAvatarUnlocked();
        this.CheckSceneUnlocked();
        this.CheckSuperFireUnlocked();
        this.CheckCollectionUnlocked();
        bool active = this.ImgShopRedDot.activeSelf || this.ImgSceneRedDot.activeSelf || this.ImgSuperFireRedDot.activeSelf || this.ImgCollectionRedDot.activeSelf;
        this.ImgBackRedDot.SetActive(active);
        this.ImgWinBackRedDot.SetActive(active);
    }

        private void CheckAvatarUnlocked()
    {
        this.ImgShopRedDot.SetActive(false);
        for (int i = 0; i < GameDataManager.AvatarInfoDatas.Count; i++)
        {
            AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[i];
            if (avatarInfo.UnlockType == UnlockType.LevelAndDiamond && !this.RedDotAvatarIds.Contains(avatarInfo.Id) && this.currentLevel >= avatarInfo.UnlockLevel)
            {
                this.ImgShopRedDot.SetActive(true);
            }
        }
    }

        private void CheckSceneUnlocked()
    {
        this.ImgSceneRedDot.SetActive(false);
        for (int i = 0; i < GameDataManager.SceneBGUnlockInfoDatas.Count; i++)
        {
            SceneBGUnlockInfo sceneBGUnlockInfo = GameDataManager.SceneBGUnlockInfoDatas[i];
            if (sceneBGUnlockInfo.UnlockType == UnlockType.LevelAndDiamond && !this.RedDotSceneIds.Contains(sceneBGUnlockInfo.Id) && this.currentLevel >= sceneBGUnlockInfo.UnlockLevel)
            {
                this.ImgSceneRedDot.SetActive(true);
            }
        }
    }

        private void CheckSuperFireUnlocked()
    {
        this.ImgSuperFireRedDot.SetActive(false);
        for (int i = 0; i < GameDataManager.SuperFireInfoDatas.Count; i++)
        {
            SuperFireInfo superFireInfo = GameDataManager.SuperFireInfoDatas[i];
            if (superFireInfo.UnlockType == UnlockType.LevelAndDiamond && !this.RedDotSuperFireIds.Contains(superFireInfo.Id) && this.currentLevel >= superFireInfo.UnlockLevel)
            {
                this.ImgSuperFireRedDot.SetActive(true);
            }
        }
    }

        private void CheckCollectionUnlocked()
    {
        this.ImgCollectionRedDot.SetActive(false);
        for (int i = 0; i < GameDataManager.CollectionInfoDatas.Count; i++)
        {
            CollectionInfo collectionInfo = GameDataManager.CollectionInfoDatas[i];
            for (int j = 0; j < collectionInfo.Levels.Length; j++)
            {
                string text = collectionInfo.Levels[j];
                bool flag = false;
                int num;
                if (GameMenu.Instance.PrefabBreakTimesDic.TryGetValue(text + Texts.String_PrefabSuffix, out num) && num > 0)
                {
                    flag = true;
                }
                if (!this.RedDotCollectionIds.Contains(text) && flag)
                {
                    this.ImgCollectionRedDot.SetActive(true);
                }
            }
        }
    }

        private void UpdateNewCollectionReward()
    {
        for (int i = 0; i < GameDataManager.CollectionInfoDatas.Count; i++)
        {
            CollectionInfo collectionInfo = GameDataManager.CollectionInfoDatas[i];
            int num = 0;
            for (int j = 0; j < collectionInfo.Levels.Length; j++)
            {
                string str = collectionInfo.Levels[j];
                int num2;
                if (GameMenu.Instance.PrefabBreakTimesDic.TryGetValue(str + Texts.String_PrefabSuffix, out num2) && num2 > 0)
                {
                    num++;
                }
            }
            for (int k = 0; k < collectionInfo.Rewards.Length; k++)
            {
                CollectionRewardInfo collectionRewardInfo = collectionInfo.Rewards[k];
                bool flag = false;
                List<int> list;
                if (GameMenu.Instance.CollectionRewardedIndexsDic.TryGetValue(collectionInfo.Id, out list))
                {
                    if (list.Contains(k))
                    {
                        flag = true;
                    }
                }
                else
                {
                    GameMenu.Instance.CollectionRewardedIndexsDic[collectionInfo.Id] = new List<int>();
                }
                if (!flag && num >= collectionRewardInfo.CollectionCount)
                {
                    RewardType type = collectionRewardInfo.Type;
                    if (type != RewardType.Diamond)
                    {
                        if (type == RewardType.Cannon)
                        {
                            GameMenu.Instance.UnlockedAvatarIds.Add(collectionRewardInfo.RewardId);
                        }
                    }
                    else
                    {
                        EventDispatcher.TriggerEvent<Vector3>(Texts.EventSpawnUIDiamonds, base.transform.position);
                        EventDispatcher.TriggerEvent<int>(Texts.EventSpinRewardDiamond, collectionRewardInfo.Count);
                    }
                    EventDispatcher.TriggerEvent<CollectionRewardInfo>(Texts.EventShowCollectionReward, collectionRewardInfo);
                    GameMenu.Instance.CollectionRewardedIndexsDic[collectionInfo.Id].Add(k);
                    this.winPanel.SetActive(false);
                    return;
                }
            }
        }
    }

        private void UpdateNewUnlockAvatar()
    {
        for (int i = 0; i < GameDataManager.AvatarInfoDatas.Count; i++)
        {
            AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[i];
            if (avatarInfo.UnlockType == UnlockType.LevelAndDiamond && !this.UnlockedAvatarIds.Contains(avatarInfo.Id) && !this.NewUnlockAvatarIds.Contains(avatarInfo.Id) && this.Diamond >= avatarInfo.UnlockDiamond)
            {
                EventDispatcher.TriggerEvent<bool, string>(Texts.EventShowNewAvatar, true, avatarInfo.Id);
                this.NewUnlockAvatarIds.Add(avatarInfo.Id);
            }
        }
    }

        private void UpdateNewUnlockInfo()
    {
        for (int i = 0; i < GameDataManager.CollectionInfoDatas.Count; i++)
        {
            CollectionInfo collectionInfo = GameDataManager.CollectionInfoDatas[i];
            for (int j = 0; j < collectionInfo.Levels.Length; j++)
            {
                string text = collectionInfo.Levels[j];
                if (!this.NewUnlockIds.Contains(text) && GameWorld.Instance.CurrentParefabName == text + Texts.String_PrefabSuffix)
                {
                    this.ImgNewUnlock.SetActive(true);
                    this.ImgNewUnlockIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + text);
                    this.NewUnlockIds.Add(text);
                }
            }
        }
        for (int k = 0; k < GameDataManager.SceneBGUnlockInfoDatas.Count; k++)
        {
            SceneBGUnlockInfo sceneBGUnlockInfo = GameDataManager.SceneBGUnlockInfoDatas[k];
            if (sceneBGUnlockInfo.UnlockType == UnlockType.LevelAndDiamond && !this.NewUnlockIds.Contains(sceneBGUnlockInfo.Id) && this.currentLevel >= sceneBGUnlockInfo.UnlockLevel)
            {
                this.ImgNewUnlock.SetActive(true);
                this.ImgNewUnlockIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + sceneBGUnlockInfo.Id);
                this.NewUnlockIds.Add(sceneBGUnlockInfo.Id);
            }
        }
        for (int l = 0; l < GameDataManager.AvatarInfoDatas.Count; l++)
        {
            AvatarInfo avatarInfo = GameDataManager.AvatarInfoDatas[l];
            if (avatarInfo.UnlockType == UnlockType.LevelAndDiamond)
            {
                if (this.UnlockedAvatarIds.Contains(avatarInfo.Id))
                {
                    this.NewUnlockIds.Add(avatarInfo.Id);
                }
                else if (!this.NewUnlockIds.Contains(avatarInfo.Id) && this.currentLevel >= avatarInfo.UnlockLevel)
                {
                    this.ImgNewUnlock.SetActive(true);
                    this.ImgNewUnlockIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + avatarInfo.Id);
                    this.NewUnlockIds.Add(avatarInfo.Id);
                }
            }
        }
        for (int m = 0; m < GameDataManager.SuperFireInfoDatas.Count; m++)
        {
            SuperFireInfo superFireInfo = GameDataManager.SuperFireInfoDatas[m];
            if (superFireInfo.UnlockType == UnlockType.LevelAndDiamond && !this.NewUnlockIds.Contains(superFireInfo.Id) && this.currentLevel >= superFireInfo.UnlockLevel)
            {
                this.ImgNewUnlock.SetActive(true);
                this.ImgNewUnlockIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + superFireInfo.Id);
                this.NewUnlockIds.Add(superFireInfo.Id);
            }
        }
    }

        public void Play()
    {
        
        this.backPanel.SetActive(false);
        this.hudPanel.SetActive(true);
        this.BtnSpinWheel.SetActive(true);
        this.GradeParent.SetActive(false); //bGrade = false;
        this.menuPanel.SetActive(false);
        MachbirdSDKHelper.StopPlayVideo();
        this.ImgNewUnlock.SetActive(false);
        this.winPanel.SetActive(false);
        this.losePanel.SetActive(false);
        this.BtnTrialCannon.SetActive(this.TrialCannonShown && this.TrialCannonSubLevel <= 0);
        this.TextTrialCannonRemain.gameObject.SetActive(this.TrialCannonSubLevel > 0);
        //HACK  真机 Play 按钮相关的屏蔽
        this.PlayInitializeInterstitialAd();

        GameWorld.Instance.Play(this.currentLevel, this.currentsubLevel, this.extraBallsToAdd);


        //hack  场景修改
        Initialize();
    }

        public void OnClickContinue()
    {

        this.BtnSpinWheel.SetActive(true);

        this.BtnTrialCannon.SetActive(this.TrialCannonShown && this.TrialCannonSubLevel <= 0);
        GameHelper.LogEvent(Texts.StatisticsEventContinueGame, new string[]
        {
            "level",
            this.currentLevel.ToString(),
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);

        //hack  买30
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dianfuhuo, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.dianfuhuo, 1 + "");

        }
        //Lose  continue 按钮
        //GameHelper.PlayRewardVideo(new Action<IronSourcePlacement>(this.OnVideoReward), new Action(this.OnVideoEnd), new Action<IronSourceError>(this.OnVideoFailed), Texts.VideoParameterContinueGame, this.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
        GameHelper.PlayRewardVideo(OnVideoReward,OnVideoEnd,OnVideoFailed,Texts.VideoParameterContinueGame, this.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);

    }

        private void OnVideoReward()
    {

        //hack  买31
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.fuhuook, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.fuhuook, 1 + "");

        }
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        GameHelper.LogEvent(Texts.StatisticsEventContinueGameSucceed, new string[]
        {
            "level",
            this.currentLevel.ToString(),
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        if (this.currentsubLevel == GameWorld.Instance.subLevelCount)
        {
            this.AlreadyRewardVideo = true;
        }
        this.CurrentSuperFirePoint = (float)GameDataManager.MaxSuperFirePoint;
        this.ImgSuperFireProgress.fillAmount = 1f - this.CurrentSuperFirePoint / (float)GameDataManager.MaxSuperFirePoint;
        this.ImgResetSuperFireVideo.SetActive(false);
        this.timerPanel.SetActive(false);
        this.losePanel.SetActive(false);
        this.hudPanel.SetActive(true);
        base.StartCoroutine(this.ContinueGameAnimation());
    }

        private IEnumerator ContinueGameAnimation()
    {
        base.StartCoroutine(GameWorld.Instance.ContinueGame());
        yield return new WaitForSeconds(1.2f);
        this.state = GameState.Playing;
        yield break;
    }

        private void OnVideoEnd()
    {
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

        public void Retry()
    {
        GameDataManager.IsFromLost = true;
        
        this.BackToMain();
    }

        public void BackToMain()
    {

        this.SetPlayerData();
        if (this.currentLevel >= GameDataManager.LevelVideoStart)
        {
            GameDataManager.LevelFailedTimes++;
        }
        this.CurrentSuperFirePoint = 0f;
        this.ImgResetSuperFireVideo.SetActive(true);
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);

        //HACK  关11
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.quit_cishu, 1 + "");
        Analytics.Instance.SendMessageByID(AllDataInGameTest.quit_cishu, 1 + "");
    }

        private void BGColorChange()
    {
        GameWorld.Instance.BGColorChange();
    }

        public void AddDiamond(int diamond)
    {
        this.Diamond += diamond;
        this.TextDiamond.text = this.Diamond.ToString();
    }

    

    /// <summary>
    /// 
    /// </summary>
    

    public void OnClickSuperFire()
    {
        //hack  买1
        if (Analytics.Instance != null  && imgFillSupFire.fillAmount == 0)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.shipinjineng_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.shipinjineng_renci, 1 + "");

        }

        if (string.IsNullOrEmpty(this.AdditionalSuperFireId) && !GameWorld.Instance.PlayerCtrl.IsOnContinuousFire)
        {
            if (this.CurrentSuperFirePoint >= (float)GameDataManager.MaxSuperFirePoint)
            {
                this.IsSuperFireState = !this.IsSuperFireState;
                this.ImgSuperFireSelecting.gameObject.SetActive(this.IsSuperFireState);
                EventDispatcher.TriggerEvent<bool>(Texts.EventSuperFireReady, this.IsSuperFireState);
                this.SuperFireAnimation.Play((!this.IsSuperFireState) ? Texts.AnimationSuperFireInverse : Texts.AnimationSuperFireSelecting);
                this.EffectSuperFire.SetActive(this.IsSuperFireState);
            }
            else
            {
                GameHelper.LogEvent(Texts.StatisticsEventResetSuperFire, new string[]
                {
                    "level",
                    GameMenu.Instance.currentLevel.ToString(),
                    "prefabName",
                    GameWorld.Instance.CurrentParefabName
                });
                EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);
                //左侧技能按钮
                GameHelper.PlayRewardVideo(this.OnSuperFireVideoReward, this.OnSuperFireVideoEnd,this.OnSuperFireVideoFailed, Texts.VideoParameterResetSuperFire, this.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);


                //hack  买2
                if (Analytics.Instance != null)
                {
                    Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengshipinbofang_cishu, 1 + "");
                    Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengshipinbofang_cishu, 1 + "");

                }
            }
        }
       

    }

        private void OnSuperFireVideoReward()
    {
        //IronSourceEvents.onRewardedVideoAdRewardedEvent -= this.OnSuperFireVideoReward;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        GameHelper.LogEvent(Texts.StatisticsEventResetSuperFireSucceed, new string[]
        {
            "level",
            GameMenu.Instance.currentLevel.ToString(),
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        if (this.currentsubLevel == GameWorld.Instance.subLevelCount)
        {
            this.AlreadyRewardVideo = true;
        }
        this.CurrentSuperFirePoint = (float)GameDataManager.MaxSuperFirePoint;
        this.ImgResetSuperFireVideo.SetActive(false);
        this.ImgSuperFireProgress.fillAmount = 1f - this.CurrentSuperFirePoint / (float)GameDataManager.MaxSuperFirePoint;
        this.IsSuperFireState = !this.IsSuperFireState;
        this.ImgSuperFireSelecting.gameObject.SetActive(this.IsSuperFireState);
        EventDispatcher.TriggerEvent<bool>(Texts.EventSuperFireReady, this.IsSuperFireState);
        this.SuperFireAnimation.Play((!this.IsSuperFireState) ? Texts.AnimationSuperFireInverse : Texts.AnimationSuperFireSelecting);
        this.EffectSuperFire.SetActive(this.IsSuperFireState);

        //hack  买3
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengshipinwancheng_cishu, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengshipinwancheng_cishu, 1 + "");

        }
    }

        private void OnSuperFireVideoEnd()
    {
        //IronSourceEvents.onRewardedVideoAdEndedEvent -= this.OnSuperFireVideoEnd;
        //IronSourceEvents.onRewardedVideoAdClosedEvent -= this.OnSuperFireVideoEnd;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
    }

        private void OnSuperFireVideoFailed()
    {
        //IronSourceEvents.onRewardedVideoAdShowFailedEvent -= this.OnSuperFireVideoFailed;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
        {
            Content = Texts.String_VideoFailedContent
        });
    }

        public void OnSuperFireOver()
    {
        this.IsSuperFireState = false;
        this.ImgSuperFireSelecting.gameObject.SetActive(false);
        EventDispatcher.TriggerEvent<bool>(Texts.EventSuperFireReady, false);
        if (string.IsNullOrEmpty(this.AdditionalSuperFireId))
        {
            this.CurrentSuperFirePoint = 0f;
        }
        this.ImgResetSuperFireVideo.SetActive(this.CurrentSuperFirePoint == 0f);
        this.ImgSuperFireProgress.fillAmount = 1f - this.CurrentSuperFirePoint / (float)GameDataManager.MaxSuperFirePoint;
        this.SuperFireAnimation.Play((!this.IsSuperFireState) ? Texts.AnimationSuperFireInverse : Texts.AnimationSuperFireSelecting);
        this.EffectSuperFire.SetActive(this.IsSuperFireState);
        this.AdditionalSuperFireId = null;
        this.ImgSuperFireDisable.SetActive(false);
    }

        private void OnApplicationFocus(bool enterGame)
    {
        if (!enterGame)
        {
            this.SetPlayerData();
            GameHelper.LogEvent(Texts.StatisticsEventQuitGameState, new string[]
            {
                "state",
                this.state.ToString()
            });
            GameHelper.LogEvent(Texts.StatisticsEventQuitGameLevel, new string[]
            {
                "level",
                this.currentLevel + "," + this.currentsubLevel
            });
            GameHelper.LogEvent(Texts.StatisticsEventQuitGamePrefab, new string[]
            {
                "prefabName",
                GameWorld.Instance.CurrentParefabName
            });
        }
    }

        public void SetPlayerData()
    {
        PlayerPrefs.SetInt(Texts.CurrentLevel, this.currentLevel);
        PlayerPrefs.SetInt(Texts.DiamondCount, this.Diamond);
        PlayerPrefs.SetInt(Texts.BestScore, this.BestScore);
        PlayerPrefs.SetString(Texts.CurrentAvatarId, this.CurrentAvatarId);
        PlayerPrefs.SetInt(Texts.IsRandomScene, Convert.ToInt32(this.IsRandomScene));
        PlayerPrefs.SetString(Texts.CurrentSceneName, this.CurrentSceneName);
        PlayerPrefs.SetString(Texts.CurrentSuperFireId, this.CurrentSuperFireId);
        PlayerPrefs.SetInt(Texts.IsEnableVoice, Convert.ToInt32(this.EnableVoice));
        PlayerPrefs.SetInt(Texts.IsEnableShake, Convert.ToInt32(this.EnableShake));
        PlayerPrefs.SetInt(Texts.TrialCannonShown, Convert.ToInt32(this.TrialCannonShown));
        PlayerPrefsX.SetObject(Texts.PrefabBreakTimes, this.PrefabBreakTimesDic);
        PlayerPrefsX.SetObject(Texts.CollectionRewardedTimes, this.CollectionRewardedIndexsDic);
        PlayerPrefsX.SetStringArray(Texts.RedDotCollectionIds, this.RedDotCollectionIds.ToArray());
        PlayerPrefs.SetInt(Texts.IsRateShown, Convert.ToInt32(this.IsRateShown));
        PlayerPrefs.SetInt(Texts.IsGDPRAgreed, Convert.ToInt32(this.IsGDPRAgreed));
        if (!GameDataManager.SuperGame)
        {
            PlayerPrefsX.SetStringArray(Texts.UnlockedAvatarIds, this.UnlockedAvatarIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.UnlockedSceneIds, this.UnlockedSceneIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.UnlockedSuperFireIds, this.UnlockedSuperFireIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.RedDotAvatarIds, this.RedDotAvatarIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.RedDotSceneIds, this.RedDotSceneIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.RedDotSuperFireIds, this.RedDotSuperFireIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.NewUnlockIds, this.NewUnlockIds.ToArray());
            PlayerPrefsX.SetStringArray(Texts.NewUnlockAvatarIds, this.NewUnlockAvatarIds.ToArray());
        }
    }

        public void OnClickBtnShop()
    {
        //hack  买15
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaoshangdian_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaoshangdian_renci, 1 + "");

        }
        this.shopPanel.SetActive(true);
        GameHelper.LogEvent(Texts.StatisticsEventOnCannonMenuShow, new string[0]);
    }

        public void OnClickBtnScene()
    {
        //hack  买19
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.beijingshangdian_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.beijingshangdian_renci, 1 + "");

        }
        this.scenePanel.SetActive(true);
        this.menuPanel.SetActive(false);
        MachbirdSDKHelper.StopPlayVideo();
        GameHelper.LogEvent(Texts.StatisticsEventOnSceneMenuShow, new string[0]);
    }

        public void OnClickBtnSuperFire()
    {
        //hack  买22
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jinengshangdian_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.jinengshangdian_renci, 1 + "");

        }

        this.superFirePanel.SetActive(true);
        this.menuPanel.SetActive(false);
        MachbirdSDKHelper.StopPlayVideo();
        GameHelper.LogEvent(Texts.StatisticsEventOnSuperFireMenuShow, new string[0]);
    }

        public void OnClickBack()
    {
        if (winPanel.activeSelf)
        {
            currentLevel += 1;
            this.BackToMain();

            //HACK  关12
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.jsfanhuizhujiemian, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.jsfanhuizhujiemian, 1 + "");
        }
        else if (this.state == GameState.LevelUp)
        {
            this.BackToMain();
            //HACK  关10
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.fanhuizhujiemian, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.fanhuizhujiemian, 1 + "");

        }
        else
        {
            this.backPanel.SetActive(true);
        }
    }

        public void CloseBackPanel()
    {
        this.backPanel.SetActive(false);
    }

        public void OnClickBtnSetting()
    {
        //HACK  真机 设置按钮屏蔽
        GameHelper.LogEvent(Texts.StatisticsEventOnSettingMenuShow, new string[0]);
        this.SettingPanel.SetActive(true);
        AllDataInGameTest.nshezhi_renshu++;//hack 关3
    }

        public void OnClickBtnSpinWheel()
    {
        
        GameHelper.LogEvent(Texts.StatisticsEventSpinPanelShow, new string[]
        {
            "level",
            GameMenu.Instance.currentLevel.ToString(),
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        this.SpinWheelPanel.SetActive(true);
        this.SpinWheelPanel.GetComponent<SpinWheel>().Init(GameDataManager.DiamondPerBigLevel, delegate
        {
            this.NextLevel();
        }, SpinOrigin.LevelWin);
            print("onclickbtnspinwheel");
        this.winPanel.SetActive(false);

        //HACK   买9
        if (Analytics.Instance != null)
        {

            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zuanshifanbei_renci, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.zuanshifanbei_renci, 1 + "");
        }
    }

        private void OnSpinRewardDiamond(int count)
    {
        base.StartCoroutine(this.AddRewardDiamond(count));
    }

        private IEnumerator AddRewardDiamond(int count)
    {
        yield return new WaitForSeconds(1.4f);
        this.TextDiamondAdditional.text = count.ToString();
        this.DiamondAnimation.Play(Texts.AnimationDiamondScale);
        yield return new WaitForSeconds(0.4f);
        this.AddDiamond(count);
        yield break;
    }

        private void OnSpinRewardSuperFire(string id)
    {
        this.AdditionalSuperFireId = id;
        this.IsSuperFireState = true;
        EventDispatcher.TriggerEvent<bool>(Texts.EventSuperFireReady, true);
        this.ImgSuperFireDisable.SetActive(true);
        this.EffectSuperFire.SetActive(false);
        this.SuperFireAnimation.Play(Texts.AnimationSuperFireInverse);
        this.ImgSuperFireSelecting.gameObject.SetActive(false);
    }

        private void OnSpinRewardCannon(string id, int subLevel)
    {
        this.TrialCannonSubLevel = subLevel;
        this.BtnTrialCannon.SetActive(false);
        this.TextTrialCannonRemain.text = subLevel.ToString();
        this.TextTrialCannonRemain.gameObject.SetActive(true);
        GameWorld.Instance.PlayerCtrl.LoadAvatar(id);
        //print("测试6");
    }

        public void OnClickBtnTrialCannon()
    {
       

        if (!this.TrialCannonShown)
        {
            this.TrialCannonShown = true;
            this.TrialCannonGuidePanel.SetActive(false);


            GameHelper.LogEvent(Texts.StatisticsEventTrialCannonGuide, new string[0]);
            EventDispatcher.TriggerEvent<string, int>(Texts.EventSpinRewardCannon, GameDataManager.TrialCannonId, GameDataManager.TrialCannonSubLevels);
        }
        else
        {

               GameHelper.LogEvent(Texts.StatisticsEventTrialCannonVideo, new string[]
               {
                     "level",
                     GameMenu.Instance.currentLevel.ToString(),
                     "prefabName",
                     GameWorld.Instance.CurrentParefabName
               });

            //LostPanel 的continue 按钮
#if UNITY_EDITOR
            OnTrialCannonVideoReward();
#else

            GameHelper.PlayRewardVideo(OnTrialCannonVideoReward, OnTrialCannonVideoEnd, OnTrialCannonVideoFailed, Texts.VideoParameterTrialCannon, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
#endif

            //hack  买5
            if (Analytics.Instance != null)
            {
                Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaoshipinbofang_cishu, 1 + "");
                Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaoshipinbofang_cishu, 1 + "");

            }
            //GameHelper.PlayRewardVideo(new Action<IronSourcePlacement>(this.OnTrialCannonVideoReward), new Action(this.OnTrialCannonVideoEnd), new Action<IronSourceError>(this.OnTrialCannonVideoFailed), Texts.VideoParameterTrialCannon, GameMenu.Instance.currentLevel.ToString(), GameWorld.Instance.CurrentParefabName);
        }
    }

        private void OnTrialCannonVideoReward()
    {
        //IronSourceEvents.onRewardedVideoAdRewardedEvent -= this.OnTrialCannonVideoReward;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        if (this.currentsubLevel == GameWorld.Instance.subLevelCount)
        {
            this.AlreadyRewardVideo = true;
        }
        GameHelper.LogEvent(Texts.StatisticsEventTrialCannonVideoSucceed, new string[]
        {
            "level",
            GameMenu.Instance.currentLevel.ToString(),
            "prefabName",
            GameWorld.Instance.CurrentParefabName
        });
        EventDispatcher.TriggerEvent<string, int>(Texts.EventSpinRewardCannon, GameDataManager.TrialCannonId, GameDataManager.TrialCannonSubLevels);

        //hack  买6
        if (Analytics.Instance != null)
        {
            Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.dapaoshipinwancheng_cishu, 1 + "");
            Analytics.Instance.SendMessageByID(AllDataInGameTest.dapaoshipinwancheng_cishu, 1 + "");

        }
    }

        private void OnTrialCannonVideoEnd()
    {
        //IronSourceEvents.onRewardedVideoAdEndedEvent -= this.OnTrialCannonVideoEnd;
        //IronSourceEvents.onRewardedVideoAdClosedEvent -= this.OnTrialCannonVideoEnd;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
    }

        private void OnTrialCannonVideoFailed()
    {
        //IronSourceEvents.onRewardedVideoAdShowFailedEvent -= this.OnTrialCannonVideoFailed;
        EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
        EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
        {
            Content = Texts.String_VideoFailedContent
        });
    }

        public void OnClickBtnCollection()
    {
        this.CollectionPanel.SetActive(true);
        this.menuPanel.SetActive(false);
        MachbirdSDKHelper.StopPlayVideo();
        GameHelper.LogEvent(Texts.StatisticsEventOnCollectionMenuShow, new string[0]);
    }

        private void ShowLoading(bool show)
    {
        //HACK 控制LoadingMask  隐藏
        //this.LoadingMask.SetActive(show);
    }

        private void OnDestroy()
    {
        EventDispatcher.RemoveEventListener<bool>(Texts.EventShowLoading, new Action<bool>(this.ShowLoading));
        EventDispatcher.RemoveEventListener<int>(Texts.EventSpinRewardDiamond, new Action<int>(this.OnSpinRewardDiamond));
        EventDispatcher.RemoveEventListener<string>(Texts.EventSpinRewardSuperFire, new Action<string>(this.OnSpinRewardSuperFire));
        EventDispatcher.RemoveEventListener<string, int>(Texts.EventSpinRewardCannon, new Action<string, int>(this.OnSpinRewardCannon));
    }

        public AudioListener AudioListener;

        public Text levelTo;

        public Text levelFrom;

        public Text scoreText;

        public Text bestScoreText;

        public Text levelNoText;

        public Text loseTimerText;

        public Text scoreLoseText;

        public Text levelNoLoseText;

        public Text TextBall;

        public Text TextExtraParent;

        public Text TextExtra;

        public Text TextDiamond;

        public Text TextDiamondAdditional;

        public Text TextSuperFireName;

        public GameObject ImgBossLevel;

        public int score;

        public float loseTimer = 5f;

        public float loseTimerHolder;

        public float winWait;

        public float countdownWait = 2f;

        private float winGradeWait = 1f;

        public float currentWaiting;

        public Image ImgLevelFrom;

        public Image ImgLevelTo;

        public Image[] subLevelsImages;

        public GameObject winPanel;

        public GameObject menuPanel;

        public GameObject hudPanel;

        public GameObject losePanel;

        public GameObject timerPanel;

        public GameObject shopPanel;

        public GameObject scenePanel;

        public GameObject superFirePanel;

        public GameObject backPanel;

        public GameObject ImgShopRedDot;

        public GameObject ImgSceneRedDot;

        public GameObject ImgSuperFireRedDot;

        public GameObject ImgCollectionRedDot;

        public GameObject SettingPanel;

        public GameObject ImgBackRedDot;

        public GameObject ImgWinBackRedDot;

        public GameObject ImgNewUnlock;

        public GameObject LoadingMask;

        public GameObject BtnDouble;

        public GameObject BtnQuintuple;

        public GameObject BtnContinue;

        public GameObject BtnRetry;

        public GameObject ImgResetSuperFireVideo;

        public GameObject SpinWheelPanel;

        public GameObject ImgSuperFireDisable;

        public GameObject EffectSuperFire;

        public GameObject GradeParent;

        public GameObject BtnSpinWheel;

        public GameObject TrialCannonPanel;

        public GameObject BtnTrialCannon;

        public GameObject TrialCannonGuidePanel;

        public GameObject CollectionPanel;

        public GameObject NextLevelEffect;

        public GameObject GDPRPanel;

        public Sprite[] Bgs;

        public Color[] HudTitleFromToTextColors;

        public Transform TreasureParent;

        private int extraBallsToAdd;

        [NonSerialized]
    public GameState state;

        [HideInInspector]
    public GameObject currentScene;

        public Image ImgSuperFireIcon;

        public Image ImgSuperFireProgress;

        public Image ImgSuperFireSelecting;

        public Animation SuperFireAnimation;

        public Animation DiamondAnimation;

        public Animation TrialCannonBtnAnimation;

        public Image ImgNewUnlockIcon;

        public Image ImgGrade;

        public AudioSource ASGrade;

        public Text TextTrialCannonRemain;

        private Sprite hudTitleLevelFrom0;

        private Sprite hudTitleLevelFrom1;

        private Sprite hudTitleLevelTo0;

        private Sprite hudTitleLevelTo1;

        private Sprite hudTitleSubLevelImg0;

        private Sprite hudTitleSubLevelImg1;

        private Sprite hudTitleSubLevelImg2;

        private bool isFireDown;

        [HideInInspector]
    public bool IsSuperFireState;

        public float CurrentSuperFirePoint;

        [HideInInspector]
    public string AdditionalSuperFireId;

        private SuperFireInfo currentSuperFireInfo;

        [HideInInspector]
    public bool AlreadyRewardVideo;

        private int currentReliveTimes;

        [HideInInspector]
    public int TrialCannonSubLevel;

        private SubLevelGrade currentSubLevelGrade;

        private Sprite[] gradeSprites = new Sprite[5];

        private AudioClip[] gradeAudioClips = new AudioClip[5];

        public Dictionary<string, int> PrefabBreakTimesDic;

        public Dictionary<string, List<int>> CollectionRewardedIndexsDic;

        private bool firstTrialCannon;


    //ToDo 自己
    public GameWorld gameWord;
    //TODO 控制大等级显示
    public int nLevelCount = 0;
    //
    public CannonController cannonCtr;

    public bool bLoseState = false;

    public Image m_imgProgress;//左侧按钮的遮罩


    private void OnEnable()
    {
        //gameWord.event_changeBall += ChangeBallCount;
        gameWord.event_ChangeLevel += ChangeLevel;
        gameWord.event_ViewFromLevel += ViewFromLeve;
    }

    public void ChangeBallCount(int n)
    {
        //if (n == 0)
        //{
        //    TextBall.text = "no balls";
        //    return;

        //}
        //TextBall.text = "   x  " +
        //    "" + n;


    }
    
    public void ChangeLevel()
    {
        nLevelCount++;
        if (nLevelCount % 5 == 0)
        {
            this.currentLevel += 1;          
            nLevelCount = 0;

        }

    }
    public void ViewFromLeve(int tmpLevel)
    {
        levelFrom.text = tmpLevel.ToString();
    }
}
