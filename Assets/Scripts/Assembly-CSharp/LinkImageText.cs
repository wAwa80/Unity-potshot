using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[AddComponentMenu("UI/LinkImageText", 10)]
public class LinkImageText : Text, IPointerClickHandler, IEventSystemHandler
{
				public LinkImageText.HrefClickEvent onHrefClick
	{
		get
		{
			return this.m_OnHrefClick;
		}
		set
		{
			this.m_OnHrefClick = value;
		}
	}

		public override void SetVerticesDirty()
	{
		base.SetVerticesDirty();
		this.UpdateQuadImage();
	}

		protected void UpdateQuadImage()
	{
		this.m_OutputText = this.GetOutputText(this.text);
		this.m_ImagesVertexIndex.Clear();
		IEnumerator enumerator = LinkImageText.s_ImageRegex.Matches(this.m_OutputText).GetEnumerator();
		try
		{
			while (enumerator.MoveNext())
			{
				object obj = enumerator.Current;
				Match match = (Match)obj;
				int index = match.Index;
				int item = index * 4 + 3;
				this.m_ImagesVertexIndex.Add(item);
				this.m_ImagesPool.RemoveAll((Image image) => image == null);
				if (this.m_ImagesPool.Count == 0)
				{
					base.GetComponentsInChildren<Image>(this.m_ImagesPool);
				}
				if (this.m_ImagesVertexIndex.Count > this.m_ImagesPool.Count)
				{
					GameObject gameObject = DefaultControls.CreateImage(default(DefaultControls.Resources));
					gameObject.layer = base.gameObject.layer;
					RectTransform rectTransform = gameObject.transform as RectTransform;
					if (rectTransform)
					{
						rectTransform.SetParent(base.rectTransform);
						rectTransform.localPosition = Vector3.zero;
						rectTransform.localRotation = Quaternion.identity;
						rectTransform.localScale = Vector3.one;
					}
					this.m_ImagesPool.Add(gameObject.GetComponent<Image>());
				}
				string value = match.Groups[1].Value;
				float num = float.Parse(match.Groups[2].Value);
				Image image2 = this.m_ImagesPool[this.m_ImagesVertexIndex.Count - 1];
				if (image2.sprite == null || image2.sprite.name != value)
				{
					image2.sprite = ((LinkImageText.funLoadSprite == null) ? Resources.Load<Sprite>(value) : LinkImageText.funLoadSprite(value));
				}
				image2.rectTransform.sizeDelta = new Vector2(num, num);
				image2.enabled = true;
			}
		}
		finally
		{
			IDisposable disposable;
			if ((disposable = (enumerator as IDisposable)) != null)
			{
				disposable.Dispose();
			}
		}
		for (int i = this.m_ImagesVertexIndex.Count; i < this.m_ImagesPool.Count; i++)
		{
			if (this.m_ImagesPool[i])
			{
				this.m_ImagesPool[i].enabled = false;
			}
		}
	}

		protected override void OnPopulateMesh(VertexHelper toFill)
	{
		string text = this.m_Text;
		this.m_Text = this.m_OutputText;
		base.OnPopulateMesh(toFill);
		this.m_Text = text;
		UIVertex vertex = default(UIVertex);
		for (int i = 0; i < this.m_ImagesVertexIndex.Count; i++)
		{
			int num = this.m_ImagesVertexIndex[i];
			RectTransform rectTransform = this.m_ImagesPool[i].rectTransform;
			Vector2 sizeDelta = rectTransform.sizeDelta;
			if (num < toFill.currentVertCount)
			{
				toFill.PopulateUIVertex(ref vertex, num);
				rectTransform.anchoredPosition = new Vector2(vertex.position.x + sizeDelta.x / 2f, vertex.position.y + sizeDelta.y / 2f);
				toFill.PopulateUIVertex(ref vertex, num - 3);
				Vector3 position = vertex.position;
				int j = num;
				int num2 = num - 3;
				while (j > num2)
				{
					toFill.PopulateUIVertex(ref vertex, num);
					vertex.position = position;
					toFill.SetUIVertex(vertex, j);
					j--;
				}
			}
		}
		if (this.m_ImagesVertexIndex.Count != 0)
		{
			this.m_ImagesVertexIndex.Clear();
		}
		foreach (LinkImageText.HrefInfo hrefInfo in this.m_HrefInfos)
		{
			hrefInfo.boxes.Clear();
			if (hrefInfo.startIndex < toFill.currentVertCount)
			{
				toFill.PopulateUIVertex(ref vertex, hrefInfo.startIndex);
				Vector3 position2 = vertex.position;
				Bounds bounds = new Bounds(position2, Vector3.zero);
				int k = hrefInfo.startIndex;
				int endIndex = hrefInfo.endIndex;
				while (k < endIndex)
				{
					if (k >= toFill.currentVertCount)
					{
						break;
					}
					toFill.PopulateUIVertex(ref vertex, k);
					position2 = vertex.position;
					if (position2.x < bounds.min.x)
					{
						hrefInfo.boxes.Add(new Rect(bounds.min, bounds.size));
						bounds = new Bounds(position2, Vector3.zero);
					}
					else
					{
						bounds.Encapsulate(position2);
					}
					k++;
				}
				hrefInfo.boxes.Add(new Rect(bounds.min, bounds.size));
			}
		}
	}

