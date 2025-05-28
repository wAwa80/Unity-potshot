using System;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Scene Shop 的脚本 ==》挂在点：PanelScene
/// </summary>
public class SceneMenu : MonoBehaviour
{
		private void OnEnable()
	{
		base.transform.localPosition = Vector3.zero;
	}

		private void Start()
	{
		this.selectedIndex = ((!GameMenu.Instance.IsRandomScene) ? (GameDataManager.SceneBGs.IndexOf(GameMenu.Instance.CurrentSceneName) + 1) : 0);
		this.TextProgress.text = GameMenu.Instance.UnlockedSceneIds.Count + "/" + GameDataManager.SceneBGs.Count;
		GameObject original = Resources.Load<GameObject>(Texts.UISceneItemPath);
		GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(original, Vector3.zero, Quaternion.identity);
		gameObject.transform.parent = this.ScrollContent;
		gameObject.transform.localPosition = Vector3.zero;
		gameObject.transform.localScale = Vector3.one;
		gameObject.transform.GetComponent<SceneItem>().Init(0, string.Empty, this);
		for (int i = 0; i < GameDataManager.SceneBGs.Count; i++)
		{          
			string sceneId = GameDataManager.SceneBGs[i];
			GameObject original2 = Resources.Load<GameObject>(Texts.UISceneItemPath);
			GameObject gameObject2 = UnityEngine.Object.Instantiate<GameObject>(original2, Vector3.zero, Quaternion.identity);
			gameObject2.transform.parent = this.ScrollContent;
			gameObject2.transform.localPosition = Vector3.zero;
			gameObject2.transform.localScale = Vector3.one;
			gameObject2.transform.GetComponent<SceneItem>().Init(i + 1, sceneId, this);
		}
		this.UpdateSelectedImg();
		this.ScrollView.gameObject.SetActive(true);
	}

		public void OnSelectedItem(int index)
	{
		if (index == 0)
		{
			GameMenu.Instance.IsRandomScene = true;
			this.selectedIndex = index;
			this.UpdateSelectedImg();
		}
		else
		{
			GameMenu.Instance.IsRandomScene = false;
			string text = GameDataManager.SceneBGs[index - 1];
			if (GameMenu.Instance.UnlockedSceneIds.Contains(text))
			{
				this.selectedIndex = index;
				GameMenu.Instance.CurrentSceneName = text;
				this.UpdateSelectedImg();
				GameMenu.Instance.LoadSceneBG();
			}
			else
			{
				this.OnClickLock();
			}
		}
		this.TextProgress.text = GameMenu.Instance.UnlockedSceneIds.Count + "/" + GameDataManager.SceneBGs.Count;
	}

		private void UpdateSelectedImg()
	{
		for (int i = 0; i < this.ScrollContent.childCount; i++)
		{
			this.ScrollContent.GetChild(i).GetComponent<SceneItem>().ShowSelected(i == this.selectedIndex);
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
		GameMenu.Instance.LoadSceneBG();
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

		public Text TextProgress;

		private int selectedIndex;

		public float ShakeDuration = 0.2f;

		public float ShakeLevel = 3f;

		private bool isShaking;

		private float shakeEnterTime;
}
