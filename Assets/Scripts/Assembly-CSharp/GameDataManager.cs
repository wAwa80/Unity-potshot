using System;
using System.Collections.Generic;

public static class GameDataManager
{
    
			public static int LevelSucceedVideo
	{
		get
		{
			int result = GameDataManager._levelSucceedVideos[GameDataManager.lastLevelSucceedVideosIndex];
			GameDataManager.lastLevelSucceedVideosIndex++;
			if (GameDataManager.lastLevelSucceedVideosIndex >= GameDataManager._levelSucceedVideos.Length)
			{
				GameDataManager.lastLevelSucceedVideosIndex = 0;
			}
			return result;
		}
	}

		public static bool SuperGame = false;

		public static int DiamondPerBigLevel = 100;

		public static int MaxSuperFirePoint = 4;

		public static int ContinueGameBalls = 3;

		private static int[] _levelSucceedVideos = new int[]
	{
		1,
		2
	};

		private static int lastLevelSucceedVideosIndex = 0;

		public static int LevelFailedVideo = 3;

		public static int LevelVideoStart = 5;

		public static string DefaultAvatarId = "Cannon_01";

		public static string DefaultSceneId = "Scenes_01";

		public static string DefaultSuperFireId = "SF_01";

		public static int ReliveMaxTimesPerSubLevel = -1;

		public static int[] SubLevelGradeScores = new int[]
	{
		100,
		50,
		0,
		10,
		50
	};

		public static string TrialCannonId = "Cannon_22";

		public static int TrialCannonSubLevels = 5;

		public static int LevelSucceedTimes = 0;

		public static int LevelFailedTimes = 0;

		public static bool IsFromLost = false;

		public static float ShowRateTime = 180f;

		public static List<int[]> RandomSubLevelLibrary = new List<int[]>
	{
		new int[]
		{
			0,
			30
		},
		new int[]
		{
			31,
			60
		},
		new int[]
		{
			61,
			90
		},
		new int[]
		{
			91,
			120
		},
		new int[]
		{
			121,
			159
		}
	};

		public static Dictionary<int, Dictionary<int, float>> RandomSubLevelDic = new Dictionary<int, Dictionary<int, float>>
	{
		{
			10,
			new Dictionary<int, float>
			{
				{
					0,
					1f
				},
				{
					1,
					1f
				},
				{
					2,
					1f
				},
				{
					3,
					1f
				},
				{
					4,
					1f
				}
			}
		}
	};

		public static List<string> PlayerAvatarIds = new List<string>
	{
		"Cannon_01",
		"Cannon_04",
		"Cannon_06",
		"Cannon_02",
		"Cannon_05",
		"Cannon_03",
		"Cannon_07",
		"Cannon_08",
		"Cannon_22"
		//"Cannon_10",
		//"Cannon_11",
		//"Cannon_12",
		//"Cannon_13",
		//"Cannon_14",
		//"Cannon_15",
		//"Cannon_16",
		//"Cannon_17",
		//"Cannon_18",
		//"Cannon_19",
		//"Cannon_20",
		//"Cannon_21",
		//"Cannon_22"
	};

