using Cysharp.Threading.Tasks;
using System.IO;
using UnityEngine;

namespace Game.Addresssables.Deserializer
{
    public static class FileHashDeserializer
    {
        public static async UniTask<string> Deserialize(string inputFile)
        {
            if (string.IsNullOrEmpty(inputFile))
            {
                return null;
            }
            if(Application.platform == RuntimePlatform.Android && inputFile.StartsWith("jar:"))
            {
                return await ResourceManager.DownloaderModule.DownloadText(inputFile);
            }
            else
            {
                try
                {
                    if (!File.Exists(inputFile))
                    {
                        return null;
                    }

                    return File.ReadAllText(inputFile);
                }
                catch (System.Exception ex)
                {
                    LoggerInternal.LogError(string.Format("SafeReadAllText failed! path = {0} with err = {1}", inputFile, ex.Message));
                    return null;
                }
            }
        }
    }
}
