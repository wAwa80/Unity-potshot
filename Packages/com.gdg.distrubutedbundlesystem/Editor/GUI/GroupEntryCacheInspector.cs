using UnityEditor.Game.AddressableAssets.Settings;
using UnityEngine;

namespace UnityEditor.Game.AddressableAssets.GUI
{
    [CustomEditor(typeof(GroupEntryCache))]
    public class GroupEntryCacheInspector : Editor
    {
        GroupEntryCache m_Target;
        SerializedProperty sp_GroupEntry2AssetsMap;
        GUIContent m_GroupEntry2AssetsMap =
            new GUIContent("GroupEntry2AssetsMap");
        private void OnEnable()
        {
            m_Target = target as GroupEntryCache;
            if(m_Target == null)
            {
                return;
            }
            sp_GroupEntry2AssetsMap = serializedObject.FindProperty("m_GroupEntry2AssetsMap");
        }

        public override void OnInspectorGUI()
        {
            serializedObject.UpdateIfRequiredOrScript();
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(sp_GroupEntry2AssetsMap, m_GroupEntry2AssetsMap);
            if (EditorGUI.EndChangeCheck())
            {
                serializedObject.ApplyModifiedProperties();
                m_Target.ForceDirty();
            }
        }

    }
}
