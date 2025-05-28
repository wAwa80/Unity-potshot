using System;
using UnityEngine;
using UnityEngine.Events;

public class GDPRMenu : MonoBehaviour
{
		private void Start()
	{
		this.TextLink.onHrefClick.AddListener(new UnityAction<string>(this.OnClickLink));
	}

		private void OnClickLink(string hrefName)
	{
		if (hrefName == "UA")
		{
			Application.OpenURL(Texts.URLUserAgreement);
		}
		else if (hrefName == "PP")
		{
			Application.OpenURL(Texts.URLPrivacyPolicy);
		}
	}

		public void OnClickStart()
	{
		MachbirdSDKHelper.SetPersonalizedAdAgree(true);
		GameMenu.Instance.IsGDPRAgreed = true;
		MachbirdSDKHelper.LogGdprAgree();
		GameMenu.Instance.SetPlayerData();
		base.gameObject.SetActive(false);
	}

		private void Update()
	{
	}

		public void OnClickClose()
	{
		base.gameObject.SetActive(false);
		Application.Quit();
	}

		public LinkImageText TextLink;
}
