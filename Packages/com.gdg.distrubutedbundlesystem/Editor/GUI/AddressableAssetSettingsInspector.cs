using System;
using System.Collections.Generic;
using UnityEditor.Game.AddressableAssets.Settings;
using UnityEditorInternal;
using UnityEngine;

namespace UnityEditor.Game.AddressableAssets.GUI
{
    [CustomEditor(typeof(AddressableAssetSettings))]
    class AddressableAssetSettingsInspector : Editor
    {
        AddressableAssetSettings m_AasTarget;

        bool m_BuildFoldout = true;

        bool m_DebugFoldout = true;

        [SerializeField]
        bool m_GroupTemplateObjectsFoldout = true;

        [SerializeField]
        ReorderableList m_GroupTemplateObjectsRl;

        List<Action> m_QueuedChanges = new List<Action>();

        void OnEnable()
        {
            m_AasTarget = target as AddressableAssetSettings;
            if (m_AasTarget == null)
                return;

            m_GroupTemplateObjectsRl = new ReorderableList(m_AasTarget.GroupTemplateObjects, typeof(ScriptableObject), true, true, true, true);
            m_GroupTemplateObjectsRl.drawElementCallback = DrawGroupTemplateObjectCallback;
            m_GroupTemplateObjectsRl.headerHeight = 0;
            m_GroupTemplateObjectsRl.onAddDropdownCallback = OnAddGroupTemplateObject;
            m_GroupTemplateObjectsRl.onRemoveCallback = OnRemoveGroupTemplateObject;

        }

        GUIContent m_ResetAndroidResVersion =
            new GUIContent("Reset Android Res Version", "Reset Android Res Version To Target Number");
        GUIContent m_ResetIOSResVersion =
            new GUIContent("Reset IOS Res Version", "Reset IOS Res Version To Target Number");
#if UNITY_2019_4_OR_NEWER
        GUIContent m_StripUnityVersionFromBundleBuild =
            new GUIContent("Strip Unity Version from AssetBundles", "If enabled, the Unity Editor version is stripped from the AssetBundle header.");
#endif
        GUIContent m_DebugAddressableAssets =
            new GUIContent("Debug Addressable Asssets", "If enabled, the Unity Editor will become very slow cause using reflection.");
        GUIContent m_ResetWebglResVersion = new GUIContent("Reset Webgl Res Version", "Reset Webgl Res Version To Target Number");

