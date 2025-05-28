using System;
using UnityEngine;

public class DestroySelf : MonoBehaviour
{
		private void Start()
	{
		UnityEngine.Object.Destroy(base.gameObject, this.lifeLine);
	}

		public float lifeLine = 1f;
}
