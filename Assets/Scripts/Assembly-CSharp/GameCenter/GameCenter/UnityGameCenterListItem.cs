using System;
using System.Collections;
using GameCenter.Util;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

namespace GameCenter.GameCenter
{
		public class UnityGameCenterListItem : MonoBehaviour
	{
				public void Show(UnityGameCenter.JsonGameData._game game, string clickName, bool bigImage = false)
		{
			this.gameData = game;
			this.Description.text = this.gameData.desc;
			this.clickName = clickName;
			base.StartCoroutine(this._Show((!bigImage) ? this.gameData.icon : this.gameData.image));
		}

				private IEnumerator _Show(string imgUrl)
		{
			UnityWebRequest imageRequest = new UnityWebRequest(imgUrl)
			{
				downloadHandler = new DownloadHandlerTexture(),
				timeout = 600
			};
			yield return imageRequest.Send();
			if (imageRequest.isNetworkError)
			{
				Debug.Log(imageRequest.error);
			}
			else
			{
				this.Icon.texture = ((DownloadHandlerTexture)imageRequest.downloadHandler).texture;
				this.Icon.gameObject.SetActive(true);
			}
			yield break;
		}

				public void OnClickBtn()
		{
			ClickHelper.LogEvent("gc_10002", this.gameData.name, this.gameData.package, null, null, null);
			ClickHelper.LogEvent(this.clickName, null, null, null, null, null);
			GameCenterAndroidUtil.OpenUrl(this.gameData.link);
		}

				public RawImage Icon;

				public Text Description;

				private string clickName;

				private UnityGameCenter.JsonGameData._game gameData;
	}
}
