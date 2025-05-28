using System;
using UnityEngine;

public class SpinWheelSetup : ScriptableObject
{
			public static SpinWheelSetup Instance
	{
		get
		{
			if (SpinWheelSetup.instance == null)
			{
				SpinWheelSetup.instance = (Resources.Load("FortuneWheelSetup") as SpinWheelSetup);
			}
			return SpinWheelSetup.instance;
		}
	}

		public static void DirtyEditor()
	{
	}

		public RewardItem[] rewarItem = new RewardItem[8];

		public WheelTheme theme;

		public int speed;

		public int spinDurationMin;

		public int spinDurationMax;

		public int spinTurnCost = 300;

		public bool freeTurn;

		public bool paidTurn;

		private const string assetDataPath = "Assets/GB_SpinWheel/Resources/";

		private const string assetName = "FortuneWheelSetup";

		private const string assetExt = ".asset";

		private static SpinWheelSetup instance;
}
