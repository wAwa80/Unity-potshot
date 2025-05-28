using System;
using UnityEngine;

public class EasyUIShaker : MonoBehaviour
{
		private void Start()
	{
		EventDispatcher.AddEventListener(Texts.EventShakeUI, new Action(this.Shake));
	}

		private void Update()
	{
		if (this.isShaking)
		{
			base.transform.localPosition = UnityEngine.Random.insideUnitSphere * this.ShakeLevel;
			if (Time.time - this.shakeEnterTime >= this.ShakeDuration)
			{
				this.isShaking = false;
				base.transform.localPosition = Vector3.zero;
			}
		}
	}

		private void Shake()
	{
		this.isShaking = true;
		this.shakeEnterTime = Time.time;
	}

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener(Texts.EventShakeUI, new Action(this.Shake));
	}

		public float ShakeDuration = 0.2f;

		public float ShakeLevel = 10f;

		private bool isShaking;

		private float shakeEnterTime;
}
