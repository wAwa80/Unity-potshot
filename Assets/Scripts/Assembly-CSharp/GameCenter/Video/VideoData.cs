using System;

namespace GameCenter.Video
{
		[Serializable]
	internal class VideoData
	{
				public VideoData()
		{
		}

				public VideoData(string video_url, string pkg_url, string text_title, string package_name)
		{
			this.video_url = video_url;
			this.pkg_url = pkg_url;
			this.text_title = text_title;
			this.package_name = package_name;
		}

				public string video_url;

				public string pkg_url;

				public string text_title;

				public string package_name;
	}
}
