﻿using System;
using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
		[ExecuteInEditMode]
	[AddComponentMenu("Image Effects/Color Adjustments/Grayscale")]
	public class Grayscale : ImageEffectBase
	{
				private void OnRenderImage(RenderTexture source, RenderTexture destination)
		{
			base.material.SetTexture("_RampTex", this.textureRamp);
			base.material.SetFloat("_RampOffset", this.rampOffset);
			Graphics.Blit(source, destination, base.material);
		}

				public Texture textureRamp;

				public float rampOffset;
	}
}
