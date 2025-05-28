using Assets.BoquAddressables.Runtime.Common;
using Game.Addresssables.Crc32;
using Cysharp.Threading.Tasks;
using System;
using System.IO;
using System.Text;
using UnityEngine;
using UnityEngine.Networking;

namespace Game.Addresssables.Utils
{
    public static class GameUtils
    {
        public static bool RequestHasErrors(UnityWebRequest webReq, out UnityWebRequestResult result)
        {
            result = null;
            if (webReq == null || !webReq.isDone)
                return false;

#if UNITY_2020_1_OR_NEWER
            switch (webReq.result)
            {
                case UnityWebRequest.Result.InProgress:
                case UnityWebRequest.Result.Success:
                    return false;
                case UnityWebRequest.Result.ConnectionError:
                case UnityWebRequest.Result.ProtocolError:
                case UnityWebRequest.Result.DataProcessingError:
                    result = new UnityWebRequestResult(webReq);
                    return true;
                default:
                    throw new NotImplementedException($"Cannot determine whether UnityWebRequest succeeded or not from result : {webReq.result}");
            }
#else
            var isError = webReq.isHttpError || webReq.isNetworkError;
            if (isError)
                result = new UnityWebRequestResult(webReq);

            return isError;
#endif
        }
        public static void CheckFileAndCreateDirWhenNeeded(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
            {
                return;
            }

            FileInfo file_info = new FileInfo(filePath);
            DirectoryInfo dir_info = file_info.Directory;
            if (!dir_info.Exists)
            {
                Directory.CreateDirectory(dir_info.FullName);
            }
        }
        public static bool SafeWriteAllText(string outFile, string text)
        {
            try
            {
                if (string.IsNullOrEmpty(outFile))
                {
                    return false;
                }

                CheckFileAndCreateDirWhenNeeded(outFile);
                File.WriteAllText(outFile, text);
                return true;
            }
            catch (System.Exception ex)
            {
                LoggerInternal.LogError(string.Format("SafeWriteAllText failed! path = {0} with err = {1}", outFile, ex.Message));
                return false;
            }
        }

        /// <summary>
        /// Editor usage: what ever you like.
        /// Runtime usage: only for very samll file like like hash or will cause memory leak.
        /// </summary>
        /// <param name="inFile"></param>
        /// <returns></returns>
        public static byte[] SafeReadAllBytes(string inFile)
        {
            if (string.IsNullOrEmpty(inFile) || !File.Exists(inFile))
            {
                return null;
            }
            byte[] buffer = null;
            using (FileStream fs = File.OpenRead(inFile))
            {
                buffer = new byte[fs.Length];
                fs.Read(buffer, 0, (int)fs.Length);
            }
            return buffer;
        }

        const int BufferSize = 32 * 1024;
        public static bool CheckCrc(string filePath, uint expectedCrc)
        {
            if (string.IsNullOrEmpty(filePath) || !File.Exists(filePath))
            {
                return false;
            }
            byte[] buffer = new byte[BufferSize];
            uint currentCrc = 0;
            using (FileStream fs = File.OpenRead(filePath))
            {
                int len = fs.Read(buffer, 0, buffer.Length);
                while (len > 0)
                {
                    currentCrc = Crc32Algorithm.Append(currentCrc, buffer, 0, len);
                    len = fs.Read(buffer, 0, buffer.Length);
                }
            }
            if (currentCrc == expectedCrc)
            {
                LoggerInternal.LogFormat("crc check passed, current is: {0}, expected is: {1}", currentCrc, expectedCrc);
                return true;
            }
            LoggerInternal.LogWarningFormat("crc check failed, current is: {0}, expected is: {1}", currentCrc, expectedCrc);
            return false;
        }

