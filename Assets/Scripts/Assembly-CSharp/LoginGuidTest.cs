using System;
using UnityEngine;
using UnityEngine.UI;

public class LoginGuidTest : MonoBehaviour
{
		private void Start()
	{
		LoginGuidTest.GuidCallback = (Action)Delegate.Combine(LoginGuidTest.GuidCallback, new Action(this.GuidFinsih));
		EventTriggerListener eventTriggerListener = EventTriggerListener.Get(this.btn_menue1);
		eventTriggerListener.onClick = (EventTriggerListener.VoidDelegate)Delegate.Combine(eventTriggerListener.onClick, new EventTriggerListener.VoidDelegate(delegate(GameObject go)
		{
			if (this.loginPanel != null)
			{
				this.loginPanel.SetActive(true);
				this.GuidStep2();
			}
			else
			{
				Debug.LogError("panel_login is not found!");
			}
		}));
		EventTriggerListener eventTriggerListener2 = EventTriggerListener.Get(this.btn_menue2);
		eventTriggerListener2.onClick = (EventTriggerListener.VoidDelegate)Delegate.Combine(eventTriggerListener2.onClick, new EventTriggerListener.VoidDelegate(delegate(GameObject go)
		{
			this.GuidStep3();
		}));
		this.GuidStep1();
	}

		private void GuidStep1()
	{
		Debug.Log("<color=red>开始第一步引导</color>");
		this.mask = UnityEngine.Object.Instantiate<GameObject>(this.prb_mask);
		this.mask.transform.parent = base.gameObject.transform;
		this.mask.transform.localPosition = Vector3.zero;
		this.mask.transform.localScale = Vector3.one;
		this.mask.transform.SetAsLastSibling();
		this.btn_menue1.AddComponent<Canvas>().overrideSorting = true;
		this.SetMaskAndBtnHiglight(null, this.btn_menue1);
	}

		private void GuidStep2()
	{
		Debug.Log("第二步引导");
		this.SetMaskAndBtnHiglight(this.btn_menue1, this.btn_menue2);
	}

		private void GuidStep3()
	{
		Debug.Log("第三步引导");
		this.SetMaskAndBtnHiglight(this.btn_menue2, this.btn_login);
	}

		private void SetMaskAndBtnHiglight(GameObject lastStep, GameObject nextStep)
	{
		if (lastStep)
		{
			lastStep.GetComponent<Canvas>().overrideSorting = false;
			UnityEngine.Object.Destroy(lastStep.GetComponent<GraphicRaycaster>());
		}
		Canvas component = nextStep.GetComponent<Canvas>();
		if (component)
		{
			component.overrideSorting = true;
		}
		else
		{
			nextStep.AddComponent<Canvas>().overrideSorting = true;
		}
		nextStep.AddComponent<GraphicRaycaster>();
	}

		private void GuidFinsih()
	{
		Debug.Log("<color=red>引导完成</color>");
		UnityEngine.Object.Destroy(this.mask);
	}

		public GameObject prb_mask;

		public GameObject btn_menue1;

		public GameObject btn_menue2;

		public GameObject btn_login;

		private GameObject mask;

		public GameObject loginPanel;

		public static Action GuidCallback;
}
