using System;

public class AvatarInfo
{
				public string Id { get; set; }

				public UnlockType UnlockType { get; set; }

				public int UnlockLevel { get; set; }

				public int UnlockDiamond { get; set; }

				public string EffectBullet { get; set; }

				public string EffectMuzzle { get; set; }

				public string EffectHit { get; set; }

				public string SoundFire { get; set; }

				public string[] SoundHit { get; set; }

				public bool DisableFireShake { get; set; }

				public int FireCount { get; set; }

				public int FireEffectCount { get; set; }

				public string SuperFireCannonEffect { get; set; }

				public string SpawnEffectPath { get; set; }

				public string SpawnAnimationName { get; set; }

				public string DeadAnimationName { get; set; }
}
