using System;
using UnityEngine;
using UnityEngine.UI;

public class StarsController : MonoBehaviour
{
			public int Score
	{
		get
		{
			return this._score + 1;
		}
	}

		private void Awake()
	{
		StarsController.Instance = this;
		this._grayStar = Resources.Load<Sprite>("Texture/star_gray");
		this._yellowStar = Resources.Load<Sprite>("Texture/star_yellow");
		this._stars = base.GetComponentsInChildren<Image>();
	}

		public void Click(int clickIndex)
	{
		if (clickIndex <= this._score)
		{
			for (int i = clickIndex; i < this._score + 1; i++)
			{
				this._stars[i].sprite = this._grayStar;
			}
		}
		else
		{
			for (int j = 0; j <= clickIndex; j++)
			{
				this._stars[j].sprite = this._yellowStar;
			}
		}
		this._score = clickIndex;
		this._stars[clickIndex].sprite = this._yellowStar;
	}

		public static StarsController Instance;

		private Image[] _stars;

		private Sprite _grayStar;

		private Sprite _yellowStar;

		private int _score = -1;
}
