using System;
using System.Collections;
using UnityEngine;

public class DelayActive : MonoBehaviour
{
		private void Start()
	{
	}

		private void OnEnable()
	{
		for (int i = 0; i < this.Gos.Length; i++)
		{
			base.StartCoroutine(this.DoDelayActive(i));
		}
	}

		private IEnumerator DoDelayActive(int i)
	{
		this.Gos[i].SetActive(false);
		float delay = this.Delays[i];
		yield return new WaitForSeconds(delay);
		this.Gos[i].SetActive(true);
	}

		private void Update()
	{
	}

		public GameObject[] Gos;

		public float[] Delays;
}
