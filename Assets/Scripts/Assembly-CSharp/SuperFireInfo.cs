using System;

public class SuperFireInfo
{
                public string Id { get; set; }

                public string Name { get; set; }

                public UnlockType UnlockType { get; set; }

                public int UnlockLevel { get; set; }

            
    public int UnlockDiamond
    {
        get;set;
    }

				public SuperFireType SuperFireType { get; set; }

				public string EffectBullet { get; set; }

				public string EffectMuzzle { get; set; }

				public string EffectHit { get; set; }

				public string SoundFire { get; set; }

				public string[] SoundHit { get; set; }
}
