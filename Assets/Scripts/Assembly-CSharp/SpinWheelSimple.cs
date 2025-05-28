using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class SpinWheelSimple : MonoBehaviour
{
		private void Awake()
	{
        // ToDO arrow 箭头    dot 圆点  border 边界 chunk 大块
		this.chunkAllSp = Resources.LoadAll<Sprite>("Skins/Chunk");
		this.dotAllSp = Resources.LoadAll<Sprite>("Skins/Dot");
		this.circleBorderAllSp = Resources.LoadAll<Sprite>("Skins/Border");
		this.arrowAllSp = Resources.LoadAll<Sprite>("Skins/BgArrow");
		int theme = (int)SpinWheelSetup.Instance.theme;
		this.chunkSp[0] = this.chunkAllSp[theme];
		this.pointSp[0] = this.dotAllSp[theme];
		this.circleBorderSp = this.circleBorderAllSp[theme];
		this.arrowBgSp = this.arrowAllSp[theme];
		this.SetupWheel();
	}

		private void OnEnable()
	{
		this.WheelAnimation(true);
	}

		private void SetWheelTheme(int index)
	{
		this.chunkSp[0] = this.chunkAllSp[index];
		this.pointSp[0] = this.dotAllSp[index];
		this.circleBorderSp = this.circleBorderAllSp[index];
		this.arrowBgSp = this.arrowAllSp[index];
		this.circleBorderSpRend.overrideSprite = this.circleBorderSp;
		this.arrowBgSpRend.overrideSprite = this.arrowBgSp;
	}

		private void SetupWheel()
	{
		this.anglePerItem = (float)(360 / SpinWheelSetup.Instance.rewarItem.Length);
		this.chunkSlices = this.chunksParent.GetComponentsInChildren<ChunkSlice>();
		for (int i = 0; i < 8; i++)
		{
			this.chunkSlices[i].transform.localEulerAngles = new Vector3(0f, 0f, (float)i * -this.anglePerItem);
		}
		this.circleBorderSpRend.overrideSprite = this.circleBorderSp;
		this.arrowBgSpRend.overrideSprite = this.arrowBgSp;
	}

		public void WheelAnimation(bool playAnim)
	{
		foreach (ChunkSlice chunkSlice in this.chunkSlices)
		{
			chunkSlice.AnimatePoints(playAnim);
			chunkSlice.spRend.overrideSprite = this.chunkSp[0];
		}
		if (playAnim)
		{
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(this.chunkSp[0], this.chunkSp[1]));
		}
		else
		{
			if (this.anim1 != null)
			{
				base.StopCoroutine(this.anim1);
			}
			if (this.anim2 != null)
			{
				base.StopCoroutine(this.anim2);
			}
			if (this.anim3 != null)
			{
				base.StopCoroutine(this.anim3);
			}
		}
	}

		private IEnumerator PlayChunkPatternRoutine(int index)
	{
		if (index > 7)
		{
			this.count = 0;
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(this.chunkSp[0], this.chunkSp[1]));
		}
		else
		{
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[1];
			yield return new WaitForSeconds(0.1f);
			this.chunkSlices[index].spRend.overrideSprite = this.chunkSp[0];
			yield return new WaitForSeconds(0f);
			this.anim2 = base.StartCoroutine(this.PlayChunkPatternRoutine(index + 1));
		}
		yield break;
	}

		private IEnumerator PlayLoopRoutine(Sprite sp1, Sprite sp2)
	{
		yield return new WaitForSeconds(0.2f);
		this.count++;
		for (int i = 0; i < this.chunkSlices.Length; i++)
		{
			this.chunkSlices[i].spRend.overrideSprite = ((i % 2 != 0) ? sp2 : sp1);
		}
		if (this.count < UnityEngine.Random.Range(10, 25))
		{
			this.anim1 = base.StartCoroutine(this.PlayLoopRoutine(sp2, sp1));
		}
		else
		{
			this.anim2 = base.StartCoroutine(this.PlayChunkPatternRoutine(0));
		}
		yield break;
	}

		public Image circleBorderSpRend;

		public Image arrowBgSpRend;

		public Transform chunksParent;

		public Sprite[] pointSp;

		public Sprite[] chunkSp;

		public Sprite circleBorderSp;

		public Sprite arrowBgSp;

		private float anglePerItem;

		private ChunkSlice[] chunkSlices;

		private Sprite[] chunkAllSp;

		private Sprite[] dotAllSp;

		private Sprite[] circleBorderAllSp;

		private Sprite[] arrowAllSp;

		private Coroutine anim1;

		private Coroutine anim2;

		private Coroutine anim3;

		private int count;
}
