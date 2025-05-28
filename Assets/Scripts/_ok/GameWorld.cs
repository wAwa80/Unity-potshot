using System;
using System.Collections;
using System.Collections.Generic;
using Game.Walker;
//using Umeng;
using UnityEngine;

public class GameWorld : MonoBehaviour
{
    public string CurrentParefabName
    {
        get
        {
            if (this.currentPrefab)
            {
                return this.currentPrefab.name;
            }
            return "0";
        }
        private set
        {
        }
    }

    public CannonController PlayerCtrl { get; set; }

    public static GameWorld Instance { get; private set; }

    private void Awake()
    {

        GameWorld.Instance = this;
    }

    private void Start()
    {
        this.PlayerCtrl = GameObject.FindGameObjectWithTag("Player").GetComponent<CannonController>();
        //隐藏横幅
        //PolyAndroidCall.ShowBanner ();
    }

    private void Update()
    {
        if (this.PlayerCtrl.start)
        {
            //TODO 大转盘 注释
            //Debug.Log("GameMenu 的Instance   ");
            GameState state = GameMenu.Instance.state;
            if (state != GameState.Playing)
            {
                if (state == GameState.Dying)
                {
                    this.CheckWin();
                }
            }

            else if (!this.CheckWin())
            {

                this.CheckLose();


            }
        }

        //TODO   GameWord中的委托 update中更新剩余的子弹数量,自己实现的（已经用了原版）-------------------------------------------------------------------------------------------------------------------------
        //if (event_changeBall != null)
        //{
        //    event_changeBall(this.PlayerCtrl.noOfBalls);
        //}

    }

    private bool CheckWin()
    {
        //hack 宝箱开启后

        this.currentObstaclesNo = this.currentObstacles.Count;

        if (this.currentObstaclesNo == 0)
        {
            GameMenu.Instance.ToWin(this.PlayerCtrl.noOfBalls, this.PlayerCtrl.MaxNoOfBalls);

        }


        return this.currentObstaclesNo == 0;
    }

    private void CheckLose()
    {
        if (this.PlayerCtrl.noOfBalls <= 0)
        {
            GameMenu.Instance.ToDying();
        }
    }

    public IEnumerator ContinueGame()
    {
        this.PlayerCtrl.BallTextAnimation.Play();
        for (int i = 1; i <= GameDataManager.ContinueGameBalls; i++)
        {
            yield return new WaitForSeconds(0.34f);
            this.PlayerCtrl.noOfBalls = i;
        }
        this.PlayerCtrl.start = true;
        yield break;
    }

