using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

namespace a
{
		public class EncryptUtil
	{
				public static string DesEncrypt(string str, string sKey)
		{
			string result;
			try
			{
				byte[] bytes = Encoding.UTF8.GetBytes(sKey);
				byte[] rgbIV = bytes;
				byte[] bytes2 = Encoding.UTF8.GetBytes(str);
				DESCryptoServiceProvider descryptoServiceProvider = new DESCryptoServiceProvider();
				descryptoServiceProvider.Mode = CipherMode.ECB;
				MemoryStream memoryStream = new MemoryStream();
				CryptoStream cryptoStream = new CryptoStream(memoryStream, descryptoServiceProvider.CreateEncryptor(bytes, rgbIV), CryptoStreamMode.Write);
				cryptoStream.Write(bytes2, 0, bytes2.Length);
				cryptoStream.FlushFinalBlock();
				result = Convert.ToBase64String(memoryStream.ToArray());
			}
			catch
			{
				result = str;
			}
			return result;
		}

				public static string DesDecrypt(string pToDecrypt, string sKey)
		{
			byte[] bytes = Encoding.UTF8.GetBytes(sKey);
			byte[] rgbIV = bytes;
			byte[] array = Convert.FromBase64String(pToDecrypt);
			DESCryptoServiceProvider descryptoServiceProvider = new DESCryptoServiceProvider();
			descryptoServiceProvider.Mode = CipherMode.ECB;
			MemoryStream memoryStream = new MemoryStream();
			CryptoStream cryptoStream = new CryptoStream(memoryStream, descryptoServiceProvider.CreateDecryptor(bytes, rgbIV), CryptoStreamMode.Write);
			cryptoStream.Write(array, 0, array.Length);
			cryptoStream.FlushFinalBlock();
			return Encoding.Default.GetString(memoryStream.ToArray());
		}

				public static string UrlEncode(string str)
		{
			return WWW.EscapeURL(str);
		}
	}
}
