using System;
using UnityEngine;

public class SuperFireMenu : MonoBehaviour
{
		private void OnEnable()
	{
		base.transform.localPosition = Vector3.zero;
	}

		private void Start()
	{
		this.selectedIndex = GameDataManager.SuperFireIds.IndexOf(GameMenu.Instance.CurrentSuperFireId);
		for (int i = 0; i < GameDataManager.SuperFireIds.Count; i++)
		{
			string superFireId = GameDataManager.SuperFireIds[i];
			GameObject original = Resources.Load<GameObject>(Texts.UISuperFireItemPath);
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(original, Vector3.zero, Quaternion.identity);
			gameObject.transform.parent = this.ScrollContent;
			gameObject.transform.localPosition = Vector3.zero;
			gameObject.transform.localScale = Vector3.one;
			gameObject.transform.GetComponent<SuperFireItem>().Init(i, superFireId, this);
		}
		this.UpdateSelectedImg();
		this.ScrollView.gameObject.SetActive(true);
	}

		public void OnSelectedItem(int index)
	{
		string text = GameDataManager.SuperFireIds[index];
		if (GameMenu.Instance.UnlockedSuperFireIds.Contains(text))
		{
			this.selectedIndex = index;
			GameMenu.Instance.CurrentSuperFireId = text;
			GameMenu.Instance.CurrentSuperFireInfo = GameDataManager.SuperFireInfoDatas[index];
			this.UpdateSelectedImg();
		}
		else
		{
			this.OnClickLock();
		}
	}

		private void UpdateSelectedImg()
	{
		for (int i = 0; i < this.ScrollContent.childCount; i++)
		{
			this.ScrollContent.GetChild(i).GetComponent<SuperFireItem>().ShowSelected(i == this.selectedIndex);
		}
	}

		private void Update()
	{
		if (this.isShaking)
		{
			base.transform.localPosition = UnityEngine.Random.insideUnitSphere * this.ShakeLevel;
			if (Time.time - this.shakeEnterTime >= this.ShakeDuration)
			{
				this.isShaking = false;
				base.transform.localPosition = Vector3.zero;
			}
		}
	}

		public void OnClickLock()
	{
		this.isShaking = true;
		this.shakeEnterTime = Time.time;
	}

		public void OnClickBtnBack()
	{
		GameMenu.Instance.LoadSuperFireIcon();
		base.gameObject.SetActive(false);
		GameMenu.Instance.UpdateUnlockInfo();
		GameMenu.Instance.SetPlayerData();
		GameMenu.Instance.menuPanel.SetActive(true);
        //hack 关2
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");
        Analytics.Instance.SendMessageByID(AllDataInGameTest.zhujiemian_renci, 1 + "");
        MachbirdSDKHelper.PlayVideo();
	}

		private void OnDestroy()
	{
	}

		public GameObject ScrollView;

		public Transform ScrollContent;

		private int selectedIndex;

		public float ShakeDuration = 0.2f;

		public float ShakeLevel = 10f;

		private bool isShaking;

		private float shakeEnterTime;
}
