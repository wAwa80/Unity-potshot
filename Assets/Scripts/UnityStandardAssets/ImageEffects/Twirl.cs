﻿using System;
using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
		[ExecuteInEditMode]
	[AddComponentMenu("Image Effects/Displacement/Twirl")]
	public class Twirl : ImageEffectBase
	{
				private void OnRenderImage(RenderTexture source, RenderTexture destination)
		{
			ImageEffects.RenderDistortion(base.material, source, destination, this.angle, this.center, this.radius);
		}

				public Vector2 radius = new Vector2(0.3f, 0.3f);

				public float angle = 50f;

				public Vector2 center = new Vector2(0.5f, 0.5f);
	}
}
