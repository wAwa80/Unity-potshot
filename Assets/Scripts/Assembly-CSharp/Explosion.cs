using System;
using Game.Walker;
using UnityEngine;

public class Explosion : MonoBehaviour
{
		private void Start()
	{
		this.collider = base.GetComponent<Collider>();
		this.fxPrefab = Resources.Load<GameObject>(Texts.TNTEffectPath);
	}

		public void DoExplosion(Collider other)
	{
		if (!this.hit)
		{
			base.gameObject.tag = "Untagged";
			this.hit = true;
			Collider[] array = Physics.OverlapSphere(base.transform.position, this.radius, GameHelper.ObjectLayerMasks, QueryTriggerInteraction.Ignore);
			if (this.fxPrefab)
			{
				GameObject obj = UnityEngine.Object.Instantiate<GameObject>(this.fxPrefab, other.transform.position, Quaternion.identity);
				UnityEngine.Object.Destroy(obj, this.fxLife);
			}
			if (array != null)
			{
				foreach (Collider collider in array)
				{
					Rigidbody component = collider.GetComponent<Rigidbody>();
					if (component)
					{
						component.AddExplosionForce(this.force, base.transform.position, this.radius);
					}
					GlassPieces component2 = collider.GetComponent<GlassPieces>();
					if (component2)
					{
						component2.OnExplosion(base.transform.position);
					}
					Explosion component3 = collider.GetComponent<Explosion>();
					if (component3)
					{
						component3.DoExplosion(this.collider);
					}
				}
			}
			GameMenu.Instance.AddScore(1);
			GameWorld.Instance.currentObstacles.Remove(base.gameObject.GetHashCode());
			UnityEngine.Object.Destroy(base.gameObject);
		}
	}

		private void OnCollisionEnter(Collision other)
	{
		if (other.collider.tag == "Ball")
		{
			this.DoExplosion(other.collider);
		}
	}

		public float radius = 2f;

		public float force = 20f;

		public float fxLife = 5f;

		private GameObject fxPrefab;

		private bool hit;

		public Collider collider;
}
