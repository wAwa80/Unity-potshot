using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using vietlabs.fr2;

public static class MenuEntry 
{
    // Start is called before the first frame update
   

    [MenuItem("AddressablesBuild/Refresh_FR2_Cache(Execute It Before Release Full Build)")]
    public static void FR2_ReCreateCache()
    {
        FR2_SlotsUtils.ReCreateCache();
    }
}
