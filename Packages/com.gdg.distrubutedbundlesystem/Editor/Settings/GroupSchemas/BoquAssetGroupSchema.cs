using System;
using System.Collections.Generic;
using System.ComponentModel;
using UnityEngine;
using UnityEngine.Serialization;

namespace UnityEditor.Game.AddressableAssets.Settings.GroupSchemas
{
    /// <summary>
    /// Schema for content updates.
    /// </summary>
    //  [CreateAssetMenu(fileName = "ContentUpdateGroupSchema.asset", menuName = "Addressables/Group Schemas/Content Update")]
    [DisplayName("BoquAssetGroup Schema")]
    public class BoquAssetGroupSchema : AddressableAssetGroupSchema
    {
        public enum BundleCompressionMode
        {
            Uncompressed,
            LZ4,
            LZMA
        }

        public enum BundlePackingMode
        {
            PackTogether,
            PackSeparately
        }

        public enum BundleLoadMode
        {
            Local,
            Remote
        }

        /// <summary>
        /// Options for internal id of assets in bundles.
        /// </summary>
        public enum AssetNamingMode
        {
            /// <summary>
            /// Use to identify assets by their full path.
            /// </summary>
            FullPath,
            /// <summary>
            /// Use to identify assets by their filename only.  There is a risk of collisions when assets in different folders have the same filename.
            /// </summary>
            Filename,
            /// <summary>
            /// Use to identify assets by their asset guid.  This will save space over using the full path and will be stable if assets move in the project.
            /// </summary>
            GUID,
            /// <summary>
            /// This method attempts to use the smallest identifier for internal asset ids.  For asset bundles with very few items, this can save a significant amount of space in the content catalog.
            /// </summary>
            Dynamic
        }

        [FormerlySerializedAs("m_Compression")]
        [SerializeField]
        BundleCompressionMode m_Compression = BundleCompressionMode.LZ4;

        public BundleCompressionMode Compression
        {
            get => m_Compression;
            set
            {
                if(m_Compression != value)
                {
                    m_Compression = value;
                    SetDirty(true);
                }
            }
        }
        
        [FormerlySerializedAs("m_BundleMode")]
        [SerializeField]
        [Tooltip("Controls how bundles are packed.  If set to PackTogether, a single asset bundle will be created for the entire group, with the exception of scenes, which are packed in a second bundle.  If set to PackSeparately, an asset bundle will be created for each entry in the group; in the case that an entry is a folder, one bundle is created for the folder and all of its sub entries.")]
        BundlePackingMode m_BundleMode = BundlePackingMode.PackTogether;

        public BundlePackingMode BundleMode
        {
            get => m_BundleMode;
            set
            {
                if (m_BundleMode != value)
                {
                    m_BundleMode = value;
                    SetDirty(true);
                }
            }
        }

        public BundleLoadMode LoadMode
        {
            get => m_LoadMode;
            set
            {
                if(m_LoadMode != value)
                {
                    m_LoadMode = value;
                    SetDirty(true);
                }
            }
        }

        [FormerlySerializedAs("m_LoadMode")]
        [SerializeField]
        BundleLoadMode m_LoadMode = BundleLoadMode.Local;

        public string GroupId
        {
            get => m_GroupId;
            set
            {
                if(m_GroupId != value)
                {
                    m_GroupId = value;
                    SetDirty(true);
                }
            }
        }

        [SerializeField]
        string m_GroupId = "0";

        GUIContent m_CompressionContent = new GUIContent("Asset Bundle Compression", "Compression method to use for asset bundles.");
        GUIContent m_BundleModeContent = new GUIContent("Bundle Mode", "Controls how bundles are created from this group.");
        GUIContent m_LoadModeContent = new GUIContent("Load Mode", "local or remote");
        GUIContent m_GroupIdContent = new GUIContent("Group Id", "asset group id");
        GUIContent m_CompressLocalCacheContent = new GUIContent("Compress Local Cache?", "compress local cache using LZ4 or uncompressed");
        /// <inheritdoc/>
        public override void OnGUI()
        {
            var so = new SerializedObject(this);
            EditorGUILayout.PropertyField(so.FindProperty(nameof(m_Compression)), m_CompressionContent, true);
            EditorGUILayout.PropertyField(so.FindProperty(nameof(m_BundleMode)), m_BundleModeContent, true);
            EditorGUILayout.PropertyField(so.FindProperty(nameof(m_LoadMode)), m_LoadModeContent, true);
            EditorGUILayout.PropertyField(so.FindProperty(nameof(m_GroupId)), m_GroupIdContent, true);
            so.ApplyModifiedProperties();
        }

