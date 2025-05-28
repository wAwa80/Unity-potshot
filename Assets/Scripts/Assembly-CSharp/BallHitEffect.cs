using System;
using System.Collections.Generic;
using UnityEngine;

public class BallHitEffect : MonoBehaviour
{
				public bool IsSuper { get; set; }

				public GameObject EffectExplosionPrefab { get; set; }

		private void Start()
	{
		this.aS = base.GetComponent<AudioSource>();
		this.avatarInfo = GameDataManager.AvatarInfoDatas[GameDataManager.PlayerAvatarIds.IndexOf(GameMenu.Instance.CurrentAvatarId)];
		if (this.IsSuper)
		{
			if (!string.IsNullOrEmpty(GameMenu.Instance.CurrentSuperFireInfo.EffectHit))
			{
				this.EffectExplosionPrefab = Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectHit);
			}
		}
		else
		{
			this.EffectExplosionPrefab = Resources.Load<GameObject>(this.avatarInfo.EffectHit);
		}
	}

		private void OnCollisionEnter(Collision other)
	{
		if (other.collider.tag == "Obstacles" && !this.hit)
		{
			this.hit = true;
			if (!string.IsNullOrEmpty(GameMenu.Instance.CurrentSuperFireInfo.EffectHit))
			{
				GameObject obj = UnityEngine.Object.Instantiate<GameObject>(this.EffectExplosionPrefab, base.transform.position, Quaternion.identity);
				UnityEngine.Object.Destroy(obj, 2f);
				ShakeManager.LightShake();
			}
		}
		if (other.collider.tag == "Obstacles")
		{
			if (other.collider.name.Contains("Glass"))
			{
				this.aS.clip = Resources.Load<AudioClip>(Texts.SoundHitGlassPath);
				this.aS.Play();
			}
			else if (other.collider.name.Contains("TNT"))
			{
				this.aS.clip = Resources.Load<AudioClip>(Texts.SoundHitTNTPath);
				this.aS.Play();
			}
			else
			{
				this.aS.clip = this.HitSounds[UnityEngine.Random.Range(0, this.HitSounds.Count)];
				this.aS.Play();
			}
		}
	}

		private bool hit;

		private AudioSource aS;

		public List<AudioClip> HitSounds = new List<AudioClip>();

		private AvatarInfo avatarInfo;
}
