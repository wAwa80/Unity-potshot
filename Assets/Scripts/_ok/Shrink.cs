using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shrink : MonoBehaviour
{
		private void Awake()
	{
		this.objects = new List<GameObject>();
	}

		private void Start()
	{
		this.bc = GameObject.FindGameObjectWithTag("ButtonCanvas").GetComponent<GameMenu>();
	}

		private void Update()
	{
		if (this.objects != null && this.objects.Count > 0)
		{
			for (int i = 0; i < this.objects.Count; i++)
			{
				if (this.objects[i] != null)
				{
					Vector3 localScale = Vector3.Lerp(this.objects[i].transform.localScale, Vector3.zero, Time.deltaTime * this.durationToShrink);
					this.objects[i].transform.localScale = localScale;
				}
			}
		}
	}

		private void DoShrink(Collider other)
	{
		GameObject gameObject = other.gameObject;
		if (gameObject.tag == "Obstacles" || (this.isCheckBall && gameObject.tag == "Ball"))
		{
			if (gameObject.tag == "Obstacles")
			{
				this.bc.AddScore(1);
                //
				GameWorld.Instance.currentObstacles.Remove(gameObject.GetHashCode());
			}
			else
			{
				GameWorld.Instance.cacheAliveBalls.Remove(gameObject.GetHashCode());
			}
			gameObject.tag = "Untagged";
			this.objects.Add(gameObject);
			base.StartCoroutine(this.DestroyObjects(gameObject));
		}
	}

		private void OnTriggerEnter(Collider other)
	{
		this.DoShrink(other);
	}

		private void OnCollisionEnter(Collision other)
	{
		this.DoShrink(other.collider);
	}

		private IEnumerator DestroyObjects(GameObject other)
	{
		yield return new WaitForSeconds(this.waitBeforeDestroy);
		if (other != null)
		{
			this.objects.Remove(other);
			UnityEngine.Object.Destroy(other);
		}
	}

		[NonSerialized]
	public List<GameObject> objects;

		public float waitBeforeDestroy = 3f;

		public float durationToShrink = 2f;

		public bool isCheckBall = true;

		private GameMenu bc;
}