    private int GetRandomId(int min, int max, List<int> lastIds, int maxLastCount)
    {

        //TODO ************* 随机场景的逻辑
        int num = UnityEngine.Random.Range(min, max);
        if (lastIds.Count > 0)
        {
            for (int i = 0; i < maxLastCount; i++)
            {
                if (!lastIds.Contains(num))
                {
                    break;
                }
                num = UnityEngine.Random.Range(min, max);
            }
        }
        lastIds.Add(num);
        if (lastIds.Count > maxLastCount)
        {
            lastIds.RemoveAt(0);
        }
        return num;
    }
private void Initialize(int level, int subLevel, int extraBalls)
    {
        print("传进来的是："+level); 
        if (event_ChangeLevel != null)
        {
            event_ChangeLevel();
        }   
        if(event_ViewFromLevel != null)
        {
            event_ViewFromLevel( level);
        }

        if (this.currentPrefab != null)
        {
            UnityEngine.Object.Destroy(this.currentPrefab);
            this.currentPrefab = null;
        }
        if (this.cacheAliveBalls.Count > 0)
        {
            Debug.LogWarning("Destroy last balls" + this.cacheAliveBalls.Count);
            foreach (KeyValuePair<int, GameObject> keyValuePair in this.cacheAliveBalls)
            {
                if (keyValuePair.Value != null)
                {
                    UnityEngine.Object.Destroy(keyValuePair.Value);
                }
            }
        }


      if (level < 6)
        {
            if (subLevel == this.subLevelCount)
            {
                int[] boss;
                if (loseNum >= 5)
                    boss = ConfigManager.Instance.levelData[level - 1].bossLose;
                else
                    boss = ConfigManager.Instance.levelData[level - 1].boss;

                Debug.Log("level:" + level + "      subLevel:" + subLevel + "      当前boss,随机关卡为:" + boss[0] + "                    boss");
                currentPrefab = Instantiate(bossPrefabs[boss[0] - 1]);
            }
            else
            {
                int[] normal = null;
                if (loseNum >= 5)
                    normal = ConfigManager.Instance.levelData[level - 1].normalLose;
                else
                    normal = ConfigManager.Instance.levelData[level - 1].normal;
                Debug.Log("level:" + level + "      subLevel:" + subLevel + "      当前normal,随机关卡为:" + (normal[subLevel] - 1) + "                    normal");
                currentPrefab = Instantiate(levelPrefabs[normal[subLevel] - 1]);
            }
        }
        else
        {
            if (subLevel == this.subLevelCount)
            {
                int[] boss;
                if (loseNum >= 5)
                    boss = ConfigManager.Instance.levelData[level - 1].bossLose;
                else
                    boss = ConfigManager.Instance.levelData[level - 1].boss;

                int num = GetRandomId2(boss, lastBossIds, maxLastBossCount);
                Debug.LogError("level:" + level + "      subLevel:" + subLevel + "      当前boss,随机关卡为:" + num + "                    boss");
                currentPrefab = Instantiate(bossPrefabs[num - 1]);
            }
            else
            {
                int[] normal;
                if (loseNum >= 5)
                    normal = ConfigManager.Instance.levelData[level - 1].normalLose;
                else
                    normal = ConfigManager.Instance.levelData[level - 1].normal;
                int num = GetRandomId2(normal, lastLevelIds, maxLastLevelCount);
                Debug.LogError("level:" + level + "      subLevel:" + subLevel + "      当前normal,随机关卡为:" + num + "                    normal");
                currentPrefab = Instantiate(levelPrefabs[num - 1]);
            }
        }

        this.currentPrefab.SetLayer(GameHelper.ObjectLayer, true);


        if (PlayerCtrl == null)
            this.PlayerCtrl = GameObject.FindGameObjectWithTag("Player").GetComponent<CannonController>();

        float balls = currentPrefab.GetComponent<NoOfBalls>().noOfBalls * (loseNum < 5 ? ConfigManager.Instance.levelData[level - 1].ballsMultiple : ConfigManager.Instance.levelData[level - 1].loseballsMultiple);
        Debug.LogError("计算炮弹数量为:" + balls);
        this.PlayerCtrl.MaxNoOfBalls = Mathf.RoundToInt(balls);
        this.PlayerCtrl.noOfBalls = this.PlayerCtrl.MaxNoOfBalls;
        

        AmmoDisplay.Instance.UpdateAmmonCount(this.PlayerCtrl.noOfBalls);
        this.PlayerCtrl.AddExtraBalls(extraBalls);
        this.currentObstacles.Clear();
        GameObject[] array = GameObject.FindGameObjectsWithTag("Obstacles");
        this.totalObstacles = array.Length;
        foreach (GameObject gameObject in array)
        {
            this.currentObstacles[gameObject.GetHashCode()] = gameObject;
            Rigidbody component = gameObject.GetComponent<Rigidbody>();
            if (component != null)
            {
                component.velocity = Vector3.zero;
                component.angularVelocity = Vector3.zero;
            }
        }
    }

   
    private int[] GetRandomLibrary(int level)
    {
        int num = 0;
        foreach (int num2 in GameDataManager.RandomSubLevelDic.Keys)
        {
            num = num2;
            if (level <= num)
            {
                break;
            }
        }
        Dictionary<int, float> dictionary = GameDataManager.RandomSubLevelDic[num];
        float num3 = 0f;
        foreach (float num4 in dictionary.Values)
        {
            float num5 = num4;
            num3 += num5;
        }
        float num6 = UnityEngine.Random.Range(0f, num3);
        int index = 0;
        float num7 = 0f;
        foreach (KeyValuePair<int, float> keyValuePair in dictionary)
        {
            num7 += keyValuePair.Value;
            if (num6 <= num7)
            {
                index = keyValuePair.Key;
                break;
            }
        }
        return GameDataManager.RandomSubLevelLibrary[index];
    }

