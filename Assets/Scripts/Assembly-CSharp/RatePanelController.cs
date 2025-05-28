using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Networking;
using UnityEngine.UI;

public class RatePanelController : MonoBehaviour
{
		public static void ShowPanel(Action onLikeButtonClicked, Action onDislikeButtonClicked, Action<string> onSendButtonClicked, Action<RatePanelType> onPanelClose)
	{
		if (RatePanelController._isShowing)
		{
			return;
		}
		RatePanelController._isShowing = true;
		RatePanelController._onLikeButtonClicked = onLikeButtonClicked;
		RatePanelController._onDislikeButtonClicked = onDislikeButtonClicked;
		RatePanelController._onSendButtonClicked = onSendButtonClicked;
		RatePanelController._onPanelClose = onPanelClose;
		GameObject original = Resources.Load("RateCanvas") as GameObject;
		UnityEngine.Object.Instantiate<GameObject>(original);
	}

		private void Awake()
	{
		if (this.font != null)
		{
			foreach (Text text in base.GetComponentsInChildren<Text>())
			{
				text.font = this.font;
			}
		}
	}

		private void Start()
	{
		if (!Debug.isDebugBuild && this.PostUrlType != UrlType.Release)
		{
			throw new Exception("请选择Release版本的URL");
		}
		switch (this.PostUrlType)
		{
		case UrlType.Test:
			this._url = "http://test-support.apuscn.com/help_upload/v1";
			break;
		case UrlType.PreRelease:
			this._url = "http://pre.feedback.api.machbird.com/help_upload/v1";
			break;
		case UrlType.Release:
			this._url = "http://support.machbird.com/help_upload/v1";
			break;
		default:
			this._url = "http://test-support.apuscn.com/help_upload/v1";
			break;
		}
		this._backgroundPanelHeight = this.BackgroundPanel.rect.height;
		this._moveSpeed = this._backgroundPanelHeight * 4f;
		if (this.productID <= 0)
		{
			throw new Exception("请填写ProductID");
		}
		TouchScreenKeyboard.hideInput = true;
		this._currentType = RatePanelType.RatePanel;
		this.CloseButton.onClick.AddListener(new UnityAction(this.CloseButtonClicked));
		this.LikeButton.onClick.AddListener(new UnityAction(this.LikeButtonClicked));
		this.DisLikeButton.onClick.AddListener(new UnityAction(this.DisLikeButtonClicked));
		this.SendButton.onClick.AddListener(new UnityAction(this.SendButtonClicked));
		this.SuggestionText.onEndEdit.AddListener(new UnityAction<string>(this.OnEndEdit));
		this.EmailText.onEndEdit.AddListener(new UnityAction<string>(this.OnEndEdit));
		this.Suggestion.SetActive(false);
		this.RatePanel.SetActive(true);
		base.StartCoroutine(this.MoveIn());
	}

		private void Update()
	{
		if (!this._suggestionMovePanelUp && this.SuggestionText.isFocused /*&& TouchScreenKeyboard.visible*/)
		{
            //HACK
			//base.StartCoroutine(this.MoveUpToInput(this.GetKeyboardHeight() + 670f));
			this._suggestionMovePanelUp = true;
		}
		else if (!this._emailMovePanelUp && this.EmailText.isFocused /*&& TouchScreenKeyboard.visible*/)
		{
            //HACK
			//base.StartCoroutine(this.MoveUpToInput(this.GetKeyboardHeight() + 800f));
			this._emailMovePanelUp = true;
		}
	}

	    //HACK  ???
	//public float GetKeyboardHeight()
	//{
 //       return TouchScreenKeyboard.area.height;
 //   }

        private void OnEndEdit(string arg0)
	{
		this.BackgroundPanel.anchoredPosition = new Vector2(0f, this.height);
		this._suggestionMovePanelUp = false;
		this._emailMovePanelUp = false;
	}

