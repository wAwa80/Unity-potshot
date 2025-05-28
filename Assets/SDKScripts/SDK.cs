using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using Facebook.Unity;

public class SDK : MonoBehaviour {
	public static SDK instance;
	[Header("common")]

	public Analytics analytics;
	[Header("appkey")]
	public string umeng_app_key;
	public string flurry_app_key;
	public string facebook_key;
	public string ironsource_key;
	public string kochava_appid;
	[Header("notice")]
	[TextArea(6,20)]
	public string desc="";
	private void Awake() {
		if(SDK.instance == null){
            SDK.instance = this;
            DontDestroyOnLoad(this.gameObject);
        }else if(SDK.instance != this){
            Destroy(this.gameObject);
        }
		if (!string.IsNullOrEmpty (umeng_app_key))
			NativeCaller.InitUmeng(umeng_app_key);
		if (!string.IsNullOrEmpty (flurry_app_key))
        {
			NativeCaller.InitFlurry(flurry_app_key);
            Debug.Log("flurry");
        }

        //if (FB.IsInitialized)
        //{
        //    FB.ActivateApp();
        //}
        //else
        //{
        //    FB.Init(() =>
        //    {
        //        FB.ActivateApp();
        //    });
        //}
    }
    public void Start()
    {
        //if (FB.IsInitialized)
        //{
        //    FB.ActivateApp();
        //}
        //else
        //{
        //    FB.Init(() =>
        //    {
        //        FB.ActivateApp();
        //    });
        //}
    }

    private void OnApplicationPause(bool pauseStatus) {
		if(!pauseStatus){
            //if (FB.IsInitialized)
            //{
            //    FB.ActivateApp();
            //}
            //else
            //{
            //    FB.Init(() =>
            //    {
            //        FB.ActivateApp();
            //    });
            //}
        }
        
	}
}
