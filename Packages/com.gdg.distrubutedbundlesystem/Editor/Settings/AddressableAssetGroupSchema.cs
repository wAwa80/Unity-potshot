using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.Serialization;

namespace UnityEditor.Game.AddressableAssets.Settings
{
    /// <summary>
    /// Contains data for AddressableAssetGroups.
    /// </summary>
    public class AddressableAssetGroupSchema : ScriptableObject
    {
        [FormerlySerializedAs("m_group")] [HideInInspector] [SerializeField]
        AddressableAssetGroup m_Group;

        /// <summary>
        /// Get the group that the schema belongs to.
        /// </summary>
        public AddressableAssetGroup Group
        {
            get { return m_Group; }
            internal set
            {
                m_Group = value;
                if (m_Group != null)
                    OnSetGroup(m_Group);
            }
        }

        /// <summary>
        /// Override this method to perform post creation initialization.
        /// </summary>
        /// <param name="group">The group that the schema is added to.</param>
        protected virtual void OnSetGroup(AddressableAssetGroup group)
        {
        }

        /// <summary>
        /// Used to display the GUI of the schema.
        /// </summary>
        public virtual void OnGUI()
        {
            var type = GetType();
            var so = new SerializedObject(this);
            var p = so.GetIterator();
            p.Next(true);
            while (p.Next(false))
            {
                var prop = type.GetField(p.name, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
                if (prop != null)
                    EditorGUILayout.PropertyField(p, true);
            }
            so.ApplyModifiedProperties();
        }

        /// <summary>
        /// Used to display the GUI of multiple selected groups.
        /// </summary>
        /// <param name="otherSchemas">Schema instances in the other selected groups</param>
        public virtual void OnGUIMultiple(List<AddressableAssetGroupSchema> otherSchemas)
        {
        }

        /// <summary>
        /// Used to notify the addressables settings that data has been modified.  This must be called by subclasses to ensure proper cache invalidation.
        /// </summary>
        /// <param name="postEvent">Determines if this method call will post an event to the internal addressables event system</param>
        protected void SetDirty(bool postEvent)
        {
            if (m_Group != null)
            {
                if (m_Group.Settings != null && m_Group.Settings.IsPersisted)
                {
                    EditorUtility.SetDirty(this);
                    AddressableAssetUtility.OpenAssetIfUsingVCIntegration(this);
                }

                if (m_Group != null)
                    m_Group.SetDirty(AddressableAssetSettings.ModificationEvent.GroupSchemaModified, this, postEvent, false);
            }
        }

        /// <summary>
        /// Used for drawing properties in the inspector.
        /// </summary>
        public virtual void ShowAllProperties()
        {
        }

        /// <summary>
        /// Display mixed values for the specified property found in a list of schemas.
        /// </summary>
        /// <param name="property">The property.</param>
        /// <param name="otherSchemas">The list of schemas that may contain the property.</param>
        /// <param name="type">The property type.</param>
        /// <param name="propertyName">The property name.</param>
        protected void ShowMixedValue(SerializedProperty property, List<AddressableAssetGroupSchema> otherSchemas, Type type, string propertyName)
        {
            foreach (var schema in otherSchemas)
            {
                var s_prop = (new SerializedObject(schema)).FindProperty(propertyName);
                if ((type.IsEnum && (property.enumValueIndex != s_prop.enumValueIndex)) ||
                    (type == typeof(string) && (property.stringValue != s_prop.stringValue)) ||
                    (type == typeof(int) && (property.intValue != s_prop.intValue)) ||
                    (type == typeof(bool) && (property.boolValue != s_prop.boolValue)))
                {
                    EditorGUI.showMixedValue = true;
                    return;
                }

            }
        }
    }
}