        public override void OnGUIMultiple(List<AddressableAssetGroupSchema> otherSchemas)
        {
            List<Action<BoquAssetGroupSchema, BoquAssetGroupSchema>> queuedChanges = null;
            var so = new SerializedObject(this);

            List<AddressableAssetGroupSchema> otherBundledSchemas = new List<AddressableAssetGroupSchema>();
            foreach (var schema in otherSchemas)
            {
                otherBundledSchemas.Add(schema as BoquAssetGroupSchema);
            }
            EditorGUI.BeginChangeCheck();

            ShowSelectedPropertyMulti(so, nameof(m_Compression), m_CompressionContent, otherBundledSchemas, ref queuedChanges, (src, dst) => dst.Compression = src.Compression, ref m_Compression);
            ShowSelectedPropertyMulti(so, nameof(m_BundleMode), m_BundleModeContent, otherBundledSchemas, ref queuedChanges, (src, dst) => dst.BundleMode = src.BundleMode, ref m_BundleMode);
            ShowSelectedPropertyMulti(so, nameof(m_LoadMode), m_LoadModeContent, otherBundledSchemas, ref queuedChanges, (src, dst) => dst.LoadMode = src.LoadMode, ref m_LoadMode);
            ShowSelectedPropertyMulti(so, nameof(m_GroupId), m_GroupIdContent, otherBundledSchemas, ref queuedChanges, (src, dst) => dst.GroupId = src.GroupId, ref m_GroupId);

            so.ApplyModifiedProperties();
            if (queuedChanges != null)
            {
                Undo.SetCurrentGroupName("boquAssetGroupSchemasUndos");
                foreach (var schema in otherBundledSchemas)
                    Undo.RecordObject(schema, "BoquAssetGroupSchema" + schema.name);

                foreach (var change in queuedChanges)
                {
                    foreach (var schema in otherBundledSchemas)
                        change.Invoke(this, schema as BoquAssetGroupSchema);
                }
            }

            Undo.CollapseUndoOperations(Undo.GetCurrentGroup());
        }

        void ShowSelectedPropertyMulti<T>(SerializedObject so, string propertyName, GUIContent label, List<AddressableAssetGroupSchema> otherSchemas, ref List<Action<BoquAssetGroupSchema, BoquAssetGroupSchema>> queuedChanges, Action<BoquAssetGroupSchema, BoquAssetGroupSchema> a, ref T propertyValue)
        {
            var prop = so.FindProperty(propertyName);
            if (label == null)
                label = new GUIContent(prop.displayName);
            ShowMixedValue(prop, otherSchemas, typeof(T), propertyName);

            T newValue = default(T);

            EditorGUI.BeginChangeCheck();
            if (typeof(T) == typeof(bool))
            {
                newValue = (T)(object)EditorGUILayout.Toggle(label, (bool)(object)propertyValue);
            }
            else if (typeof(T).IsEnum)
            {
                newValue = (T)(object)(AssetNamingMode)EditorGUILayout.EnumPopup(label, (Enum)(object)propertyValue);
            }
            else if (typeof(T) == typeof(int))
            {
                newValue = (T)(object)EditorGUILayout.IntField(label, (int)(object)propertyValue);
            }
            else
            {
                EditorGUILayout.PropertyField(prop, label, true);
            }
            if (EditorGUI.EndChangeCheck())
            {
                Undo.RecordObject(so.targetObject, so.targetObject.name + propertyName);
                if (typeof(T) == typeof(bool) || typeof(T).IsEnum || typeof(T) == typeof(int))
                    propertyValue = newValue;
                if (queuedChanges == null)
                    queuedChanges = new List<Action<BoquAssetGroupSchema, BoquAssetGroupSchema>>();
                queuedChanges.Add(a);
                EditorUtility.SetDirty(this);
            }
            EditorGUI.showMixedValue = false;
        }

        public BuildCompression GetBuildCompressionForBundle()
        {
            switch (m_Compression)
            {
                case BundleCompressionMode.Uncompressed: return BuildCompression.Uncompressed;
                case BundleCompressionMode.LZ4: return BuildCompression.LZ4;
                case BundleCompressionMode.LZMA: return BuildCompression.LZMA;
            }
            return default(BuildCompression);
        }
    }
}
