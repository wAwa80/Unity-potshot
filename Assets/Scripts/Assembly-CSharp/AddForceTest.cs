using System;
using UnityEngine;

public class AddForceTest : MonoBehaviour
{
		private void Start()
	{
	}

		private void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.Bullet, Vector3.zero, Quaternion.identity);
			gameObject.GetComponent<Rigidbody>().AddForce(gameObject.transform.forward * this.Factor * 2000f);
            Debug.Log(gameObject.name);
		}
	}

		public GameObject Bullet;

		public float Factor;
}
