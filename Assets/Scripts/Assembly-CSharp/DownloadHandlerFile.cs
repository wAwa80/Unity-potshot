using System;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

public class DownloadHandlerFile : DownloadHandlerScript
{
		public DownloadHandlerFile(string localFilePath, int bufferSize = 4096, FileShare fileShare = FileShare.ReadWrite) : base(new byte[bufferSize])
	{
		string directoryName = Path.GetDirectoryName(localFilePath);
		if (!Directory.Exists(directoryName))
		{
			Directory.CreateDirectory(directoryName);
		}
		this._contentLength = -1;
		this._received = 0;
		this._stream = new FileStream(localFilePath, FileMode.OpenOrCreate, FileAccess.Write, fileShare, bufferSize);
		this.filePath = localFilePath;
	}

			public int contentLength
	{
		get
		{
			return (this._received <= this._contentLength) ? this._contentLength : this._received;
		}
	}

				public bool removeFileOnAbort { get; set; }

		protected override float GetProgress()
	{
		return (this.contentLength > 0) ? Mathf.Clamp01((float)this._received / (float)this.contentLength) : 0f;
	}

		protected override void ReceiveContentLength(int contentLength)
	{
		this._contentLength = contentLength;
	}

		protected override bool ReceiveData(byte[] data, int dataLength)
	{
		if (data == null || data.Length == 0)
		{
			return false;
		}
		this._received += dataLength;
		this._stream.Write(data, 0, dataLength);
		return true;
	}

		protected override void CompleteContent()
	{
		this.CloseStream();
	}

		public new void Dispose()
	{
		if (this.removeFileOnAbort && !base.isDone && !string.IsNullOrEmpty(this.filePath) && File.Exists(this.filePath))
		{
			File.Delete(this.filePath);
		}
		this.CloseStream();
		base.Dispose();
	}

		private void CloseStream()
	{
		if (this._stream != null)
		{
			this._stream.Dispose();
			this._stream = null;
		}
	}

		private int _contentLength;

		private int _received;

		private FileStream _stream;

		private string filePath;
}