 // 改成从int数组里获取
    private int GetRandomId2(int[] levels, List<int> lastIds, int maxLastCount)
    {

        //TODO ************* 随机场景的逻辑
        int num = UnityEngine.Random.Range(0, levels.Length);
        if (lastIds.Count > 0)
        {
            for (int i = 0; i < maxLastCount; i++)
            {
                if (!lastIds.Contains(levels[num]))
                {
                    break;
                }
                num = UnityEngine.Random.Range(0, levels.Length);
            }
        }
        lastIds.Add(levels[num]);
        if (lastIds.Count > maxLastCount)
        {
            lastIds.RemoveAt(0);
        }
        return levels[num];
    }
    public void NextLevel(int level, int subLevel, int extraBalls)
    {
        this.PlayerCtrl.start = true;
        this.PlayerCtrl.noOfExtraballs = 0;      
        this.Initialize(level, subLevel, extraBalls);
        Debug.Log("nextlevel    ");
        //hack 场景问题修改
        GameMenu.Instance.Initialize();

    }

    public void Play(int level, int subLevel, int extraBalls)
    {
        this.Initialize(level, subLevel, extraBalls);
        this.PlayerCtrl.start = true;
        Debug.Log("play");
    }

    public void Retry()
    {
    }

    public void BGColorChange()
    {
        int num = UnityEngine.Random.Range(0, this.ObstacleTextures.Length);
        this.obstacleMaterials.SetTexture("_MainTex", this.ObstacleTextures[num]);

    }

    public bool HaveMoveingObjects()
    {
        foreach (KeyValuePair<int, GameObject> keyValuePair in GameWorld.Instance.currentObstacles)
        {
            if (keyValuePair.Value != null)
            {
                Rigidbody component = keyValuePair.Value.GetComponent<Rigidbody>();
                if (component && component.gameObject.tag == "Obstacles" && (!Mathf.Approximately(component.velocity.magnitude, 0f) || !Mathf.Approximately(component.angularVelocity.magnitude, 0f)))
                {
                    return true;
                }
            }
        }
        return false;
    }

    public bool HaveObjects()
    {
        return GameWorld.Instance.currentObstacles.Count > 0;
    }

    public int startRandomLevel;

    public int BossLevelStartRandomLevel;

    public int subLevelCount;

    public int totalObstacles;

    public int currentObstaclesNo;

    public GameObject currentPrefab;

    [NonSerialized]
    public Dictionary<int, GameObject> currentObstacles = new Dictionary<int, GameObject>();

    [NonSerialized]
    public Dictionary<int, GameObject> cacheAliveBalls = new Dictionary<int, GameObject>();

    public GameObject[] levelPrefabs;

    public GameObject[] bossPrefabs;

    public Material obstacleMaterials;

    public Material glassMaterial;

    public Texture[] ObstacleTextures;

    [NonSerialized]
    private static List<int> lastLevelIds = new List<int>();

    [NonSerialized]
    private static List<int> lastBossIds = new List<int>();

    public int maxLastLevelCount = 20;

    public int maxLastBossCount = 5;


    //TODO 
    public GameMenu gameMenu;

    //ToDO  自己，实现剩余子弹数的 委托
    public delegate void ChangeBallCount(int n);
    public event ChangeBallCount event_changeBall;

    public delegate void ChangeLevel();
    public event ChangeLevel event_ChangeLevel;
    public delegate void ViewFromLevel(int tmp);
    public event ViewFromLevel event_ViewFromLevel;
    public bool isFirstLogin = true;

    public int loseNum;// 连续失败的次数

}
