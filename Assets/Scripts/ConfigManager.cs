using System;
using System.Collections.Generic;
using UnityEngine;

public class ConfigManager
{

    private static ConfigManager _instance;


    public List<LevelData> levelData { get; set; }

    public String[] sTmp;//用于循环接收
    private ConfigManager()
    {
    }

    public static ConfigManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new ConfigManager();
            }
            return _instance;
        }
    }

    public void Init()
    {
        ReadLevelData();
    }


    // private void ReadLevelData()
    // {
    //     TextAsset textAsset = Resources.Load<TextAsset>("Config/LevelData");
    //     string[] array = textAsset.text.Split(new char[]
    //     {
    //         '\r',
    //         '\n'
    //     }, StringSplitOptions.RemoveEmptyEntries);
    //     levelData = new List<LevelData>();
    //     for (int i = 1; i < array.Length; i++)
    //     {
    //         string[] array2 = array[i].Split(new char[]
    //         {
    //             ','
    //         });
    //         LevelData item;
    //         item.levelId = int.Parse(array2[0]);
    //         Debug.LogError("item.levelId:" + item.levelId);
    //         item.normalMin = ToIntList(array2[1]);
    //         item.normalMax = ToIntList(array2[2]);
    //         item.bossMin = ToIntList(array2[3]);
    //         item.bossMax = ToIntList(array2[4]);
    //         item.loseMin = int.Parse(array2[5]);
    //         item.loseMax = int.Parse(array2[6]);
    //         item.ballsMultiple = float.Parse(array2[7]);
    //         item.loseballsMultiple = float.Parse(array2[8]);
    //         levelData.Add(item);
    //     }
    // }

    
    // private List<int> ToIntList(string s)
    // {
    //     List<int> list = new List<int>();
    //     sTmp = null;
    //     sTmp = s.Split(new char[]
    //     {
    //         '_'
    //     }, StringSplitOptions.RemoveEmptyEntries);
    //     foreach (var item in sTmp)
    //     {
    //         list.Add(int.Parse(item));
    //     }
    //     return list;
    // }
    
  private void ReadLevelData()
    {
        TextAsset textAsset = Resources.Load<TextAsset>("Config/LevelData");
        string[] array = textAsset.text.Split(new char[]
        {
            '\r',
            '\n'
        }, StringSplitOptions.RemoveEmptyEntries);
        levelData = new List<LevelData>();
        for (int i = 1; i < array.Length; i++)
        {
            string[] array2 = array[i].Split(new char[]
            {
                ','
            });
            LevelData item;
            item.levelId = int.Parse(array2[0]);
            item.normal = string2int(array2[1].Split('_'));
            item.boss = string2int(array2[2].Split('_'));
            item.normalLose = string2int(array2[3].Split('_'));
            item.bossLose = string2int(array2[4].Split('_'));
            item.ballsMultiple = float.Parse(array2[5]);
            item.loseballsMultiple = float.Parse(array2[6]);
            levelData.Add(item);
        }
    }


    private int[] string2int(string[] strings)
    {
        int[] values = new int[strings.Length];
        for (int i = 0; i < strings.Length; i++)
        {
            values[i] = int.Parse(strings[i]);
        }
        return values;
    }


}

public struct LevelData
{
    public int levelId;

    public int[] normal;

    public int[] boss;

    public int[] normalLose;

    public int[] bossLose;

    public float ballsMultiple;

    public float loseballsMultiple;
}
