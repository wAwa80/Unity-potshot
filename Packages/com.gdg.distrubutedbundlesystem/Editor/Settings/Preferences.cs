using UnityEngine;

namespace UnityEditor.Game.AddressableAssets
{
    internal static class AddressablesPreferences
    {
        private class GUIScope : UnityEngine.GUI.Scope
        {
            float m_LabelWidth;
            public GUIScope(float layoutMaxWidth)
            {
                m_LabelWidth = EditorGUIUtility.labelWidth;
                EditorGUIUtility.labelWidth = 250;
                GUILayout.BeginHorizontal();
                GUILayout.Space(10);
                GUILayout.BeginVertical();
                GUILayout.Space(15);
            }

            public GUIScope() : this(500)
            {
            }

            protected override void CloseScope()
            {
                GUILayout.EndVertical();
                GUILayout.EndHorizontal();
                EditorGUIUtility.labelWidth = m_LabelWidth;
            }
        }

        internal class Properties
        {
            public static readonly GUIContent buildSettings = EditorGUIUtility.TrTextContent("Build Settings");
        }

        static AddressablesPreferences()
        {
        }

#if UNITY_2019_1_OR_NEWER
        [SettingsProvider]
        static SettingsProvider CreateAddressableSettingsProvider()
        {
            var provider = new SettingsProvider("Preferences/Addressables", SettingsScope.User, SettingsProvider.GetSearchKeywordsFromGUIContentProperties<Properties>());
            provider.guiHandler = sarchContext => OnGUI();
            return provider;
        }

#else
        [PreferenceItem("Addressables")]
#endif
        static void OnGUI()
        {
            using (new GUIScope())
            {
                DrawProperties();
            }
        }

        static void DrawProperties()
        {
            GUILayout.Label(Properties.buildSettings, EditorStyles.boldLabel);

            GUILayout.Space(15);
        }
    }
}
