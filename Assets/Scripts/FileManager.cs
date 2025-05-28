using UnityEngine;
using System.Collections;
using System.IO;
using System.Security.Cryptography;
using System.Text;

public class FileCatchData
{
    public bool state = true; //操作是否成功
    public string message = ""; //失败之后的信息
    public object data = null; //需要返回的数据
}

/// <summary>
/// 包外文件管理器
/// </summary>
public class FileManager
{
    /// <summary>
    /// 读取文件
    /// </summary>
    /// <param name="path"></param>
    /// <returns></returns>
    public static string Read(string path)
    {
        string _info = string.Empty;
        if (File.Exists(path))
        {
            _info = File.ReadAllText(path);
        }
        return _info;
    }
    /// <summary>
    /// 创建文件夹根据有后缀的目录
    /// </summary>
    /// <param name="path">有后缀的目录</param>
    public static void CreateDirectory(string path)
    {
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
    }
    /// <summary>
    /// 保存文件
    /// </summary>
    /// <param name="path"></param>
    /// <param name="bytes"></param>
    public static void Save(string path, byte[] bytes)
    {
        File.WriteAllBytes(path, bytes);
    }
    /// <summary>
    /// 保存文件
    /// </summary>
    /// <param name="path"></param>
    /// <param name="info"></param>
    public static void Save(string path, string info)
    {
        File.WriteAllText(path, info);
    }

    /// <summary>
    /// 删除文件夹以及文件夹内的文件
    /// </summary>
    /// <param name="path">路径</param>
    public static void DelectDirectory(string path)
    {
        try
        {
            //如果存在目录文件，就将其目录文件删除 
            if (Directory.Exists(path))
            {

                foreach (string filenamestr in Directory.GetFileSystemEntries(path))
                {
                    if (File.Exists(filenamestr))
                    {
                        FileInfo file = new FileInfo(filenamestr);
                        if (file.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        {
                            file.Attributes = FileAttributes.Normal;//去掉文件属性 
                        }
                        File.Delete(filenamestr);//直接删除其中的文件 
                    }
                    else
                    {
                        DelectDirectory(filenamestr);//递归删除 
                    }

                }
                //删除顶级文件夹
                DirectoryInfo DirInfo = new DirectoryInfo(path);

                if (DirInfo.Exists)
                {
                    //Debug.Log(path);
                    DirInfo.Attributes = FileAttributes.Normal & FileAttributes.Directory;    //去掉文件夹属性  
                    DirInfo.Delete(true);
                }
            }
        }
        catch
        {
            // 异常信息 
            Debug.LogError("Delect Directory failure!!!" + path); // 失败 
        }
    }
    /// <summary>
    /// 删除文件
    /// </summary>
    /// <param name="path"></param>
    public static void DeleteFile(string path)
    {
        if (File.Exists(path))
        {
            File.Delete(path);
        }
    }
    /// <summary>
    /// 文件大小
    /// </summary>
    /// <param name="path"></param>
    /// <returns></returns>
    public static long GetLength(string path)
    {

        System.IO.FileInfo _fileInfo = new System.IO.FileInfo(path);
        return _fileInfo.Length;
    }
    /// <summary>
    /// string转byte
    /// </summary>
    /// <param name="info"></param>
    /// <returns></returns>
    public static byte[] GetBytesByString(string info)
    {
        return System.Text.Encoding.UTF8.GetBytes(info);
    }
    /// <summary>
    /// byte转string
    /// </summary>
    /// <param name="bytes"></param>
    /// <returns></returns>
    public static string GetStringByBytes(byte[] bytes)
    {
        return System.Text.Encoding.UTF8.GetString(bytes);
    }
    /// <summary>
    /// md5加密方法
    /// </summary>
    /// <param name="pwd">传入需要加密的字符串</param>
    /// <returns>返回加密后的md5值</returns>    
    public static string GetMD5String(byte[] bytes)
    {
        MD5 md5 = MD5.Create();
        StringBuilder sb = new StringBuilder();
        byte[] buffer = md5.ComputeHash(bytes);
        foreach (byte b in buffer)
        {
            sb.Append(b.ToString("x2"));
        }
        return sb.ToString();
    }

    /// <summary>
    /// 删除文件夹以及文件夹内的文件
    /// </summary>
    /// <param name="path">路径</param>
    public static void DeleteDirectory(string path)
    {
        try
        {
            //如果存在目录文件，就将其目录文件删除 
            if (Directory.Exists(path))
            {

                foreach (string filenamestr in Directory.GetFileSystemEntries(path))
                {
                    if (File.Exists(filenamestr))
                    {
                        FileInfo file = new FileInfo(filenamestr);
                        if (file.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        {
                            file.Attributes = FileAttributes.Normal;//去掉文件属性 
                        }
                        File.Delete(filenamestr);//直接删除其中的文件 
                    }
                    else
                    {
                        DeleteDirectory(filenamestr);//递归删除 
                    }

                }
                //删除顶级文件夹
                DirectoryInfo DirInfo = new DirectoryInfo(path);

                if (DirInfo.Exists)
                {
                    Debug.Log(path);
                    DirInfo.Attributes = FileAttributes.Normal & FileAttributes.Directory;    //去掉文件夹属性  
                    DirInfo.Delete(true);
                }
            }
        }
        catch
        {
            // 异常信息 
            Debug.LogError("Delect Directory failure!!!" + path); // 失败 
        }
    }

    //Copy文件目录到指定目录
    public static FileCatchData CopyDirectory(string from, string to)
    {
        FileCatchData fileCatchData = new FileCatchData();
        try
        {
            //检查是否存在目的目录  
            if (!Directory.Exists(to))
            {
                Directory.CreateDirectory(to);
            }
            if (Directory.Exists(from) == true)
            {
                //先来复制文件  
                DirectoryInfo directoryInfo = new DirectoryInfo(from);
                FileInfo[] files = directoryInfo.GetFiles();
                //复制所有文件  
                foreach (FileInfo file in files)
                {
                    string _toPath = Path.Combine(to, file.Name);
                    //U2.Debugger.Log("拷贝文件 --->" + file.DirectoryName + "-->" + _toPath);
                    DeleteFile(_toPath);
                    file.CopyTo(_toPath);
                }
                //最后复制目录  
                DirectoryInfo[] directoryInfoArray = directoryInfo.GetDirectories();
                foreach (DirectoryInfo dir in directoryInfoArray)
                {
                    CopyDirectory(Path.Combine(from, dir.Name), Path.Combine(to, dir.Name));
                }
            }
            fileCatchData.state = true;
        }
        catch (System.Exception e)
        {
            fileCatchData.state = false;
            fileCatchData.message = e.Message;
        }
        return fileCatchData;
    }
}
