using System;
using System.Collections;
using UnityEngine;

public class EasyDiamondMove : MonoBehaviour
{
		private void Start()
	{
		EventDispatcher.AddEventListener<Vector3>(Texts.EventSpawnUIDiamonds, new Action<Vector3>(this.Play));
	}

		private void Update()
	{
	}

		private void Play(Vector3 spawnPosition)
	{
		base.StartCoroutine(this.PlayDiamondEffect(spawnPosition));
	}

		private IEnumerator PlayDiamondEffect(Vector3 spawnPosition)
	{
		int count = UnityEngine.Random.Range(8, 12);
		for (int i = 0; i < count; i++)
		{
			GameObject go = UnityEngine.Object.Instantiate<GameObject>(this.DiamondSpawnerPrefab, spawnPosition, Quaternion.identity, base.transform);
			yield return new WaitForSeconds(0.02f);
		}
		yield break;
	}

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener<Vector3>(Texts.EventSpawnUIDiamonds, new Action<Vector3>(this.Play));
	}

		public GameObject DiamondSpawnerPrefab;
}
