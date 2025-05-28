using System;
using UnityEngine;

public class CollectionMenu : MonoBehaviour
{
		private void Start()
	{
		for (int i = 0; i < GameDataManager.CollectionInfoDatas.Count; i++)
		{
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.CollectionBoxPrefab, Vector3.zero, Quaternion.identity, this.MainContent);
			CollectionBox component = gameObject.GetComponent<CollectionBox>();
			component.Init(GameDataManager.CollectionInfoDatas[i]);
		}
		UnityEngine.Object.Instantiate<GameObject>(this.CollectionContinuePrefab, Vector3.zero, Quaternion.identity, this.MainContent);
	}

		private void Update()
	{
	}

		public void OnClickBtnBack()
	{
		base.gameObject.SetActive(false);
		GameMenu.Instance.UpdateUnlockInfo();
		GameMenu.Instance.SetPlayerData();
		GameMenu.Instance.menuPanel.SetActive(true);
        //hack 关2
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");
        Analytics.Instance.SendMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");
        MachbirdSDKHelper.PlayVideo();
	}

		public Transform MainContent;

		public GameObject CollectionBoxPrefab;

		public GameObject CollectionContinuePrefab;
}
