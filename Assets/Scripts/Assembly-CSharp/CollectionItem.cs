using System;
using UnityEngine;
using UnityEngine.UI;

public class CollectionItem : MonoBehaviour
{
		private void Start()
	{
	}

		public void Init(bool locked, string iconUrl)
	{
		this.ImgBG.overrideSprite = ((!locked) ? this.SpriteUnlockBG : this.SpriteLockBG);
		this.ImgMask.SetActive(locked);
		this.ImgIcon.overrideSprite = Resources.Load<Sprite>(Texts.UIAssetsPath + iconUrl);
		bool active = false;
		if (!locked && !GameMenu.Instance.RedDotCollectionIds.Contains(iconUrl))
		{
			active = true;
			GameMenu.Instance.RedDotCollectionIds.Add(iconUrl);
		}
		this.ImgNew.SetActive(active);
	}

		private void OnDisable()
	{
		this.ImgNew.SetActive(false);
	}

		private void Update()
	{
	}

		public Image ImgBG;

		public Image ImgIcon;

		public GameObject ImgMask;

		public GameObject ImgNew;

		public Sprite SpriteLockBG;

		public Sprite SpriteUnlockBG;
}
