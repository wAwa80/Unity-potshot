﻿using System;
using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
		[RequireComponent(typeof(Camera))]
	[AddComponentMenu("")]
	public class ImageEffectBase : MonoBehaviour
	{
				protected virtual void Start()
		{
			if (!SystemInfo.supportsImageEffects)
			{
				base.enabled = false;
				return;
			}
			if (!this.shader || !this.shader.isSupported)
			{
				base.enabled = false;
			}
		}

						protected Material material
		{
			get
			{
				if (this.m_Material == null)
				{
					this.m_Material = new Material(this.shader);
					this.m_Material.hideFlags = HideFlags.HideAndDontSave;
				}
				return this.m_Material;
			}
		}

				protected virtual void OnDisable()
		{
			if (this.m_Material)
			{
				UnityEngine.Object.DestroyImmediate(this.m_Material);
			}
		}

				public Shader shader;

				private Material m_Material;
	}
}
