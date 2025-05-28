using System;
using UnityEngine;
using UnityEngine.UI;

namespace a
{
		public class ImageLoad : MonoBehaviour
	{
				private void Awake()
		{
			this.LoadSprite();
		}

				private void LoadSprite()
		{
			Sprite sprite;
			if ((sprite = Resources.Load<Sprite>("Texture/CloseButton_Normal")) != null)
			{
				this.closeButton.image.sprite = sprite;
			}
			Sprite pressedSprite;
			if ((pressedSprite = Resources.Load<Sprite>("Texture/CloseButton_Clicked")) != null)
			{
				this.closeButton.spriteState = new SpriteState
				{
					pressedSprite = pressedSprite
				};
			}
			Sprite sprite2;
			if ((sprite2 = Resources.Load<Sprite>("Texture/LikeButton_Normal")) != null)
			{
				this.likeButton.image.sprite = sprite2;
			}
			Sprite pressedSprite2;
			if ((pressedSprite2 = Resources.Load<Sprite>("Texture/LikeButton_Clicked")) != null)
			{
				this.likeButton.spriteState = new SpriteState
				{
					pressedSprite = pressedSprite2
				};
			}
			Sprite sprite3;
			if ((sprite3 = Resources.Load<Sprite>("Texture/DisLikeButton_Normal")) != null)
			{
				this.likeButton.image.sprite = sprite3;
			}
			Sprite pressedSprite3;
			if ((pressedSprite3 = Resources.Load<Sprite>("Texture/DisLikeButton_Clicked")) != null)
			{
				this.likeButton.spriteState = new SpriteState
				{
					pressedSprite = pressedSprite3
				};
			}
			Sprite sprite4;
			if ((sprite4 = Resources.Load<Sprite>("Texture/LikeFace")) != null)
			{
				this.likeFace.sprite = sprite4;
			}
			Sprite sprite5;
			if ((sprite5 = Resources.Load<Sprite>("Texture/DisLikeFace")) != null)
			{
				this.disLikeFace.sprite = sprite5;
			}
			Sprite sprite6;
			if ((sprite6 = Resources.Load<Sprite>("Texture/External_BackGround")) != null)
			{
				this.external_BG_Image.sprite = sprite6;
			}
			Sprite sprite7;
			if ((sprite7 = Resources.Load<Sprite>("Texture/Internal_Background")) != null)
			{
				this.internal_BG_Image.sprite = sprite7;
			}
			Sprite sprite8;
			if ((sprite8 = Resources.Load<Sprite>("Texture/Input_Background")) != null)
			{
				this.mail_BG_Image.sprite = sprite8;
				this.suggestion_BG_Image.sprite = sprite8;
			}
			Sprite sprite9;
			if ((sprite9 = Resources.Load<Sprite>("Texture/Tiltle_Background")) != null)
			{
				this.title_BG_Image.sprite = sprite9;
			}
		}

				public Button closeButton;

				public Button likeButton;

				public Button dislikeButton;

				public Image likeFace;

				public Image disLikeFace;

				public Image external_BG_Image;

				public Image internal_BG_Image;

				public Image title_BG_Image;

				public Image mail_BG_Image;

				public Image suggestion_BG_Image;
	}
}
