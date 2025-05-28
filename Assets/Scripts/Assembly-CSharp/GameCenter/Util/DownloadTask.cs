using System;

namespace GameCenter.Util
{
		public class DownloadTask
	{
				public DownloadTask(string filePath, string url, string md5, Action<DownloadTask> onDownloadCompelete = null)
		{
			this.filePath = filePath;
			this.url = url;
			this.md5 = md5;
			this.OnDownloadCompelete = onDownloadCompelete;
		}

				public string filePath;

				public string url;

				public string md5;

				public Action<DownloadTask> OnDownloadCompelete;
	}
}
