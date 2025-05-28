using System;
using UnityEngine;

public class BGMusic : MonoBehaviour
{
		private void Start()
	{
		UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
		GameObject[] array = GameObject.FindGameObjectsWithTag("BGMusic");
		if (array.Length > 1)
		{
			UnityEngine.Object.Destroy(array[1]);
		}
	}
}
