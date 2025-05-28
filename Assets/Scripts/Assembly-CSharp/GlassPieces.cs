using System;
using UnityEngine;

public class GlassPieces : MonoBehaviour
{
		private void DoBroken(Vector3 position)
	{
		base.gameObject.tag = "Untagged";
		this.hit = true;
		for (int i = 0; i < this.noOfPieces; i++)
		{
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.piece, position, Quaternion.identity);
			gameObject.transform.localScale = new Vector3(base.transform.localScale.x / 2f, base.transform.localScale.y / 2f, base.transform.localScale.z / 2f);
		}
		GameMenu.Instance.AddScore(1);
		GameWorld.Instance.currentObstacles.Remove(base.gameObject.GetHashCode());
		UnityEngine.Object.Destroy(base.gameObject);
	}

		private void OnCollisionEnter(Collision other)
	{
		if (other.collider.tag == "Ball" && !this.hit)
		{
			this.DoBroken(other.transform.position);
		}
	}

		public void OnExplosion(Vector3 position)
	{
		if (!this.hit)
		{
			this.DoBroken(position);
		}
	}

		public int noOfPieces = 10;

		public GameObject piece;

		private bool hit;
}
