using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuPanelMgr : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnEnable()
    {        
        
            //  hack   @@@@@@@@@@@@ 显示横幅 
        //     PolyAndroidCall.ShowBanner();       
    }
    private void OnDisable()
    {
        
            //  hack @@@@@@@@@ 隐藏横幅
        //     PolyAndroidCall.HideBanner();
        
    }
}
