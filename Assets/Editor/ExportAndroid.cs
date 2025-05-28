using UnityEngine;
using System.Collections;
using UnityEditor;
using System.IO;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

public class ExportAndroid : Editor
{
    public static string exportAssetPath = System.IO.Directory.GetCurrentDirectory() + "/OutPut/Android";
	public static string exportAssetDataPath = exportAssetPath + "/"+PlayerSettings.productName+"/src/main/assets/bin/Data/";

    public static string studioProjectPath = System.IO.Directory.GetCurrentDirectory() + "/Android/src/main/assets";
    public static string studioProjectDataPath = studioProjectPath + "/bin/Data/";

    //顺序要跟unity中一致
    public static string[] BUILD_SCENES = new string[]
    {
        "Assets/Scene/StartScene/StartScene_Splash.unity",
        "Assets/Scene/MainScene/MainScene.unity",
    };

    [MenuItem("打包/导出Android_GP资源")]
    public static void Export_GP()
    {
        FileManager.DeleteDirectory(exportAssetPath);
        PlayerSettings.keystorePass = "000000";
        PlayerSettings.keyaliasPass = "000000";
        
        BuildPipeline.BuildPlayer(BUILD_SCENES, exportAssetPath, BuildTarget.Android, BuildOptions.AcceptExternalModificationsToPlayer);

        //Copy到指定目录
        if (Directory.Exists(studioProjectPath))
        {
			FileManager.DeleteDirectory(studioProjectDataPath);
			FileManager.CopyDirectory(exportAssetDataPath, studioProjectDataPath);

            

            Debug.Log("------拷贝完成-------");
            Debug.Log("拷贝完成"+studioProjectDataPath);
            Debug.Log("/////exportAssetDataPath +  studioProjectDataPath" + exportAssetDataPath + "/////" + studioProjectDataPath);
            encryptDll(studioProjectDataPath);
        }
        else
        {

            Debug.Log("------拷贝失败-------");
            Debug.Log("拷贝失败"+studioProjectDataPath);
        }
    }

    
    public static void ExportAndroidRes(BuildOptions buildOptions = BuildOptions.AcceptExternalModificationsToPlayer)
    {

		/*FileManager.DeleteDirectory(exportAssetPath);
        PlayerSettings.keystorePass = "000000";
        PlayerSettings.keyaliasPass = "000000";
        
        BuildPipeline.BuildPlayer(BUILD_SCENES, exportAssetPath, BuildTarget.Android, buildOptions);

        //Copy到指定目录
        if (Directory.Exists(studioProjectPath))
        {
			FileManager.DeleteDirectory(studioProjectDataPath);
			FileManager.CopyDirectory(exportAssetDataPath, studioProjectDataPath);

            Debug.Log("------拷贝完成-------");
            Debug.Log(studioProjectDataPath);
            encryptDll(studioProjectDataPath);
        }
        else
        {
            Debug.Log("------拷贝失败-------");
        }*/

    }

    static private void encryptDll(string path)

    {
        //DLL在android工程中对应的位置

        string inpath = path + "/Managed/Assembly-CSharp.dll";

        if (File.Exists(inpath))
        {
            //先读取没有加密的dll

            byte[] bytes = File.ReadAllBytes(inpath);

            //字节偏移 DLL就加密了。
            bytes[0] += 78;
            bytes[1] -= 52;
            bytes[2] /= 20;
            bytes[3] -= 121;
            bytes[4] /= 66;
            bytes[5] += 42;
            //在写到原本的位置上

            File.WriteAllBytes(inpath, bytes);

        }

    }

}
