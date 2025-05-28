using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using UnityEngine;

public static class PlayerPrefsX
{
		public static bool SetVector3(string key, Vector3 vector)
	{
		return PlayerPrefsX.SetFloatArray(key, new float[]
		{
			vector.x,
			vector.y,
			vector.z
		});
	}

		public static Vector3 GetVector3(string key)
	{
		float[] floatArray = PlayerPrefsX.GetFloatArray(key);
		if (floatArray.Length < 3)
		{
			return Vector3.zero;
		}
		return new Vector3(floatArray[0], floatArray[1], floatArray[2]);
	}

		public static bool SetBoolArray(string key, params bool[] boolArray)
	{
		if (boolArray.Length == 0)
		{
			return false;
		}
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < boolArray.Length - 1; i++)
		{
			stringBuilder.Append(boolArray[i]).Append("|");
		}
		stringBuilder.Append(boolArray[boolArray.Length - 1]);
		try
		{
			PlayerPrefs.SetString(key, stringBuilder.ToString());
		}
		catch (Exception ex)
		{
			return false;
		}
		return true;
	}

		public static bool[] GetBoolArray(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			string[] array = PlayerPrefs.GetString(key).Split(new char[]
			{
				"|"[0]
			});
			bool[] array2 = new bool[array.Length];
			for (int i = 0; i < array.Length; i++)
			{
				array2[i] = Convert.ToBoolean(array[i]);
			}
			return array2;
		}
		return new bool[0];
	}

		public static bool[] GetBoolArray(string key, bool defaultValue, int defaultSize)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefsX.GetBoolArray(key);
		}
		bool[] array = new bool[defaultSize];
		for (int i = 0; i < defaultSize; i++)
		{
			array[i] = defaultValue;
		}
		return array;
	}

		public static bool SetIntArray(string key, params int[] intArray)
	{
		if (intArray.Length == 0)
		{
			return false;
		}
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < intArray.Length - 1; i++)
		{
			stringBuilder.Append(intArray[i]).Append("|");
		}
		stringBuilder.Append(intArray[intArray.Length - 1]);
		try
		{
			PlayerPrefs.SetString(key, stringBuilder.ToString());
		}
		catch (Exception ex)
		{
			return false;
		}
		return true;
	}

		public static int[] GetIntArray(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			string[] array = PlayerPrefs.GetString(key).Split(new char[]
			{
				"|"[0]
			});
			int[] array2 = new int[array.Length];
			for (int i = 0; i < array.Length; i++)
			{
				array2[i] = Convert.ToInt32(array[i]);
			}
			return array2;
		}
		return new int[0];
	}

		public static int[] GetIntArray(string key, int defaultValue, int defaultSize)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefsX.GetIntArray(key);
		}
		int[] array = new int[defaultSize];
		for (int i = 0; i < defaultSize; i++)
		{
			array[i] = defaultValue;
		}
		return array;
	}

		public static bool SetFloatArray(string key, params float[] floatArray)
	{
		if (floatArray.Length == 0)
		{
			return false;
		}
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < floatArray.Length - 1; i++)
		{
			stringBuilder.Append(floatArray[i]).Append("|");
		}
		stringBuilder.Append(floatArray[floatArray.Length - 1]);
		try
		{
			PlayerPrefs.SetString(key, stringBuilder.ToString());
		}
		catch (Exception ex)
		{
			return false;
		}
		return true;
	}

		public static float[] GetFloatArray(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			string[] array = PlayerPrefs.GetString(key).Split(new char[]
			{
				"|"[0]
			});
			float[] array2 = new float[array.Length];
			for (int i = 0; i < array.Length; i++)
			{
				array2[i] = Convert.ToSingle(array[i]);
			}
			return array2;
		}
		return new float[0];
	}

		public static float[] GetFloatArray(string key, float defaultValue, int defaultSize)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefsX.GetFloatArray(key);
		}
		float[] array = new float[defaultSize];
		for (int i = 0; i < defaultSize; i++)
		{
			array[i] = defaultValue;
		}
		return array;
	}

		public static bool SetStringArray(string key, char separator, params string[] stringArray)
	{
		if (stringArray.Length == 0)
		{
			return false;
		}
		try
		{
			PlayerPrefs.SetString(key, string.Join(separator.ToString(), stringArray));
		}
		catch (Exception ex)
		{
			return false;
		}
		return true;
	}

		public static bool SetStringArray(string key, params string[] stringArray)
	{
		return PlayerPrefsX.SetStringArray(key, "\n"[0], stringArray);
	}

		public static string[] GetStringArray(string key, char separator)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetString(key).Split(new char[]
			{
				separator
			});
		}
		return new string[0];
	}

		public static string[] GetStringArray(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetString(key).Split(new char[]
			{
				"\n"[0]
			});
		}
		return new string[0];
	}

		public static string[] GetStringArray(string key, char separator, string defaultValue, int defaultSize)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetString(key).Split(new char[]
			{
				separator
			});
		}
		string[] array = new string[defaultSize];
		for (int i = 0; i < defaultSize; i++)
		{
			array[i] = defaultValue;
		}
		return array;
	}

		public static string[] GetStringArray(string key, string defaultValue, int defaultSize)
	{
		return PlayerPrefsX.GetStringArray(key, "\n"[0], defaultValue, defaultSize);
	}

		public static bool SetObject(string key, object obj)
	{
		byte[] inArray = PlayerPrefsX.SerializeToBinary(obj);
		string value = Convert.ToBase64String(inArray);
		try
		{
			PlayerPrefs.SetString(key, value);
		}
		catch (Exception)
		{
			return false;
		}
		return true;
	}

		public static T GetObject<T>(string key, T defaultValue = default(T))
	{
		T result;
		if (PlayerPrefs.HasKey(key))
		{
			string @string = PlayerPrefs.GetString(key);
			byte[] data = Convert.FromBase64String(@string);
			result = PlayerPrefsX.DeserializeWithBinary<T>(data);
		}
		else
		{
			result = defaultValue;
		}
		return result;
	}

		public static byte[] SerializeToBinary(object obj)
	{
        //hack obj 不能为空
        if (obj ==null)
        {
            return null;
        }
		MemoryStream memoryStream = new MemoryStream();
		BinaryFormatter binaryFormatter = new BinaryFormatter();
        byte[] result;
        
		    binaryFormatter.Serialize(memoryStream, obj);
		    result = memoryStream.ToArray();
		    memoryStream.Close();
           
        
		return result;
	}

		public static object DeserializeWithBinary(byte[] data)
	{
		MemoryStream memoryStream = new MemoryStream();
		memoryStream.Write(data, 0, data.Length);
		memoryStream.Position = 0L;
		BinaryFormatter binaryFormatter = new BinaryFormatter();
		object result = binaryFormatter.Deserialize(memoryStream);
		memoryStream.Close();
		return result;
	}

		public static T DeserializeWithBinary<T>(byte[] data)
	{
		return (T)((object)PlayerPrefsX.DeserializeWithBinary(data));
	}
}
