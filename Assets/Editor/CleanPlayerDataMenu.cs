using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
public class CleanPlayerDataMenu : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    
    [MenuItem("Tools/清空缓存")]
    public static void ClearCache()
    {
        PlayerPrefs.DeleteAll();
    }
    
}
