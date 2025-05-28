using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class NativeCaller{
#if UNITY_ANDROID
	public static string unityPlayerClassName = "com.unity3d.player.UnityPlayer";
	#if !UNITY_EDITOR
		private static AndroidJavaClass obj = new AndroidJavaClass("com.gamehunter.common.AppLib");
		private static AndroidJavaObject cls_AppLib = obj.CallStatic<AndroidJavaObject>("getInstance");
	#endif
    
#endif
	public static void InitUmeng(string app_key){
#if UNITY_ANDROID && !UNITY_EDITOR
		using(var cls_UnityPlayer = new AndroidJavaClass(unityPlayerClassName)){
			using(var cls_Activity = cls_UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity")){
				cls_AppLib.Call("initUmeng",cls_Activity,app_key,"hysk");
			}
		}
#endif
    }
    public static void InitFlurry(string app_key){
#if UNITY_ANDROID && !UNITY_EDITOR
		using(var cls_UnityPlayer = new AndroidJavaClass(unityPlayerClassName)){
			using(var cls_Activity = cls_UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity")){
				cls_AppLib.Call("initFlurry",cls_Activity,app_key);
			}
		}
#endif
    }
	public static void FlurryLogEvent(string eventId){
		#if UNITY_ANDROID && !UNITY_EDITOR
			cls_AppLib.Call("FlurryLogEvent",eventId);
		#endif
	}

	public static void FlurryLogEvent(string eventId,string eventValue){
		#if UNITY_ANDROID && !UNITY_EDITOR
			cls_AppLib.Call("FlurryLogEvent",eventId,eventValue);
		#endif
	}
}
