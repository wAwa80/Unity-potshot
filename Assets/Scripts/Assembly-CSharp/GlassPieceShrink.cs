using System;
using UnityEngine;

public class GlassPieceShrink : MonoBehaviour
{
		private void Start()
	{
		UnityEngine.Object.Destroy(base.gameObject, this.lifeline);
	}

		private void Update()
	{
		Vector3 localScale = Vector3.Lerp(base.transform.localScale, Vector3.zero, Time.deltaTime * this.shrinkDuration);
		base.transform.localScale = localScale;
	}

		public float shrinkDuration = 2f;

		public float lifeline = 3f;
}
