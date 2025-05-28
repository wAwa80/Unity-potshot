using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
public class Loading : MonoBehaviour {
    Slider sliderLoad;
    Text txtLoad;

    float displayProgress;
    AsyncOperation op;
    float times = 0f;
    public void Awake()
    {
        sliderLoad = transform.Find("Slider").GetComponent<Slider>();
        txtLoad = transform.Find("Text").GetComponent<Text>();
        sliderLoad.value = displayProgress  ;
        ConfigManager.Instance.Init();
    }
    public void Start(){
       op = SceneManager.LoadSceneAsync("MainScene");
		StartCoroutine(LoadScene());
        Analytics.Instance.SendFirstMessageByID(AllDataInGameTest.logozhanshi_renci, 1 + "");
        

    }
    private IEnumerator LoadScene() {
        displayProgress = 0;
        var toProgress = 0;
        op.allowSceneActivation = false;
        while (op.progress < 0.9f)
        {
            toProgress = (int)op.progress * 100;
            while (displayProgress < toProgress)
            {
                ++displayProgress;
                sliderLoad.value = displayProgress / 100f;
                txtLoad.text = displayProgress.ToString("f0");
                yield return new WaitForEndOfFrame();
            }
        }
        toProgress = 100;
        while (displayProgress < toProgress)
        {
            ++displayProgress;
            sliderLoad.value = displayProgress / 100f;

            txtLoad.text = displayProgress.ToString("f0");
            yield return new WaitForEndOfFrame();
        }
        op.allowSceneActivation = true;
        //Application.LoadLevel(1);
        //while (times<=1f)
        //{
        //    times += 0.01f;
        //    sliderLoad.value = times;
        //    if (times>=1f)
        //    {

        //         txtLoad.text = 100.ToString("f0");
        //    }
        //    else
        //    {
        //        txtLoad.text = (times * 100).ToString("f0");
        //    }
        //}
    }
    private void Update()
    {
           
    }
}
