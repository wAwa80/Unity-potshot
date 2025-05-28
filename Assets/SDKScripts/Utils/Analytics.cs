using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using Umeng;
public class Analytics : MonoBehaviour {
	public string app_bundleVersion="1.0.1";
    // Use this for initialization
    private static Analytics _instance;

    public static Analytics Instance
    {
        get
        {
            if (Analytics._instance == null)
            {
                Analytics._instance = UnityEngine.Object.FindObjectOfType<Analytics>();
            }
            return Analytics._instance;
        }
    }
    private void Awake()
    {
        _instance = this;
    }
    void Start () {
		//GA.Start();
		//GA.SetLogEnabled(false);
		Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.logozhanshi_renci,1+"");
    }

	public string UserId{
		get{
			return SystemInfo.deviceUniqueIdentifier;
		}
	}

	/// <summary>
	/// 发送首次记录事件
	/// </summary>
	/// <param name="eventId"></param>
	public  void SendFirstMessageByID (string eventId)
	{
		if (PlayerPrefs.HasKey (string.Format ("UmengFirst_{0}{1}", eventId, app_bundleVersion)) == false) {
			PlayerPrefs.SetInt (string.Format ("UmengFirst_{0}{1}", eventId, app_bundleVersion), 1);
			//GA.Event (eventId);
            NativeCaller.FlurryLogEvent(eventId);
            //Kochava.Tracker.SendEvent (eventId);
        }
	}

	/// <summary>
	/// 发送首次记录事件
	/// </summary>
	/// <param name="eventId"></param>
	public void SendFirstMessageByID (string eventId, string value)
	{
		if (PlayerPrefs.HasKey (string.Format ("UmengFirst_{0}{1}{2}", eventId, value, app_bundleVersion)) == false) {
			PlayerPrefs.SetInt (string.Format ("UmengFirst_{0}{1}{2}", eventId, value, app_bundleVersion), 1);
			//GA.Event (eventId, value);
            NativeCaller.FlurryLogEvent(eventId, value);
            //Kochava.Tracker.SendEvent (eventId, value);
        }
	}

	public void SendMessageByID(string eventId){
		//GA.Event(eventId);
		NativeCaller.FlurryLogEvent(eventId);
		//Kochava.Tracker.SendEvent(eventId);
	}
	public void SendMessageByID(string eventId,string value){
		//GA.Event(eventId,value);
		NativeCaller.FlurryLogEvent(eventId,value);
		//Kochava.Tracker.SendEvent(eventId,value);
	}
}
