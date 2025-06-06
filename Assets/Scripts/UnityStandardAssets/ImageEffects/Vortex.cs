﻿using System;
using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
		[ExecuteInEditMode]
	[AddComponentMenu("Image Effects/Displacement/Vortex")]
	public class Vortex : ImageEffectBase
	{
				private void OnRenderImage(RenderTexture source, RenderTexture destination)
		{
			ImageEffects.RenderDistortion(base.material, source, destination, this.angle, this.center, this.radius);
		}

				public Vector2 radius = new Vector2(0.4f, 0.4f);

				public float angle = 50f;

				public Vector2 center = new Vector2(0.5f, 0.5f);
	}
}
