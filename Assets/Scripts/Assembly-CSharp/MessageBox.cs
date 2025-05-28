using System;
using UnityEngine;
using UnityEngine.UI;

public class MessageBox : MonoBehaviour
{
		private void Awake()
	{
		//EventDispatcher.AddEventListener<bool, MessageBoxModel>(Texts.EventShowMessageBox, new Action<bool, MessageBoxModel>(this.Show));
	}

		private void Start()
	{
	}

		private void Update()
	{
	}

		private void Show(bool show, MessageBoxModel model)
	{
		this.MessageBoxPanel.SetActive(false);
		if (false)
		{
			//this.TextContent.text = model.Content;
		}
	}

		public void OnClickClose()
	{
		this.MessageBoxPanel.SetActive(false);
	}

		private void OnDestroy()
	{
		EventDispatcher.RemoveEventListener<bool, MessageBoxModel>(Texts.EventShowMessageBox, new Action<bool, MessageBoxModel>(this.Show));
	}

		public GameObject MessageBoxPanel;

		public Text TextContent;
}
