﻿using System;
using System.Collections.Generic;
using UnityEngine;

public class PathSplineEndlessCS : MonoBehaviour
{
		private void Start()
	{
		for (int i = 0; i < 4; i++)
		{
			this.addRandomTrackPoint();
		}
		this.refreshSpline();
		LeanTween.value(base.gameObject, 0f, 0.3f, 2f).setOnUpdate(delegate(float val)
		{
			this.pushTrackAhead = val;
		});
	}

		private void Update()
	{
		float num = this.trackPts[this.trackPts.Count - 1].z - base.transform.position.z;
		if (num < 200f)
		{
			this.addRandomTrackPoint();
			this.refreshSpline();
		}
		this.track.place(this.car.transform, this.carIter);
		this.carIter += this.carAdd * Time.deltaTime;
		this.track.place(this.trackTrailRenderers.transform, this.carIter + this.pushTrackAhead);
		float axis = Input.GetAxis("Horizontal");
		if (Input.anyKeyDown)
		{
			if (axis < 0f && this.trackIter > 0)
			{
				this.trackIter--;
				this.playSwish();
			}
			else if (axis > 0f && this.trackIter < 2)
			{
				this.trackIter++;
				this.playSwish();
			}
			LeanTween.moveLocalX(this.carInternal, (float)(this.trackIter - 1) * 6f, 0.3f).setEase(LeanTweenType.easeOutBack);
		}
	}

		private GameObject objectQueue(GameObject[] arr, ref int lastIter)
	{
		lastIter = ((lastIter < arr.Length - 1) ? (lastIter + 1) : 0);
		arr[lastIter].transform.localScale = Vector3.one;
		arr[lastIter].transform.rotation = Quaternion.identity;
		return arr[lastIter];
	}

		private void addRandomTrackPoint()
	{
		float num = Mathf.PerlinNoise(0f, this.randomIter);
		this.randomIter += this.randomIterWidth;
		Vector3 vector = new Vector3((num - 0.5f) * 20f, 0f, (float)this.zIter * 40f);
		GameObject gameObject = this.objectQueue(this.cubes, ref this.cubesIter);
		gameObject.transform.position = vector;
		GameObject gameObject2 = this.objectQueue(this.trees, ref this.treesIter);
		float num2 = (this.zIter % 2 != 0) ? 15f : -15f;
		gameObject2.transform.position = new Vector3(vector.x + num2, 0f, (float)this.zIter * 40f);
		LeanTween.rotateAround(gameObject2, Vector3.forward, 0f, 1f).setFrom((this.zIter % 2 != 0) ? -180f : 180f).setEase(LeanTweenType.easeOutBack);
		this.trackPts.Add(vector);
		if (this.trackPts.Count > this.trackMaxItems)
		{
			this.trackPts.RemoveAt(0);
		}
		this.zIter++;
	}

		private void refreshSpline()
	{
		this.track = new LTSpline(this.trackPts.ToArray());
		this.carIter = this.track.ratioAtPoint(this.car.transform.position);
		this.carAdd = 40f / this.track.distance;
	}

		private void playSwish()
	{
		AnimationCurve volume = new AnimationCurve(new Keyframe[]
		{
			new Keyframe(0f, 0.005464481f, 1.83897f, 0f),
			new Keyframe(0.1114856f, 2.281785f, 0f, 0f),
			new Keyframe(0.2482903f, 2.271654f, 0f, 0f),
			new Keyframe(0.3f, 0.01670286f, 0f, 0f)
		});
		AnimationCurve frequency = new AnimationCurve(new Keyframe[]
		{
			new Keyframe(0f, 0.00136725f, 0f, 0f),
			new Keyframe(0.1482391f, 0.005405405f, 0f, 0f),
			new Keyframe(0.2650336f, 0.002480127f, 0f, 0f)
		});
		AudioClip audio = LeanAudio.createAudio(volume, frequency, LeanAudio.options().setVibrato(new Vector3[]
		{
			new Vector3(0.2f, 0.5f, 0f)
		}).setWaveNoise().setWaveNoiseScale(1000f));
		LeanAudio.play(audio);
	}

		public GameObject trackTrailRenderers;

		public GameObject car;

		public GameObject carInternal;

		public GameObject[] cubes;

		private int cubesIter;

		public GameObject[] trees;

		private int treesIter;

		public float randomIterWidth = 0.1f;

		private LTSpline track;

		private List<Vector3> trackPts = new List<Vector3>();

		private int zIter;

		private float carIter;

		private float carAdd;

		private int trackMaxItems = 15;

		private int trackIter = 1;

		private float pushTrackAhead;

		private float randomIter;
}
