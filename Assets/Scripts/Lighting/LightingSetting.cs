using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
public class LightingSetting : MonoBehaviour {

    public Color nFogColor;
    public float nFogStart;
    public float nFogEnd;
    public FogMode tempMode; 
	// Use this for initialization
	void Start () {
        RenderSettings.fogColor = nFogColor;
        RenderSettings.fogStartDistance = nFogStart;
        RenderSettings.fogEndDistance = nFogEnd;
        RenderSettings.fogMode = tempMode;
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
