﻿using System;
using UnityEngine;

namespace UnityStandardAssets.Water
{
		[RequireComponent(typeof(WaterBase))]
	[ExecuteInEditMode]
	public class SpecularLighting : MonoBehaviour
	{
				public void Start()
		{
			this.m_WaterBase = (WaterBase)base.gameObject.GetComponent(typeof(WaterBase));
		}

				public void Update()
		{
			if (!this.m_WaterBase)
			{
				this.m_WaterBase = (WaterBase)base.gameObject.GetComponent(typeof(WaterBase));
			}
			if (this.specularLight && this.m_WaterBase.sharedMaterial)
			{
				this.m_WaterBase.sharedMaterial.SetVector("_WorldLightDir", this.specularLight.transform.forward);
			}
		}

				public Transform specularLight;

				private WaterBase m_WaterBase;
	}
}
