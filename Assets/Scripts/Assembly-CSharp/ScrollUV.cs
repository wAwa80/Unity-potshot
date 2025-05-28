using System;
using UnityEngine;

public class ScrollUV : MonoBehaviour
{
		private void Start()
	{
		this.renderer = base.GetComponent<Renderer>();
	}

		private void Update()
	{
		float x = Time.time * this.scrollSpeed_X;
		float y = Time.time * this.scrollSpeed_Y;
		this.renderer.material.mainTextureOffset = new Vector2(x, y);
	}

		public float scrollSpeed_X = 0.5f;

		public float scrollSpeed_Y = 0.5f;

		private Renderer renderer;
}
