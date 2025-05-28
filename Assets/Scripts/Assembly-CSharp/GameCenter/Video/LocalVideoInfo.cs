using System;
using UnityEngine;

namespace GameCenter.Video
{
		[CreateAssetMenu(menuName = "GameCenter/LocalVideoIfo")]
	[Serializable]
	public class LocalVideoInfo : ScriptableObject
	{
				public VideoMessage[] Videos;
	}
}