		public void CloseButtonClicked()
	{
		if (RatePanelController._onPanelClose != null)
		{
			RatePanelController._onPanelClose(this._currentType);
		}
		base.StartCoroutine(this.C_Close());
	}

		public void LikeButtonClicked()
	{
		if (RatePanelController._onLikeButtonClicked != null)
		{
			RatePanelController._onLikeButtonClicked();
		}
		this.OpenGoogelePlay("market://details?id=" + Application.identifier);
		base.StartCoroutine(this.C_Close());
	}

		public void DisLikeButtonClicked()
	{
		if (RatePanelController._onDislikeButtonClicked != null)
		{
			RatePanelController._onDislikeButtonClicked();
		}
		base.StartCoroutine(this.C_ShowDislikePanel());
		this._currentType = RatePanelType.Suggestion;
	}

		public void SendButtonClicked()
	{
		string text = this.SuggestionText.text + "\n用户评价星级:" + StarsController.Instance.Score;
		string commonCode = FeedbackParamUtil.Instance.GetCommonCode(this.productID);
		WWWForm wwwform = new WWWForm();
		wwwform.AddField("feedback_id", 0);
		string text2 = this.EmailText.text;
		if (!string.IsNullOrEmpty(text2))
		{
			wwwform.AddField("email", text2);
		}
		wwwform.AddField("contact_way", text2);
		wwwform.AddField("content", text);
		wwwform.AddField("common_code", commonCode);
		DateTime d = new DateTime(1970, 1, 1);
		double totalSeconds = (DateTime.Now - d).TotalSeconds;
		wwwform.AddField("request_time", (int)totalSeconds);
		base.StartCoroutine(this.C_SendPost(this._url, wwwform));
		if (RatePanelController._onSendButtonClicked != null)
		{
			RatePanelController._onSendButtonClicked(text);
		}
	}

		private void OpenGoogelePlay(string link)
	{
		AndroidJavaObject @static = new AndroidJavaClass("com.unity3d.player.UnityPlayer").GetStatic<AndroidJavaObject>("currentActivity");
		AndroidJavaObject androidJavaObject = new AndroidJavaObject("android.content.Intent", new object[]
		{
			"android.intent.action.VIEW"
		});
		AndroidJavaObject androidJavaObject2 = new AndroidJavaClass("android.net.Uri").CallStatic<AndroidJavaObject>("parse", new object[]
		{
			link
		});
		androidJavaObject.Call<AndroidJavaObject>("setData", new object[]
		{
			androidJavaObject2
		});
		androidJavaObject.Call<AndroidJavaObject>("addCategory", new object[]
		{
			"android.intent.category.BROWSABLE"
		});
		if (androidJavaObject.Call<AndroidJavaObject>("resolveActivity", new object[]
		{
			@static.Call<AndroidJavaObject>("getPackageManager", new object[0])
		}) != null)
		{
			@static.Call("startActivity", new object[]
			{
				androidJavaObject
			});
		}
		else
		{
			AndroidJavaObject androidJavaObject3 = new AndroidJavaObject("android.content.Intent", new object[]
			{
				"android.intent.action.VIEW"
			});
			AndroidJavaObject androidJavaObject4 = new AndroidJavaClass("android.net.Uri").CallStatic<AndroidJavaObject>("parse", new object[]
			{
				link.Replace("market://details?id=", "https://play.google.com/store/apps/details?id=")
			});
			androidJavaObject3.Call<AndroidJavaObject>("setData", new object[]
			{
				androidJavaObject4
			});
			@static.Call("startActivity", new object[]
			{
				androidJavaObject3
			});
		}
	}

		private IEnumerator MoveUpToInput(float targetposition)
	{
		yield return new WaitForSeconds(0.5f);
		base.StartCoroutine(this.C_PanelMoveUp(0f, targetposition));
		yield break;
	}

