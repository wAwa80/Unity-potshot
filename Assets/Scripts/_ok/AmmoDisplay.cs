using System;
using UnityEngine;

public class AmmoDisplay : MonoBehaviour
{
				public static AmmoDisplay Instance { get; set; }

		private void Awake()
	{
		AmmoDisplay.Instance = this;
	}

		public void UpdateAmmonCount(int count)
	{
		for (int i = this.LeftAmmos.Length - 1; i >= 0; i--)
		{
			GameObject gameObject = this.LeftAmmos[i];
			gameObject.SetActive(i < count);
		}
	}

		public void UpdateExtraAmmonCount(int count)
	{
		for (int i = this.RightAmmos.Length - 1; i >= 0; i--)
		{
			GameObject gameObject = this.RightAmmos[i];
			gameObject.SetActive(i < count);
		}
	}

		public GameObject[] LeftAmmos;

		public GameObject[] RightAmmos;
}
