using System;
using UnityEngine;

public class FaceToMoveDir : MonoBehaviour
{
		private void Start()
	{
		this.lastPosition = base.transform.position;
	}

		private void Update()
	{
		if (this.lastPosition != base.transform.position)
		{
			base.transform.forward = (base.transform.position - this.lastPosition).normalized;
			this.lastPosition = base.transform.position;
		}
	}

		private Vector3 lastPosition;
}
