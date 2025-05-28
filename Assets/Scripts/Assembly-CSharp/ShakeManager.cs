using System;
using MoreMountains.NiceVibrations;

public static class ShakeManager
{
		public static void LightShake()
	{
		if (GameMenu.Instance.EnableShake)
		{
            //TODO 发射炮弹 安卓效果取消
            MMVibrationManager.Haptic(HapticTypes.LightImpact);
        }
    }

		public static void MediumShake()
	{
		if (GameMenu.Instance.EnableShake)
		{
            //TODO 发射炮弹 安卓效果取消
			MMVibrationManager.Haptic(HapticTypes.MediumImpact);
		}
	}

		public static void HeavyShake()
	{
		if (GameMenu.Instance.EnableShake)
		{
            //TODO 发射炮弹 安卓效果取消
            MMVibrationManager.Haptic(HapticTypes.HeavyImpact);
		}
	}
}
