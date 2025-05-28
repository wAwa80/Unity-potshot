using System;
using System.Collections;
using System.Globalization;
using System.IO;
using GameCenter.Util;
using GameCenter.Video;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace GameCenter.Splash
{
    public class SplashManager : MonoBehaviour
    {
        private void Awake()
        {
            DontDestroyOnLoad(this);
        }
        private void Start()
        {
            //HACK ¹Ø¿¨1
            StartCoroutine(StartAni());

                
        }
        IEnumerator StartAni()
        {
            yield return new WaitForSeconds(2f);
            SceneManager.LoadSceneAsync("MainScene");
        }
    }
}
