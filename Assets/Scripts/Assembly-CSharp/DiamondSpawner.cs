using System;
using UnityEngine;

public class DiamondSpawner : MonoBehaviour
{
		private void Start()
	{
		this.positionTemp1 = base.transform.localPosition;
		this.positionTemp2 = base.transform.localPosition;
		this.targetPosition = GameMenu.Instance.TextDiamond.transform.position;
		this.upTime = UnityEngine.Random.Range(this.UpTimeMin, this.UpTimeMax);
		this.downTime = UnityEngine.Random.Range(this.DownTimeMin, this.DownTimeMax);
		this.stayTime = UnityEngine.Random.Range(this.StayTimeMin, this.StayTimeMax);
		this.flyTime = UnityEngine.Random.Range(this.FlyTimeMin, this.FlyTimeMax);
		float num = UnityEngine.Random.Range(50f, 100f) * ((UnityEngine.Random.Range(0f, 1f) <= 0.5f) ? -1f : 1f);
		this.positionTemp1.x = this.positionTemp1.x + num * 0.5f;
		this.positionTemp1.y = this.positionTemp1.y + UnityEngine.Random.Range(100f, 200f);
		this.positionTemp2.x = this.positionTemp2.x + num;
		LTSeq ltseq = LeanTween.sequence(true);
		ltseq.append(LeanTween.moveLocal(base.gameObject, this.positionTemp1, this.upTime));
		ltseq.append(LeanTween.moveLocal(base.gameObject, this.positionTemp2, this.downTime));
		ltseq.append(LeanTween.moveLocal(base.gameObject, this.positionTemp2, this.stayTime));
		ltseq.append(LeanTween.move(base.gameObject, this.targetPosition, this.flyTime));
		ltseq.append(delegate()
		{
			UnityEngine.Object.Destroy(base.gameObject);
		});
	}

		public float UpTimeMin = 0.2f;

		public float UpTimeMax = 0.3f;

		private float upTime;

		public float DownTimeMin = 0.2f;

		public float DownTimeMax = 0.3f;

		private float downTime;

		public float StayTimeMin = 0.2f;

		public float StayTimeMax = 0.3f;

		private float stayTime;

		public float FlyTimeMin = 0.6f;

		public float FlyTimeMax = 0.8f;

		private float flyTime;

		private Vector3 targetPosition;

		private Vector3 positionTemp1;

		private Vector3 positionTemp2;
}
