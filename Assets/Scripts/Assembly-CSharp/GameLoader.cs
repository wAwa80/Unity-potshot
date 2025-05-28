using System;
using UnityEngine;

public class GameLoader : MonoBehaviour
{
		private void Awake()
	{
		GameLauncher.Instance.Awake(this.InitObjects);
	}

		private void Start()
	{
		GameLauncher.Instance.Start();
	}

		private void OnApplicationPause(bool isPaused)
	{
		GameLauncher.Instance.OnApplicationPause(isPaused);
	}

		private void OnApplicationQuit()
	{
		Debug.Log("Application ending after " + Time.time + " seconds");
		GameLauncher.Instance.OnApplicationQuit();
	}

		public GameObject[] InitObjects;
}
