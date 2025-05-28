using System;
using Game.Walker;
using UnityEngine;

/// <summary>
/// 炮的prefab 脚本
///              包括：     1.将炮加载到底座的方法--Init
/// </summary>
public class AvatarPlatformItem : MonoBehaviour
{
	private void Start()
	{
	}

    /// <summary>
    /// 将炮加载到底座上
    /// </summary>
    /// <param name="avatarId">炮在resources中的路径 </param>
    /// <param name="i"> 第 i  个炮</param>
	public void Init(string avatarId, int i)
	{
       
	        this.platformAnimation = this.PlarformTransform.GetComponent<Animation>();
	        GameObject original = Resources.Load<GameObject>(Texts.AvatarPath + avatarId);
	        this.avatar = UnityEngine.Object.Instantiate<GameObject>(original, Vector3.zero, Quaternion.identity);
	        this.avatar.transform.parent = this.AvatarPoint;
	        this.avatar.SetLayer(GameHelper.UILayer, true);
	        this.avatar.transform.localPosition = Vector3.zero;
	        this.avatar.transform.localEulerAngles = Vector3.zero;
            this.avatar.transform.localScale = new Vector3(0.4f, 0.4f, 0.4f);
       
	}

		public void Jump()
	{
		this.platformAnimation.Play(Texts.AnimationPlatformJump);
	}

		public void StopJump()
	{
		this.platformAnimation.Play(Texts.AnimationPlatformIdle);
	}

		private void Update()
	{
	}

		public Transform AvatarPoint;

		public Transform PlarformTransform;

		private GameObject avatar;

		private Animation platformAnimation;
}
