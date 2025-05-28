using System;
using System.Collections.Generic;
using UnityEngine;

public class CollectionBox : MonoBehaviour
{
		private void Start()
	{
	}

		public void Init(CollectionInfo info)
	{
		this.collectionInfo = info;
		for (int i = 0; i < this.collectionInfo.Levels.Length; i++)
		{
			string text = this.collectionInfo.Levels[i];
			bool locked = true;
			int num;
			if (GameMenu.Instance.PrefabBreakTimesDic.TryGetValue(text + Texts.String_PrefabSuffix, out num))
			{
				locked = false;
				this.unlockedCount++;
			}
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.ItemPrefab, Vector3.zero, Quaternion.identity, this.ItemContent);
			CollectionItem component = gameObject.GetComponent<CollectionItem>();
			component.Init(locked, text);
		}
		for (int j = 0; j < this.collectionInfo.Rewards.Length; j++)
		{
			bool rewarded = false;
			List<int> list;
			if (GameMenu.Instance.CollectionRewardedIndexsDic.TryGetValue(info.Id, out list))
			{
				if (list.Contains(j))
				{
					rewarded = true;
				}
			}
			else
			{
				GameMenu.Instance.CollectionRewardedIndexsDic[info.Id] = new List<int>();
			}
			CollectionRewardInfo rewardInfo = this.collectionInfo.Rewards[j];
			GameObject gameObject2 = UnityEngine.Object.Instantiate<GameObject>(this.RewardPrefab, Vector3.zero, Quaternion.identity, this.RewardContent);
			CollectionRewardButton component2 = gameObject2.GetComponent<CollectionRewardButton>();
			component2.Init(info.Id, rewarded, this.unlockedCount, rewardInfo, j);
		}
	}

		private void Update()
	{
	}

		public Transform ItemContent;

		public Transform RewardContent;

		public GameObject ItemPrefab;

		public GameObject RewardPrefab;

		private CollectionInfo collectionInfo;

		private int unlockedCount;
}
