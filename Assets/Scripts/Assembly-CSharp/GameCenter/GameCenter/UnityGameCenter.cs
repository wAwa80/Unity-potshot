using System;
using System.Collections;
using System.Collections.Generic;
using GameCenter.Util;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

namespace GameCenter.GameCenter
{
		public class UnityGameCenter : MonoBehaviour
	{
				private void ConvertPackageToGameId()
		{
			string identifier = Application.identifier;
			string[] array = identifier.Split(new char[]
				{
					'.',
					'_'
				});
			if (array.Length < 1)
			{
				return;
			}
			this._gameId = array[0];
			for (int i = 1; i < array.Length; i++)
			{
				string text = array[i];
				if (text.Length > 1)
				{
					this._gameId = this._gameId + char.ToUpper(text[0]) + text.Substring(1);
				}
			}
		}

				private void Start()
		{
			if (UnityGameCenter._recommendList == null)
			{
				UnityGameCenter._recommendList = new List<GameObject>();
			}
		}

				private void OnEnable()
		{
			this.listView.normalizedPosition = new Vector2(0f, 1f);
			this.StatusText.gameObject.SetActive(true);
			ClickHelper.LogEvent("gc_10001", ClickHelper.ClickType.GameCenter, null, null, null, null, null);
			this.ConvertPackageToGameId();
			this.RefreshData();
		}

				private void OnDisable()
		{
			foreach (GameObject gameObject in UnityGameCenter._recommendList)
			{
				gameObject.SetActive(false);
			}
			this.GameCenterObject.SetActive(false);
		}

				private void RefreshData()
		{
			WWWForm wwwform = new WWWForm();
			wwwform.AddField("clientId", GameCenterAndroidUtil.GetCId());
			base.StartCoroutine(this.SendPost("https://game-center.machbird.com/v1/" + this._gameId + "/recommendation/list", wwwform));
		}

				private IEnumerator SendPost(string url, WWWForm wForm)
		{
			UnityWebRequest postData = UnityWebRequest.Post(url, wForm);
			yield return postData.Send();
			if (postData.isNetworkError)
			{
				Debug.Log(postData.error);
				this.StatusText.text = "Network Error";
			}
			else
			{
				Debug.Log(postData.downloadHandler.text);
				if (this.AnalysisJsonGameData(postData.downloadHandler.text))
				{
					this.StatusText.gameObject.SetActive(false);
				}
				else
				{
					this.StatusText.text = "Some Error Occurred";
				}
			}
			yield break;
		}

				private bool AnalysisJsonGameData(string json)
		{
			UnityGameCenter.JsonGameData jsonGameData = JsonUtility.FromJson<UnityGameCenter.JsonGameData>(json);
			if (jsonGameData.error_code == 0)
			{
				ClickHelper.LogEvent("gc_10004", null, null, null, null, null);
				this.GameCenterObject.SetActive(true);
				for (int i = 0; i < jsonGameData.data.Count; i++)
				{
					UnityGameCenter.JsonGameData._data data = jsonGameData.data[i];
					if (data.game.package == Application.identifier)
					{
						jsonGameData.data.Remove(data);
					}
				}
				for (int j = 0; j < jsonGameData.data.Count; j++)
				{
					UnityGameCenter.JsonGameData._data data2 = jsonGameData.data[j];
					if (j == 0)
					{
						this.HotRecommend.Show(data2.game, "gc_10003", true);
					}
					else
					{
						GameObject gameObject;
						if (UnityGameCenter._recommendList.Count >= j)
						{
							gameObject = UnityGameCenter._recommendList[j - 1];
							gameObject.SetActive(true);
						}
						else
						{
							gameObject = UnityEngine.Object.Instantiate<GameObject>(this.NewItemInstance, this.ListContent);
							UnityGameCenter._recommendList.Add(gameObject);
						}
						gameObject.name = "item" + j;
						UnityGameCenterListItem component = gameObject.GetComponent<UnityGameCenterListItem>();
						component.Show(data2.game, "gc_1001" + j, false);
					}
				}
				return true;
			}
			return false;
		}

				public GameObject NewItemInstance;

				public UnityGameCenterListItem HotRecommend;

				public RectTransform ListContent;

				public Text StatusText;

				public GameObject GameCenterObject;

				public ScrollRect listView;

				private static List<GameObject> _recommendList;

				private const string GameCenterBaseUrl = "https://game-center.machbird.com/v1/";

				private const string UrlSuf = "/recommendation/list";

				private string _gameId = "com";

				[Serializable]
		public class JsonGameData
		{
						public string traceId;

						public int error_code;

						public string error_message;

						public List<UnityGameCenter.JsonGameData._data> data;

						[Serializable]
			public class _game
			{
								public string name;

								public string package;

								public string link;

								public string appid;

								public int state;

								public string _id;

								public string icon;

								public string desc;

								public string image;
			}

						[Serializable]
			public class _data
			{
								public string _id;

								public string type;

								public UnityGameCenter.JsonGameData._game game;

								public int module;

								public int order;

								public int state;

								public string link;

								public string channel;
			}
		}
	}
}
