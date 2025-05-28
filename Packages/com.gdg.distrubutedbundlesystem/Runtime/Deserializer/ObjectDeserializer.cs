using Cysharp.Threading.Tasks;
using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

namespace Game.Addresssables.Deserializer
{
    public static class ObjectDeserializer
    {
        public static async UniTask<object> Deserialize(string inputFile)
        {
            if (string.IsNullOrEmpty(inputFile))
            {
                return null;
            }
#if UNITY_WEBGL
            byte[] bytes = await ResourceManager.DownloaderModule.DownloadBytes(inputFile);
            return DeserializeSync(bytes);
#else
            if (Application.platform == RuntimePlatform.Android && inputFile.StartsWith("jar:"))
            {
                byte[] bytes = await ResourceManager.DownloaderModule.DownloadBytes(inputFile);
                return DeserializeSync(bytes);
            }
            else
            {
                if (!File.Exists(inputFile))
                {
                    return null;
                }
                object ret;
                FileStream fs = File.OpenRead(inputFile);
                BinaryFormatter formatter = new BinaryFormatter();
                try
                {
                    ret = formatter.Deserialize(fs);
                }
                catch (SerializationException e)
                {
                    LoggerInternal.LogErrorFormat("Failed to deserialize: {0}", e.Message);
                    throw;
                }
                finally
                {
                    fs.Close();
                }
                return ret;
            }
#endif
        }

        public static void DeserializeAsync(string inputFile, Action<object> callback)
        {
            if (string.IsNullOrEmpty(inputFile))
            {
                callback?.Invoke(null);
                return;
            }
#if UNITY_WEBGL
            object ret;
            ResourceManager.DownloaderModule.LoadBytesInJarPathAsync(inputFile, (bytes) =>
            {
                ret = DeserializeSync(bytes);
                callback?.Invoke(ret);
            });
#else
            object ret;
            if (Application.platform == RuntimePlatform.Android && inputFile.StartsWith("jar:"))
            {
                ResourceManager.DownloaderModule.LoadBytesInJarPathAsync(inputFile, (bytes) =>
                {
                    ret = DeserializeSync(bytes);
                    callback?.Invoke(ret);
                });

            }
            else
            {
                if (!File.Exists(inputFile))
                {
                    callback?.Invoke(null);
                    return;
                }
                
                FileStream fs = File.OpenRead(inputFile);
                BinaryFormatter formatter = new BinaryFormatter();
                try
                {
                    ret = formatter.Deserialize(fs);
                }
                catch (SerializationException e)
                {
                    LoggerInternal.LogErrorFormat("Failed to deserialize: {0}", e.Message);
                    throw;
                }
                finally
                {
                    fs.Close();
                }
                callback?.Invoke(ret);
            }
#endif
        }

        public static object DeserializeSync(string inputFile)
        {
            if (string.IsNullOrEmpty(inputFile) || !File.Exists(inputFile))
            {
                return null;
            }
            object ret;
            FileStream fs = File.OpenRead(inputFile);
            BinaryFormatter formatter = new BinaryFormatter();
            try
            {
                ret = formatter.Deserialize(fs);
            }
            catch (SerializationException e)
            {
                LoggerInternal.LogErrorFormat("Failed to deserialize: {0}", e.Message);
                throw;
            }
            finally
            {
                fs.Close();
            }
            return ret;
        }

        public static object DeserializeSync(byte[] bytes)
        {
            if(bytes == null)
                return null;
            object ret;
            MemoryStream ms = new MemoryStream();
            BinaryFormatter formatter = new BinaryFormatter();
            try
            {
                ms.Write(bytes, 0, bytes.Length);
                ms.Seek(0, SeekOrigin.Begin);
                ret = formatter.Deserialize(ms);
            }
            catch (SerializationException e)
            {
                LoggerInternal.LogErrorFormat("Failed to deserialize bytes: {0}", e.Message);
                return null;
            }
            finally
            {
                ms.Close();
            }
            return ret;
        }

        public static void ObjectToJson(object toJsonObj)
        {
           string json = JsonUtility.ToJson(toJsonObj);
           LoggerInternal.LogFormat("Object to json : {0}", json);
        }
    }
}