		public static List<AvatarInfo> AvatarInfoDatas = new List<AvatarInfo>
	{
		new AvatarInfo
		{
			Id = "Cannon_01",
			UnlockType = UnlockType.Unlocked,
			UnlockLevel = 0,
			UnlockDiamond = 0,
			EffectBullet = "Effects/RawArts/pp/effects_01",
			EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_FireHit",
			SoundFire = "Sounds/Shoot1",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 1,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_04",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 5,
			UnlockDiamond = 1200,
			EffectBullet = "Effects/RawArts/pp/effects_05",
			EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_IceHit",
			SoundFire = "Sounds/ice",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 1,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_06",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 15,
			UnlockDiamond = 1500,
			EffectBullet = "Effects/RawArts/pp/effects_06",
			EffectMuzzle = "Effects/RawArts/pp/effects_LightingMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_LightingHit",
			SoundFire = "Sounds/thunder",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 1,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_02",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 20,
			UnlockDiamond = 1500,
			EffectBullet = "Effects/RawArts/pp/effects_02",
			EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_FireHit",
			SoundFire = "Sounds/Shoot1",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 1,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_05",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 30,
			UnlockDiamond = 3000,
            EffectBullet = "Effects/RawArts/pp/effects_05",
            EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
            EffectHit = "Effects/RawArts/pp/effects_IceHit",
            SoundFire = "Sounds/ice",
            SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 2,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_03",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 40,
			UnlockDiamond = 4500,
			EffectBullet = "Effects/RawArts/pp/effects_04",
			EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_FireHit",
			SoundFire = "Sounds/Shoot1",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 2,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_07",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 55,
			UnlockDiamond = 4500,
            EffectBullet = "Effects/RawArts/pp/effects_06",
            EffectMuzzle = "Effects/RawArts/pp/effects_LightingMuzzle",
            EffectHit = "Effects/RawArts/pp/effects_LightingHit",
            SoundFire = "Sounds/thunder",
            SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 2,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
		new AvatarInfo
		{
			Id = "Cannon_08",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 75,
			UnlockDiamond = 6000,
            EffectBullet = "Effects/RawArts/pp/effects_13_02",
            EffectHit = "Effects/RawArts/pp/effects_13_03",
            SoundFire = "Sounds/Shoot1",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 2,
			FireEffectCount = 1,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
			SpawnAnimationName = "Cannon_born_00"
		},
        #region
        //new AvatarInfo
        //{
        //          Id = "Cannon_22",
        //          UnlockType = UnlockType.SpinWheel,
        //          UnlockLevel = 95,
        //          UnlockDiamond = 6000,
        //          EffectBullet = "Effects/RawArts/pp/effects_09",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_FireHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 4,
        //	FireEffectCount = 4,
        //          SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_03",
        //          SpawnEffectPath = "Effects/RawArts/pp/effects_born_02",
        //          SpawnAnimationName = "Cannon_born_01",
        //          DeadAnimationName = "Cannon_disappear"

        //      },
        //new AvatarInfo
        //{
        //	Id = "Cannon_10",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 120,
        //	UnlockDiamond = 7500,
        //	EffectBullet = "Effects/RawArts/pp/effects_10",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_LightingMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_LightingHit",
        //	SoundFire = "Sounds/thunder",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_11",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 145,
        //	UnlockDiamond = 9000,
        //	EffectBullet = "Effects/RawArts/pp/effects_11",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_IceHit",
        //	SoundFire = "Sounds/ice",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_12",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 175,
        //	UnlockDiamond = 9000,
        //	EffectBullet = "Effects/RawArts/pp/effects_12",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_FireHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_13",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 205,
        //	UnlockDiamond = 10500,
        //	EffectBullet = "Effects/RawArts/pp/effects_13_02",
        //	EffectHit = "Effects/RawArts/pp/effects_13_03",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	DisableFireShake = true,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_02",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_14",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 240,
        //	UnlockDiamond = 10500,
        //	EffectBullet = "Effects/RawArts/pp/effects_14",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_FireHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_15",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 275,
        //	UnlockDiamond = 12000,
        //	EffectBullet = "Effects/RawArts/pp/effects_15",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_FireHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_16",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 315,
        //	UnlockDiamond = 12000,
        //	EffectBullet = "Effects/RawArts/pp/effects_16",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_IceHit",
        //	SoundFire = "Sounds/ice",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_17",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 355,
        //	UnlockDiamond = 13500,
        //	EffectBullet = "Effects/RawArts/pp/effects_17",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_IceHit",
        //	SoundFire = "Sounds/ice",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_18",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 400,
        //	UnlockDiamond = 13500,
        //	EffectBullet = "Effects/RawArts/pp/effects_18",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_LightingMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_LightingHit",
        //	SoundFire = "Sounds/thunder",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 1,
        //	FireEffectCount = 1,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_19",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 445,
        //	UnlockDiamond = 15000,
        //	EffectBullet = "Effects/RawArts/pp/effects_19",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_IceMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_IceHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 2,
        //	FireEffectCount = 2,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_03",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_20",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 495,
        //	UnlockDiamond = 15000,
        //	EffectBullet = "Effects/RawArts/pp/effects_20",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_FireHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 2,
        //	FireEffectCount = 2,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
        //new AvatarInfo
        //{
        //	Id = "Cannon_21",
        //	UnlockType = UnlockType.LevelAndDiamond,
        //	UnlockLevel = 545,
        //	UnlockDiamond = 16500,
        //	EffectBullet = "Effects/RawArts/pp/effects_21",
        //	EffectMuzzle = "Effects/RawArts/pp/effects_LightingMuzzle",
        //	EffectHit = "Effects/RawArts/pp/effects_LightingHit",
        //	SoundFire = "Sounds/Shoot1",
        //	SoundHit = new string[]
        //	{
        //		"Sounds/Hit1",
        //		"Sounds/Hit2"
        //	},
        //	FireCount = 2,
        //	FireEffectCount = 2,
        //	SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_01",
        //	SpawnEffectPath = "Effects/RawArts/pp/effects_born_01",
        //	SpawnAnimationName = "Cannon_born_00"
        //},
#endregion
        new AvatarInfo
		{
			Id = "Cannon_22",
			UnlockType = UnlockType.SpinWheel,
			UnlockLevel = 95,
			UnlockDiamond = 6500,
			EffectBullet = "Effects/RawArts/pp/effects_22",
			EffectMuzzle = "Effects/RawArts/pp/effects_FireMuzzle",
			EffectHit = "Effects/RawArts/pp/effects_FireHit",
			SoundFire = "Sounds/Shoot1",
			SoundHit = new string[]
			{
				"Sounds/Hit1",
				"Sounds/Hit2"
			},
			FireCount = 4,
			FireEffectCount = 2,
			SuperFireCannonEffect = "Effects/RawArts/pp/effects_SF_00_03",
			SpawnEffectPath = "Effects/RawArts/pp/effects_born_02",
			SpawnAnimationName = "Cannon_born_01",
			DeadAnimationName = "Cannon_disappear"
		}
	};

    /// <summary>
    /// scene 只加载前8个
    /// </summary>
	public static List<string> SceneBGs = new List<string>
	{
        "Scenes_01",
        "Scenes_02",
        "Scenes_03",
        "Scenes_04",
        "Scenes_05",
        "Scenes_06",
        "Scenes_07",
        "Scenes_08"        
       // "Scenes_05"
        //"Scenes_01",
		//"Scenes_02",
		//"Scenes_03",
		//"Scenes_04",
		//"Scenes_05",
		//"Scenes_06",
		//"Scenes_07",
		//"Scenes_08",
		//"Scenes_09",
		//"Scenes_10",
		//"Scenes_11",
		//"Scenes_12",
		//"Scenes_13",
		//"Scenes_14",
		//"Scenes_15",
		//"Scenes_16",
		//"Scenes_17",
		//"Scenes_18"
	};

		public static List<SceneBGUnlockInfo> SceneBGUnlockInfoDatas = new List<SceneBGUnlockInfo>
	{
		new SceneBGUnlockInfo
		{
			Id = "Scenes_01",
			UnlockType = UnlockType.Unlocked,
			UnlockLevel = 0,
			UnlockDiamond = 0
		},
		new SceneBGUnlockInfo
		{
			Id = "Scenes_02",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 10,
			UnlockDiamond = 0
		},
		new SceneBGUnlockInfo
		{
			Id = "Scenes_03",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 25,
			UnlockDiamond = 0
		},
		new SceneBGUnlockInfo
		{
			Id = "Scenes_04",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 35,
			UnlockDiamond = 0
		},
		new SceneBGUnlockInfo
		{
			Id = "Scenes_05",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 50,
			UnlockDiamond = 0
		},
        new SceneBGUnlockInfo
        {
            Id = "Scenes_06",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 80,
            UnlockDiamond = 0
        },
        new SceneBGUnlockInfo
        {
            Id = "Scenes_07",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 115,
            UnlockDiamond = 0
        },
        new SceneBGUnlockInfo
        {
            Id = "Scenes_08",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 155,
            UnlockDiamond = 0
        },
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_09",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 200,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_10",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 250,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_11",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 305,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_12",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 365,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_13",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 430,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_14",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 500,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_15",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 575,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_16",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 655,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_17",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 740,
		//	UnlockDiamond = 0
		//},
		//new SceneBGUnlockInfo
		//{
		//	Id = "Scenes_18",
		//	UnlockType = UnlockType.LevelAndDiamond,
		//	UnlockLevel = 830,
		//	UnlockDiamond = 0
		//}
	};

		public static List<string> SuperFireIds = new List<string>
	{
		"SF_01",
		"SF_02",
		"SF_03",
		"SF_05",
		"SF_04"
	};

    public static List<SuperFireInfo> SuperFireInfoDatas = new List<SuperFireInfo>
    {
        new SuperFireInfo
        {
            Id = "SF_01",
            UnlockType = UnlockType.Unlocked,
            UnlockLevel = 0,
            UnlockDiamond = 0,
            SuperFireType = SuperFireType.BigBullet,
            Name = "BigBall",
            EffectMuzzle = "Effects/RawArts/pp/effects_SF_01_01",
            EffectBullet = "Effects/RawArts/pp/effects_SF_01_02",
            EffectHit = "Effects/RawArts/pp/effects_SF_01_03",
            SoundFire = "Sounds/bigball",
            SoundHit = new string[]
            {
                "Sounds/Hit1"
            }
        },
        new SuperFireInfo
        {
            Id = "SF_02",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 10,
            UnlockDiamond = 1500,
            SuperFireType = SuperFireType.ManyBullets,
            Name = "Shotgun",
            EffectMuzzle = "Effects/RawArts/pp/effects_SF_02_01",
            EffectBullet = "Effects/RawArts/pp/effects_SF_02_02",
            EffectHit = "Effects/RawArts/pp/effects_SF_02_03",
            SoundFire = "Sounds/Shoot1",
            SoundHit = new string[]
            {
                "Sounds/Hit1"
            }
        },
        new SuperFireInfo
        {
            Id = "SF_03",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 20,
            UnlockDiamond = 2300,
            SuperFireType = SuperFireType.Laser,
            Name = "Laser",
            EffectMuzzle = "Effects/RawArts/pp/effects_SF_03_01",
            EffectHit = "Effects/RawArts/pp/effects_SF_03_03",
            SoundFire = "Sounds/lightning_loop",
            SoundHit = new string[]
            {
                "Sounds/Hit1"
            }
        },
        new SuperFireInfo
        {
            Id = "SF_05",
            UnlockType = UnlockType.LevelAndDiamond,
            UnlockLevel = 25,
            UnlockDiamond = 2700,
            SuperFireType = SuperFireType.ContinuousFire,
            Name = "Continuous" +"\r\n"+"Fire",
            
		},
		new SuperFireInfo
		{
			Id = "SF_04",
			UnlockType = UnlockType.LevelAndDiamond,
			UnlockLevel = 30,
			UnlockDiamond = 3000,
			SuperFireType = SuperFireType.Hole,
			Name = "BlackHole",
			EffectBullet = "Effects/RawArts/pp/effects_SF_04_02",
			SoundFire = "Sounds/blackhole",
			SoundHit = new string[]
			{
				"Sounds/Hit1"
			}
		}
	};

        //TODO ---
	public static List<CollectionInfo> CollectionInfoDatas = new List<CollectionInfo>
	{
		new CollectionInfo
		{
			Id = "Valentine",
			Levels = new string[]
			{
				"Boss1",
				"Boss40",
				"Boss4",
				"Boss30",
				"Boss25",
				"Boss20",
				"Boss8",
				"Boss16",
				"Boss12"
			},
			Rewards = new CollectionRewardInfo[]
			{
				new CollectionRewardInfo
				{
					CollectionCount = 3,
					Type = RewardType.Diamond,
					Count = 250,
					RewardId = "Dimond"
				},
				new CollectionRewardInfo
				{
					CollectionCount = 6,
					Type = RewardType.Diamond,
					Count = 500,
					RewardId = "Dimond"
				},
				new CollectionRewardInfo
				{
					CollectionCount = 9,
					Type = RewardType.Cannon,
					Count = 1,
					RewardId = "Cannon_19"
				}
			}
		}
	};
    public static List<string> SceneItemName = new List<string>
    {
        "RANDOM",
        "FIRST",
        "SECOND",
        "THIRD",
        "FOURTH",
        "FIFTH",
        "SIXTH",
        "SEVENTH",
        "EIGHTH"
    };
}
