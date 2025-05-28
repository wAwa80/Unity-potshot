using System;
using System.Collections;
using System.Collections.Generic;
using Game.Walker;
using UnityEngine;

public class HoleHandler : MonoBehaviour
{
		private void Awake()
	{
		this.objects = new List<GameObject>();
		UnityEngine.Object.Destroy(base.gameObject, this.life);
	}

		private void Start()
	{
		this.bc = GameObject.FindGameObjectWithTag("ButtonCanvas").GetComponent<GameMenu>();
	}

		private void Update()
	{
		base.transform.position += base.transform.forward * this.speed * Time.deltaTime;
		if (this.objects != null && this.objects.Count > 0)
		{
			for (int i = 0; i < this.objects.Count; i++)
			{
				GameObject gameObject = this.objects[i];
				if (gameObject != null)
				{
					Vector3 localScale = Vector3.Lerp(gameObject.transform.localScale, Vector3.zero, Time.deltaTime * this.durationToShrink);
					gameObject.transform.localScale = localScale;
					gameObject.transform.position = Vector3.Lerp(gameObject.transform.position, base.transform.position, Time.deltaTime * this.durationToShrink);
					Vector3 vector = gameObject.transform.position - base.transform.position;
					vector = Quaternion.Euler(0f, 0f, Time.deltaTime * 360f) * vector;
					gameObject.transform.position = base.transform.position + vector;
					gameObject.transform.rotation *= Quaternion.Euler(0f, 0f, Time.deltaTime * 360f);
				}
			}
		}
	}

		private void DoShrink(Collider other)
	{
		GameObject gameObject = other.gameObject;
		if (gameObject.tag == "Obstacles" || (this.isCheckBall && gameObject.tag == "Ball") || gameObject.layer == GameHelper.ObjectLayer)
		{
			if (gameObject.tag == "Obstacles")
			{
				this.bc.AddScore(1);
				GameWorld.Instance.currentObstacles.Remove(gameObject.GetHashCode());
			}
			else if (gameObject.tag == "Ball")
			{
				GameWorld.Instance.cacheAliveBalls.Remove(gameObject.GetHashCode());
			}
			else
			{
				if (other.transform.parent)
				{
					other.transform.parent = null;
				}
				MovementScript component = other.transform.GetComponent<MovementScript>();
				if (component != null)
				{
					component.enabled = false;
				}
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

		private void OnDestroy()
	{
		if (this.objects != null && this.objects.Count > 0)
		{
			for (int i = 0; i < this.objects.Count; i++)
			{
				GameObject gameObject = this.objects[i];
				if (gameObject != null)
				{
					UnityEngine.Object.Destroy(gameObject);
				}
			}
		}
	}

		private IEnumerator DestroyObjects(GameObject other)
	{
		yield return new WaitForSeconds(this.waitBeforeDestroy);
		if (other != null)
		{
			this.objects.Remove(other);
			UnityEngine.Object.Destroy(other);
		}
		yield break;
	}

		public float speed = 6f;

		public float life = 10f;

		[NonSerialized]
	public List<GameObject> objects;

		public float waitBeforeDestroy = 3f;

		public float durationToShrink = 3f;

		public bool isCheckBall = true;

		private GameMenu bc;
}
