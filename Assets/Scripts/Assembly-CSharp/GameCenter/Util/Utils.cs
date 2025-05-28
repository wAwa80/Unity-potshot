using System;
using System.Diagnostics;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

namespace GameCenter.Util
{
		public static class Utils
	{
                //TODO  修改Unity的Debug的引用
        [Conditional("DEBUG")]
        public static void Log(string msg, string tag = "")
        {
            UnityEngine.Debug.Log(tag + "----" + msg);
        }

        //        [Conditional("DEBUG")]
        public static void LogError(string msg, string tag = "")
        {
            UnityEngine.Debug.LogError(tag + "----" + msg);
        }

                public static string CalculateMD5Hash(string filePath)
		{
			FileStream fileStream = new FileStream(filePath, FileMode.Open);
			MD5 md = new MD5CryptoServiceProvider();
			byte[] array = md.ComputeHash(fileStream);
			fileStream.Close();
			StringBuilder stringBuilder = new StringBuilder();
			for (int i = 0; i < array.Length; i++)
			{
				stringBuilder.Append(array[i].ToString("x2"));
			}
			return stringBuilder.ToString();
		}

				public static bool FileExists(string path, string md5)
		{
			return File.Exists(path) && Utils.CalculateMD5Hash(path) == md5;
		}

				public static T[] FromJson<T>(string json)
		{
			json = "{\"data\":" + json + "}";
			return JsonUtility.FromJson<Utils.JsonWrapper<T>>(json).data;
		}

				public const string TAG = "GameCenter";

				[Serializable]
		private class JsonWrapper<T>
		{
						public T[] data;
		}
	}
}