        public override void OnInspectorGUI()
        {
            m_QueuedChanges.Clear();
            serializedObject.UpdateIfRequiredOrScript(); // use updated values
            EditorGUI.BeginChangeCheck();


            GUILayout.Space(6);
            m_BuildFoldout = EditorGUILayout.Foldout(m_BuildFoldout, "Build");
            if (m_BuildFoldout)
            {
                EditorGUILayout.LabelField("Android Res-Version:  " + m_AasTarget.ResVersion_Android);
                EditorGUILayout.LabelField("iOS Res-Version:  " + m_AasTarget.ResVersion_iOS);
                EditorGUILayout.LabelField("Webgl Res-Version: " + m_AasTarget.ResVersion_Webgl);
#if UNITY_2019_4_OR_NEWER
                bool stripUnityVersion = EditorGUILayout.Toggle(m_StripUnityVersionFromBundleBuild, m_AasTarget.StripUnityVersionFromBundleBuild);
                if (stripUnityVersion != m_AasTarget.StripUnityVersionFromBundleBuild)
                    m_QueuedChanges.Add(() => m_AasTarget.StripUnityVersionFromBundleBuild = stripUnityVersion);
#endif
                string resetAndroidNumber = EditorGUILayout.TextField(m_ResetAndroidResVersion, m_AasTarget.ResetAndroidResVersionToTargetNumber);
                if (resetAndroidNumber != m_AasTarget.ResetAndroidResVersionToTargetNumber)
                    m_QueuedChanges.Add(() => m_AasTarget.ResetAndroidResVersionToTargetNumber = resetAndroidNumber);

                if (GUILayout.Button("Reset Android Res Version", "Minibutton"))
                {
                    int tryResetTargetNumber = m_AasTarget.ResVersion_Android;
                    if (resetAndroidNumber != tryResetTargetNumber.ToString() && !string.IsNullOrEmpty(resetAndroidNumber))
                        int.TryParse(resetAndroidNumber, out tryResetTargetNumber);
                    m_AasTarget.ResVersion_Android = tryResetTargetNumber;
                }

                string resetIOSNumber = EditorGUILayout.TextField(m_ResetIOSResVersion, m_AasTarget.ResetIOSResVersionToTargetNumber);
                if (resetIOSNumber != m_AasTarget.ResetIOSResVersionToTargetNumber)
                    m_QueuedChanges.Add(() => m_AasTarget.ResetIOSResVersionToTargetNumber = resetIOSNumber);

                if (GUILayout.Button("Reset iOS Res Version", "Minibutton"))
                {
                    int tryResetIOSTargetNumber = m_AasTarget.ResVersion_iOS;
                    if (resetIOSNumber != tryResetIOSTargetNumber.ToString() && !string.IsNullOrEmpty(resetIOSNumber))
                        int.TryParse(resetIOSNumber, out tryResetIOSTargetNumber);
                    m_AasTarget.ResVersion_iOS = tryResetIOSTargetNumber;
                }

                //webgl
                string resetWebglNumber = EditorGUILayout.TextField(m_ResetWebglResVersion, m_AasTarget.ResetWebglResVersionToTargetNumber);
                if (resetWebglNumber != m_AasTarget.ResetWebglResVersionToTargetNumber)
                    m_QueuedChanges.Add(() => m_AasTarget.ResetWebglResVersionToTargetNumber = resetWebglNumber);

                if (GUILayout.Button("Reset Webgl Res Version", "Minibutton"))
                {
                    int tryResetWebglTargetNumber = m_AasTarget.ResVersion_Webgl;
                    if (resetWebglNumber != tryResetWebglTargetNumber.ToString() && !string.IsNullOrEmpty(resetWebglNumber))
                        int.TryParse(resetWebglNumber, out tryResetWebglTargetNumber);
                    m_AasTarget.ResVersion_Webgl = tryResetWebglTargetNumber;
                }
            }

            m_DebugFoldout = EditorGUILayout.Foldout(m_DebugFoldout, "Debug");
            if (m_DebugFoldout)
            {
                bool debugAddresableAssets = EditorGUILayout.Toggle(m_DebugAddressableAssets, m_AasTarget.DebugAddressableAssets);
                if (debugAddresableAssets != m_AasTarget.DebugAddressableAssets)
                    m_QueuedChanges.Add(() => m_AasTarget.DebugAddressableAssets = debugAddresableAssets);
            }

            GUILayout.Space(6);
            m_GroupTemplateObjectsFoldout = EditorGUILayout.Foldout(m_GroupTemplateObjectsFoldout, "Asset Group Templates");
            if (m_GroupTemplateObjectsFoldout)
                m_GroupTemplateObjectsRl.DoLayoutList();


            if (EditorGUI.EndChangeCheck() || m_QueuedChanges.Count > 0)
            {
                Undo.RecordObject(m_AasTarget, "AddressableAssetSettings before changes");
                foreach (var change in m_QueuedChanges)
                {
                    change.Invoke();
                }
                m_AasTarget.SetDirty(AddressableAssetSettings.ModificationEvent.BatchModification, null, true, true);
                serializedObject.ApplyModifiedProperties();
            }
        }

        void DrawGroupTemplateObjectCallback(Rect rect, int index, bool isActive, bool isFocused)
        {
            var so = m_AasTarget.GroupTemplateObjects[index];
            var groupTObj = so as IGroupTemplate;
            ScriptableObject newObj = null;
            if (groupTObj == null)
            {
                newObj = EditorGUI.ObjectField(rect, "Missing", null, typeof(ScriptableObject), false) as ScriptableObject;
            }
            else
            {
                newObj = EditorGUI.ObjectField(rect, groupTObj.Name, so, typeof(ScriptableObject), false) as ScriptableObject;
            }
            if (newObj != so)
                m_AasTarget.SetGroupTemplateObjectAtIndex(index, newObj as IGroupTemplate);
        }

        void OnRemoveGroupTemplateObject(ReorderableList list)
        {
            m_AasTarget.RemoveGroupTemplateObject(list.index);
        }

        void OnAddGroupTemplateObject(Rect buttonRect, ReorderableList list)
        {
            var assetPath = EditorUtility.OpenFilePanelWithFilters("Assets Group Templates", "Assets", new[] { "Group Template Object", "asset" });
            if (string.IsNullOrEmpty(assetPath))
                return;
            var templateObj = AssetDatabase.LoadAssetAtPath<ScriptableObject>(assetPath.Substring(assetPath.IndexOf("Assets/")));
            if (!typeof(IGroupTemplate).IsAssignableFrom(templateObj.GetType()))
            {
                Debug.LogWarningFormat("Asset at {0} does not implement the IGroupTemplate interface.", assetPath);
                return;
            }
            m_AasTarget.AddGroupTemplateObject(templateObj as IGroupTemplate);
        }

    }
}