		protected virtual string GetOutputText(string outputText)
	{
		LinkImageText.s_TextBuilder.Length = 0;
		this.m_HrefInfos.Clear();
		int num = 0;
		IEnumerator enumerator = LinkImageText.s_HrefRegex.Matches(outputText).GetEnumerator();
		try
		{
			while (enumerator.MoveNext())
			{
				object obj = enumerator.Current;
				Match match = (Match)obj;
				LinkImageText.s_TextBuilder.Append(outputText.Substring(num, match.Index - num));
				LinkImageText.s_TextBuilder.Append("<color=#5696FF>");
				Group group = match.Groups[1];
				LinkImageText.HrefInfo item = new LinkImageText.HrefInfo
				{
					startIndex = LinkImageText.s_TextBuilder.Length * 4,
					endIndex = (LinkImageText.s_TextBuilder.Length + match.Groups[2].Length - 1) * 4 + 3,
					name = group.Value
				};
				this.m_HrefInfos.Add(item);
				LinkImageText.s_TextBuilder.Append(match.Groups[2].Value);
				LinkImageText.s_TextBuilder.Append("</color>");
				num = match.Index + match.Length;
			}
		}
		finally
		{
			IDisposable disposable;
			if ((disposable = (enumerator as IDisposable)) != null)
			{
				disposable.Dispose();
			}
		}
		LinkImageText.s_TextBuilder.Append(outputText.Substring(num, outputText.Length - num));
		return LinkImageText.s_TextBuilder.ToString();
	}

		public void OnPointerClick(PointerEventData eventData)
	{
		Vector2 point;
		RectTransformUtility.ScreenPointToLocalPointInRectangle(base.rectTransform, eventData.position, eventData.pressEventCamera, out point);
		foreach (LinkImageText.HrefInfo hrefInfo in this.m_HrefInfos)
		{
			List<Rect> boxes = hrefInfo.boxes;
			for (int i = 0; i < boxes.Count; i++)
			{
				if (boxes[i].Contains(point))
				{
					this.m_OnHrefClick.Invoke(hrefInfo.name);
					return;
				}
			}
		}
	}

		private string m_OutputText;

		protected readonly List<Image> m_ImagesPool = new List<Image>();

		private readonly List<int> m_ImagesVertexIndex = new List<int>();

		private readonly List<LinkImageText.HrefInfo> m_HrefInfos = new List<LinkImageText.HrefInfo>();

		protected static readonly StringBuilder s_TextBuilder = new StringBuilder();

		[SerializeField]
	private LinkImageText.HrefClickEvent m_OnHrefClick = new LinkImageText.HrefClickEvent();

		private static readonly Regex s_ImageRegex = new Regex("<quad name=(.+?) size=(\\d*\\.?\\d+%?) width=(\\d*\\.?\\d+%?) />", RegexOptions.Singleline);

		private static readonly Regex s_HrefRegex = new Regex("<a href=([^>\\n\\s]+)>(.*?)(</a>)", RegexOptions.Singleline);

		public static Func<string, Sprite> funLoadSprite;

		[Serializable]
	public class HrefClickEvent : UnityEvent<string>
	{
	}

		private class HrefInfo
	{
				public int startIndex;

				public int endIndex;

				public string name;

				public readonly List<Rect> boxes = new List<Rect>();
	}
}
