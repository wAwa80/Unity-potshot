using System;
using UnityEngine;
using UnityEngine.UI;

public class PointCollider : MonoBehaviour
{
		private void OnCollisionEnter2D(Collision2D coll)
	{
		SpinWheel.Instance.HitStart(this.pointSprite);
	}

		private void OnCollisionExit2D(Collision2D collisionInfo)
	{
		SpinWheel.Instance.HitEnd(this.pointSprite);
	}

		public Image pointSprite;
}
