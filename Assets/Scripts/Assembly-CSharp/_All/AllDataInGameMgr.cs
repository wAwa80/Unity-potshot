﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AllDataInGameMgr : MonoBehaviour {
    private void Awake()
    {
        DontDestroyOnLoad(this);
        
    }
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnApplicationQuit()
    {

        
    }
}