		private IEnumerator MoveIn()
	{
		yield return base.StartCoroutine(this.C_PanelMoveUp(-this._backgroundPanelHeight, this.height));
		yield break;
	}

		private IEnumerator MoveOut()
	{
		yield return base.StartCoroutine(this.C_PanelMoveDown(this.height, -this._backgroundPanelHeight));
		yield break;
	}

		private IEnumerator C_PanelMoveUp(float originPosition, float targetPosition)
	{
		yield return this.C_PanelMoveUp(originPosition, targetPosition, this._moveSpeed);
		yield break;
	}

		private IEnumerator C_PanelMoveUp(float originPosition, float targetPosition, float speed)
	{
		float currentPositionY = originPosition;
		while (currentPositionY < targetPosition)
		{
			this.BackgroundPanel.anchoredPosition = new Vector2(0f, currentPositionY);
			float delta = speed * Time.fixedDeltaTime;
			currentPositionY += delta;
			yield return new WaitForFixedUpdate();
		}
		this.BackgroundPanel.anchoredPosition = new Vector2(0f, targetPosition);
		yield break;
	}

		private IEnumerator C_PanelMoveDown(float originPosition, float targetPosition)
	{
		yield return this.C_PanelMoveDown(originPosition, targetPosition, this._moveSpeed);
		yield break;
	}

		private IEnumerator C_PanelMoveDown(float originPosition, float targetPosition, float speed)
	{
		float currentPositionY = originPosition;
		while (currentPositionY > targetPosition)
		{
			this.BackgroundPanel.anchoredPosition = new Vector2(0f, currentPositionY);
			float delta = this._moveSpeed * Time.fixedDeltaTime;
			currentPositionY -= delta;
			yield return new WaitForFixedUpdate();
		}
		this.BackgroundPanel.anchoredPosition = new Vector2(0f, targetPosition);
		yield break;
	}

		private IEnumerator C_Close()
	{
		yield return this.MoveOut();
		RatePanelController._isShowing = false;
		UnityEngine.Object.Destroy(base.gameObject);
		yield break;
	}

		private IEnumerator C_ShowDislikePanel()
	{
		yield return this.MoveOut();
		this.RatePanel.SetActive(false);
		this.Suggestion.SetActive(true);
		yield return this.MoveIn();
		yield break;
	}

		private IEnumerator C_SendPost(string url, WWWForm form)
	{
		using (UnityWebRequest request = UnityWebRequest.Post(url, form))
		{
			yield return request.Send();
			if (request.isNetworkError)
			{
				Debug.Log(request.error);
			}
			else
			{
				string text = request.downloadHandler.text;
				FeedbackResult feedbackResult = JsonUtility.FromJson<FeedbackResult>(text);
				Debug.Log((!(feedbackResult.error_code == "0")) ? feedbackResult.error_msg : "反馈成功");
			}
		}
		yield return this.C_Close();
		yield break;
	}

		private static bool _isShowing;

		private static Action<RatePanelType> _onPanelClose;

		private static Action _onLikeButtonClicked;

		private static Action _onDislikeButtonClicked;

		private static Action<string> _onSendButtonClicked;

		private RatePanelType _currentType;

		private float _backgroundPanelHeight;

		private float _moveSpeed;

		private string _url;

		[Header("产品Google Play的PID，一定要填写")]
	public int productID;

		[Header("上传接口类型，请在正式发布的时候修改为Release")]
	public UrlType PostUrlType;

		[Header("如需替换字体请拖入此处")]
	public Font font;

		[Header("面板最终距底部的距离，默认是0")]
	public float height;

		[Space(10f)]
	public GameObject RatePanel;

		public GameObject Suggestion;

		public InputField SuggestionText;

		public InputField EmailText;

		public Button CloseButton;

		public Button LikeButton;

		public Button DisLikeButton;

		public Button SendButton;

		public RectTransform BackgroundPanel;

		private bool _suggestionMovePanelUp;

		private bool _emailMovePanelUp;
}