        public static bool CheckCrc2(FileStream fs, uint expectedCrc)
        {
            byte[] buffer = new byte[BufferSize];
            uint currentCrc = 0;
            fs.Position = 0;
            int len = fs.Read(buffer, 0, buffer.Length);
            while (len > 0)
            {
                currentCrc = Crc32Algorithm.Append(currentCrc, buffer, 0, len);
                len = fs.Read(buffer, 0, buffer.Length);
            }
            if (currentCrc == expectedCrc)
            {
                LoggerInternal.LogFormat("crc check passed, current is: {0}, expected is: {1}", currentCrc, expectedCrc);
                return true;
            }
            LoggerInternal.LogWarningFormat("crc check failed, current is: {0}, expected is: {1}", currentCrc, expectedCrc);
            return false;
        }

        public static void DeleteDirectory(string dirPath)
        {
            string[] files = Directory.GetFiles(dirPath);
            string[] dirs = Directory.GetDirectories(dirPath);

            foreach (string file in files)
            {
                File.Delete(file);
            }

            foreach (string dir in dirs)
            {
                DeleteDirectory(dir);
            }

            Directory.Delete(dirPath, false);
        }

        public static bool SafeClearDir(string folderPath)
        {
            try
            {
                if (string.IsNullOrEmpty(folderPath))
                {
                    return true;
                }

                if (Directory.Exists(folderPath))
                {
                    DeleteDirectory(folderPath);
                }
                Directory.CreateDirectory(folderPath);
                return true;
            }
            catch (System.Exception ex)
            {
                LoggerInternal.LogError(string.Format("SafeClearDir failed! path = {0} with err = {1}", folderPath, ex.Message));
                return false;
            }
        }

        public static bool SafeWriteAllBytes(string outFile, byte[] outBytes)
        {
            try
            {
                if (string.IsNullOrEmpty(outFile))
                {
                    return false;
                }

                CheckFileAndCreateDirWhenNeeded(outFile);
                File.WriteAllBytes(outFile, outBytes);
                return true;
            }
            catch (System.Exception ex)
            {
                LoggerInternal.LogError(string.Format("SafeWriteAllBytes failed! path = {0} with err = {1}", outFile, ex.Message));
                return false;
            }
        }

        public static bool SafeDeleteFile(string filePath)
        {
            try
            {
                if (string.IsNullOrEmpty(filePath))
                {
                    return true;
                }

                if (!File.Exists(filePath))
                {
                    return true;
                }
                File.Delete(filePath);
                return true;
            }
            catch (System.Exception ex)
            {
                LoggerInternal.LogError(string.Format("SafeDeleteFile failed! path = {0} with err: {1}", filePath, ex.Message));
                return false;
            }
        }

        public static byte[] StreamToByteArraySync(Stream input)
        {
            byte[] buffer = new byte[4096];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        public static async UniTask<byte[]> StreamToByteArray(Stream input)
        {
            byte[] buffer = new byte[4096];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = await input.ReadAsync(buffer, 0, buffer.Length)) > 0)
                {
                    await ms.WriteAsync(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        public static async UniTask<string> StreamToString(Stream stream)
        {
            using (StreamReader reader = new StreamReader(stream, Encoding.UTF8))
            {
                return await reader.ReadToEndAsync();
            }
        }

        public static string GetPlatformName()
        {
#if UNITY_ANDROID
            return "Android";
#elif UNITY_IOS
            return "iOS";
#elif UNITY_WEBGL
            return "WebGL";
#else
            return "Unsupported Platform";
#endif
        }


        /// <summary>
        /// Extracts main and subobject keys if properly formatted
        /// </summary>
        /// <param name="assetPath">asset path.</param>
        /// <param name="mainKey">The key of the main asset.  This will be set to null if a sub key is not found.</param>
        /// <param name="subKey">The key of the sub object.  This will be set to null if not found.</param>
        /// <returns></returns>
        internal static bool ExtractKeyAndSubKey(string assetPath, out string mainKey, out string subKey)
        {
            if (assetPath != null)
            {
                var i = assetPath.IndexOf('[');
                if (i > 0)
                {
                    var j = assetPath.LastIndexOf(']');
                    if (j > i)
                    {
                        mainKey = assetPath.Substring(0, i);
                        subKey = assetPath.Substring(i + 1, j - (i + 1));
                        return true;
                    }
                }
            }
            mainKey = null;
            subKey = null;
            return false;
        }
    }
}
