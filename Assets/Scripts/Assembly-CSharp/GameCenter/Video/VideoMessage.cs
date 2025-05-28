using System;
using UnityEngine;
using UnityEngine.Video;

namespace GameCenter.Video
{
		[CreateAssetMenu(menuName = "GameCenter/VideoMessage")]
	public class VideoMessage : ScriptableObject
	{
				public VideoClip video;

				public string gpLink;

				public string title;

				public string packageName;
	}
}
