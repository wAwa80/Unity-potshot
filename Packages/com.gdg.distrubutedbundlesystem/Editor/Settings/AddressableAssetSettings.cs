using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;
using UnityEngine.Serialization;

namespace UnityEditor.Game.AddressableAssets.Settings
{
    using Object = UnityEngine.Object;

    /// <summary>
    /// Contains editor data for the addressables system.
    /// </summary>
    public class AddressableAssetSettings : ScriptableObject
    {
        [InitializeOnLoadMethod]
        static void RegisterWithAssetPostProcessor()
        {
            //if the Library folder has been deleted, this will be null and it will have to be set on the first access of the settings object
            if (AddressableAssetSettingsDefaultObject.Settings != null)
                AddressablesAssetPostProcessor.OnPostProcess = AddressableAssetSettingsDefaultObject.Settings.OnPostprocessAllAssets;
            else
                EditorApplication.update += TryAddAssetPostprocessorOnNextUpdate;
        }

        private static void TryAddAssetPostprocessorOnNextUpdate()
        {
            if (AddressableAssetSettingsDefaultObject.Settings != null)
                AddressablesAssetPostProcessor.OnPostProcess = AddressableAssetSettingsDefaultObject.Settings.OnPostprocessAllAssets;
            EditorApplication.update -= TryAddAssetPostprocessorOnNextUpdate;
        }

        /// <summary>
        /// Default name of a newly created group.
        /// </summary>
        public const string kNewGroupName = "New Group";

        public const string kClientDataOutputPath = "ClientData";

        public const string kServerDataOutputPath = "ServerData";

        public const string kAssetbundleSuffix = ".bundle";

        /// <summary>
        /// Options for labeling all the different generated events.
        /// </summary>
        public enum ModificationEvent
        {
            /// <summary>
            /// Use to indicate that a group was added to the settings object.
            /// </summary>
            GroupAdded,
            /// <summary>
            /// Use to indicate that a group was removed from the the settings object.
            /// </summary>
            GroupRemoved,
            /// <summary>
            /// Use to indicate that a group in the settings object was renamed.
            /// </summary>
            GroupRenamed,
            /// <summary>
            /// Use to indicate that a schema was added to a group.
            /// </summary>
            GroupSchemaAdded,
            /// <summary>
            /// Use to indicate that a schema was removed from a group.
            /// </summary>
            GroupSchemaRemoved,
            /// <summary>
            /// Use to indicate that a schema was modified.
            /// </summary>
            GroupSchemaModified,
            /// <summary>
            /// Use to indicate that a group template was added to the settings object.
            /// </summary>
            GroupTemplateAdded,
            /// <summary>
            /// Use to indicate that a group template was removed from the settings object.
            /// </summary>
            GroupTemplateRemoved,
            /// <summary>
            /// Use to indicate that a schema was added to a group template.
            /// </summary>
            GroupTemplateSchemaAdded,
            /// <summary>
            /// Use to indicate that a schema was removed from a group template.
            /// </summary>
            GroupTemplateSchemaRemoved,
            /// <summary>
            /// Use to indicate that an asset entry was created.
            /// </summary>
            EntryCreated,
            /// <summary>
            /// Use to indicate that an asset entry was added to a group.
            /// </summary>
            EntryAdded,
            /// <summary>
            /// Use to indicate that an asset entry moved from one group to another.
            /// </summary>
            EntryMoved,
            /// <summary>
            /// Use to indicate that an asset entry was removed from a group.
            /// </summary>
            EntryRemoved,
            /// <summary>
            /// Use to indicate that an asset label was added to the settings object.
            /// </summary>
            LabelAdded,
            /// <summary>
            /// Use to indicate that an asset label was removed from the settings object.
            /// </summary>
            LabelRemoved,
            /// <summary>
            /// Use to indicate that a profile was added to the settings object.
            /// </summary>
            ProfileAdded,
            /// <summary>
            /// Use to indicate that a profile was removed from the settings object.
            /// </summary>
            ProfileRemoved,
            /// <summary>
            /// Use to indicate that a profile was modified.
            /// </summary>
            ProfileModified,
            /// <summary>
            /// Use to indicate that a profile has been set as the active profile.
            /// </summary>
            ActiveProfileSet,
            /// <summary>
            /// Use to indicate that an asset entry was modified.
            /// </summary>
            EntryModified,
            /// <summary>
            /// Use to indicate that the build settings object was modified.
            /// </summary>
            BuildSettingsChanged,
            /// <summary>
            /// Use to indicate that a new build script is being used as the active build script.
            /// </summary>
            ActiveBuildScriptChanged,
            /// <summary>
            /// Use to indicate that a new data builder script was added to the settings object.
            /// </summary>
            DataBuilderAdded,
            /// <summary>
            /// Use to indicate that a data builder script was removed from the settings object.
            /// </summary>
            DataBuilderRemoved,
            /// <summary>
            /// Use to indicate a new initialization object was added to the settings object.
            /// </summary>
            InitializationObjectAdded,
            /// <summary>
            /// Use to indicate a initialization object was removed from the settings object.
            /// </summary>
            InitializationObjectRemoved,
            /// <summary>
            /// Use to indicate that a new script is being used as the active playmode data builder.
            /// </summary>
            ActivePlayModeScriptChanged,
            /// <summary>
            /// Use to indicate that a batch of asset entries was modified. Note that the posted object will be null.
            /// </summary>
            BatchModification,
            /// <summary>
            /// Use to indicate that the hosting services manager was modified.
            /// </summary>
            HostingServicesManagerModified,
            /// <summary>
            /// Use to indicate that a group changed its order placement within the list of groups in the settings object.
            /// </summary>
            GroupMoved,
            /// <summary>
            /// Use to indicate that a new certificate handler is being used for the initialization object provider.
            /// </summary>
            CertificateHandlerChanged
        }

        /// <summary>
        /// The path of the settings asset.
        /// </summary>
        public string AssetPath
        {
            get
            {
                string guid;
                long localId;
                if (!AssetDatabase.TryGetGUIDAndLocalFileIdentifier(this, out guid, out localId))
                    throw new Exception($"{nameof(AddressableAssetSettings)} is not persisted.  Unable to determine AssetPath.");
                var assetPath = AssetDatabase.GUIDToAssetPath(guid);
                if (string.IsNullOrEmpty(assetPath))
                    throw new Exception($"{nameof(AddressableAssetSettings)} - Unable to determine AssetPath from guid {guid}.");
                return assetPath;
            }
        }

        /// <summary>
        /// The folder of the settings asset.
        /// </summary>
        public string ConfigFolder
        {
            get
            {
                return Path.GetDirectoryName(AssetPath);
            }
        }

        /// <summary>
        /// The folder for the group assets.
        /// </summary>
        public string GroupFolder
        {
            get
            {
                return ConfigFolder + "/AssetGroups";
            }
        }
        /// <summary>
        /// The folder for the script assets.
        /// </summary>
        public string DataBuilderFolder
        {
            get
            {
                return ConfigFolder + "/DataBuilders";
            }
        }
        /// <summary>
        /// The folder for the asset group schema assets.
        /// </summary>
        public string GroupSchemaFolder
        {
            get
            {
                return GroupFolder + "/Schemas";
            }
        }

        /// <summary>
        /// The default folder for the group template assets.
        /// </summary>
        public string GroupTemplateFolder
        {
            get
            {
                return ConfigFolder + "/AssetGroupTemplates";
            }
        }

        /// <summary>
        /// Event for handling settings changes.  The object passed depends on the event type.
        /// </summary>
        public Action<AddressableAssetSettings, ModificationEvent, object> OnModification { get; set; }

        /// <summary>
        /// Event for handling settings changes on all instances of AddressableAssetSettings.  The object passed depends on the event type.
        /// </summary>
        public static event Action<AddressableAssetSettings, ModificationEvent, object> OnModificationGlobal;


        bool m_IsTemporary;
        /// <summary>
        /// Returns whether this settings object is persisted to an asset.
        /// </summary>
        public bool IsPersisted { get { return !m_IsTemporary; } }

#if UNITY_2019_4_OR_NEWER
        [SerializeField]
        bool m_StripUnityVersionFromBundleBuild = false;
        /// <summary>
        /// If true, this option will strip the Unity Editor Version from the header of the AssetBundle during a build.
        /// </summary>
        internal bool StripUnityVersionFromBundleBuild
        {
            get { return m_StripUnityVersionFromBundleBuild; }
            set { m_StripUnityVersionFromBundleBuild = value; }
        }
#endif
        [SerializeField]
        bool m_DebugAddressableAssets = false;

        internal bool DebugAddressableAssets
        {
            get { return m_DebugAddressableAssets; }
            set { m_DebugAddressableAssets = value; }
        }


        

        /// <summary>
        /// Android Res-version
        /// </summary>
        public int ResVersion_Android;

        /// <summary>
        /// iOS Res-version
        /// </summary>
        public int ResVersion_iOS;

        [SerializeField]
        string m_resetAndroidResVersionToTargetNumber;
        
        public string ResetAndroidResVersionToTargetNumber
        {
            get { return m_resetAndroidResVersionToTargetNumber; }
            set { m_resetAndroidResVersionToTargetNumber = value; }
        }

        [SerializeField]
        string m_resetIOSResVersionToTargetNumber;

        public string ResetIOSResVersionToTargetNumber
        {
            get { return m_resetIOSResVersionToTargetNumber; }
            set { m_resetIOSResVersionToTargetNumber = value; }
        }

        /// <summary>
        /// Webgl Res-version
        /// </summary>
        public int ResVersion_Webgl;
        [SerializeField]
        string m_resetWebglResVersionToTargetNumber;

        public string ResetWebglResVersionToTargetNumber
        {
            get { return m_resetWebglResVersionToTargetNumber; }
            set { m_resetWebglResVersionToTargetNumber = value; }
        }

        [FormerlySerializedAs("m_groupAssets")]
        [SerializeField]
        List<AddressableAssetGroup> m_GroupAssets = new List<AddressableAssetGroup>();
        /// <summary>
        /// List of asset groups.
        /// </summary>
        public List<AddressableAssetGroup> groups { get { return m_GroupAssets; } }

        [FormerlySerializedAs("m_buildSettings")]
        [SerializeField]
        AddressableAssetBuildSettings m_BuildSettings = new AddressableAssetBuildSettings();
        /// <summary>
        /// Build settings object.
        /// </summary>
        public AddressableAssetBuildSettings buildSettings { get { return m_BuildSettings; } }


        [FormerlySerializedAs("m_labelTable")]
        [SerializeField]
        LabelTable m_LabelTable = new LabelTable();
        /// <summary>
        /// LabelTable object.
        /// </summary>
        internal LabelTable labelTable { get { return m_LabelTable; } }
        [FormerlySerializedAs("m_schemaTemplates")]
        [SerializeField]
        List<AddressableAssetGroupSchemaTemplate> m_SchemaTemplates = new List<AddressableAssetGroupSchemaTemplate>();

        /// <summary>
        /// Remove  the schema at the specified index.
        /// </summary>
        /// <param name="index">The index to remove at.</param>
        /// <param name="postEvent">Indicates if an even should be posted to the Addressables event system for this change.</param>
        /// <returns>True if the schema was removed.</returns>
        [Obsolete("GroupSchemaTemplates are deprecated, use GroupTemplateObjects")]
        public bool RemoveSchemaTemplate(int index, bool postEvent = true)
        {
            Debug.LogError("GroupSchemaTemplates are deprecated, use GroupTemplateObjects");
            return false;
        }

        [SerializeField]
        List<ScriptableObject> m_GroupTemplateObjects = new List<ScriptableObject>();

        /// <summary>
        /// List of ScriptableObjects that implement the IGroupTemplate interface for providing new templates.
        /// For use in the AddressableAssetsWindow to display new groups to create
        /// </summary>
        public List<ScriptableObject> GroupTemplateObjects
        {
            get { return m_GroupTemplateObjects; }
        }

        /// <summary>
        /// Get the IGroupTemplate at the specified index.
        /// </summary>
        /// <param name="index">The index of the template object.</param>
        /// <returns>The AddressableAssetGroupTemplate object at the specified index.</returns>
        public IGroupTemplate GetGroupTemplateObject(int index)
        {
            if (m_GroupTemplateObjects.Count == 0)
                return null;
            if (index < 0 || index >= m_GroupTemplateObjects.Count)
            {
                Debug.LogWarningFormat("Invalid index for group template: {0}.", index);
                return null;
            }
            return m_GroupTemplateObjects[Mathf.Clamp(index, 0, m_GroupTemplateObjects.Count)] as IGroupTemplate;
        }

        /// <summary>
        /// Adds a AddressableAssetsGroupTemplate object.
        /// </summary>
        /// <param name="templateObject">The AddressableAssetGroupTemplate object to add.</param>
        /// <param name="postEvent">Indicates if an even should be posted to the Addressables event system for this change.</param>
        /// <returns>True if the initialization object was added.</returns>
        public bool AddGroupTemplateObject(IGroupTemplate templateObject, bool postEvent = true)
        {
            if (templateObject == null)
            {
                Debug.LogWarning("Cannot add null IGroupTemplate");
                return false;
            }
            var so = templateObject as ScriptableObject;
            if (so == null)
            {
                Debug.LogWarning("Group Template objects must inherit from ScriptableObject.");
                return false;
            }

            m_GroupTemplateObjects.Add(so);
            SetDirty(ModificationEvent.GroupTemplateAdded, so, postEvent, true);
            return true;
        }

        /// <summary>
        /// Remove the AddressableAssetGroupTemplate object at the specified index.
        /// </summary>
        /// <param name="index">The index to remove.</param>
        /// <param name="postEvent">Indicates if an event should be posted to the Addressables event system for this change.</param>
        /// <returns>True if the initialization object was removed.</returns>
        public bool RemoveGroupTemplateObject(int index, bool postEvent = true)
        {
            if (m_GroupTemplateObjects.Count <= index)
                return false;
            var so = m_GroupTemplateObjects[index];
            m_GroupTemplateObjects.RemoveAt(index);
            SetDirty(ModificationEvent.GroupTemplateRemoved, so, postEvent, true);
            return true;
        }

        /// <summary>
        /// Sets the initialization object at the specified index.
        /// </summary>
        /// <param name="index">The index to set the initialization object.</param>
        /// <param name="templateObject">The rroup template object to set.  This must be a valid scriptable object that implements the IGroupTemplate interface.</param>
        /// <param name="postEvent">Indicates if an even should be posted to the Addressables event system for this change.</param>
        /// <returns>True if the initialization object was set, false otherwise.</returns>
        public bool SetGroupTemplateObjectAtIndex(int index, IGroupTemplate templateObject, bool postEvent = true)
        {
            if (m_GroupTemplateObjects.Count <= index)
                return false;
            if (templateObject == null)
            {
                Debug.LogWarning("Cannot set null IGroupTemplate");
                return false;
            }
            var so = templateObject as ScriptableObject;
            if (so == null)
            {
                Debug.LogWarning("AddressableAssetGroupTemplate objects must inherit from ScriptableObject.");
                return false;
            }

            m_GroupTemplateObjects[index] = so;
            SetDirty(ModificationEvent.GroupTemplateAdded, so, postEvent, true);
            return true;
        }

        [FormerlySerializedAs("m_initializationObjects")]
        [SerializeField]
        List<ScriptableObject> m_InitializationObjects = new List<ScriptableObject>();
        /// <summary>
        /// List of ScriptableObjects that implement the IObjectInitializationDataProvider interface for providing runtime initialization.
        /// </summary>
        public List<ScriptableObject> InitializationObjects
        {
            get { return m_InitializationObjects; }
        }

        /// <summary>
        /// Remove the initialization object at the specified index.
        /// </summary>
        /// <param name="index">The index to remove.</param>
        /// <param name="postEvent">Indicates if an even should be posted to the Addressables event system for this change.</param>
        /// <returns>True if the initialization object was removed.</returns>
        public bool RemoveInitializationObject(int index, bool postEvent = true)
        {
            if (m_InitializationObjects.Count <= index)
                return false;
            var so = m_InitializationObjects[index];
            m_InitializationObjects.RemoveAt(index);
            SetDirty(ModificationEvent.InitializationObjectRemoved, so, postEvent, true);
            return true;
        }
        

        /// <summary>
        /// Gets the list of all defined labels.
        /// </summary>
        /// <returns>Returns a list of all defined labels.</returns>
        public List<string> GetLabels()
        {
            return m_LabelTable.labelNames.ToList();
        }

        /// <summary>
        /// Add a new label.
        /// </summary>
        /// <param name="label">The label name.</param>
        /// <param name="postEvent">Send modification event.</param>
        public void AddLabel(string label, bool postEvent = true)
        {
            if (m_LabelTable.AddLabelName(label))
                SetDirty(ModificationEvent.LabelAdded, label, postEvent, true);
        }

        internal void RenameLabel(string oldLabelName, string newLabelName)
        {
            int index = m_LabelTable.GetIndexOfLabel(oldLabelName);
            if (index < 0)
                return;

            if (!m_LabelTable.AddLabelName(newLabelName, index))
                return;

            foreach (var group in groups)
            {
                foreach (var entry in group.entries)
                {
                    if (entry.labels.Contains(oldLabelName))
                    {
                        entry.labels.Remove(oldLabelName);
                        entry.SetLabel(newLabelName, true);
                    }
                }
            }

            m_LabelTable.RemoveLabelName(oldLabelName);
        }

        /// <summary>
        /// Remove a label by name.
        /// </summary>
        /// <param name="label">The label name.</param>
        /// <param name="postEvent">Send modification event.</param>
        public void RemoveLabel(string label, bool postEvent = true)
        {
            m_LabelTable.RemoveLabelName(label);
            SetDirty(ModificationEvent.LabelRemoved, label, postEvent, true);
            Debug.LogWarningFormat("Label \"{0}\" removed. If you re-add the label before building, it will be restored in entries that had it. " +
                "Building Addressables content will clear this label from all entries. That action cannot be undone.", label);
        }

        /// <summary>
        /// Gets all asset entries from all groups.
        /// </summary>
        /// <param name="assets">The list of asset entries.</param>
        /// <param name="includeSubObjects">Determines if sub objects such as sprites should be included.</param>
        /// <param name="groupFilter">A method to filter groups.  Groups will be processed if filter is null, or it returns TRUE</param>
        /// <param name="entryFilter">A method to filter entries.  Entries will be processed if filter is null, or it returns TRUE</param>
        public void GetAllAssets(List<AddressableAssetEntry> assets, bool includeSubObjects, Func<AddressableAssetGroup, bool> groupFilter = null, Func<AddressableAssetEntry, bool> entryFilter = null)
        {
            foreach (var g in groups)
                if (g != null && (groupFilter == null || groupFilter(g)))
                    g.GatherAllAssets(assets, true, true, includeSubObjects, entryFilter);
        }

        internal void GatherAllAssetReferenceDrawableEntries(List<IReferenceEntryData> assets)
        {
            foreach (var g in groups)
            {
                if (g != null)
                    g.GatherAllAssetReferenceDrawableEntries(assets);
            }
        }

        /// <summary>
        /// Remove an asset entry.
        /// </summary>
        /// <param name="guid">The  guid of the asset.</param>
        /// <param name="postEvent">Send modifcation event.</param>
        /// <returns>True if the entry was found and removed.</returns>
        public bool RemoveAssetEntry(string guid, bool postEvent = true)
            => RemoveAssetEntry(FindAssetEntry(guid), postEvent);

        /// <summary>
        /// Remove an asset entry.
        /// </summary>
        /// <param name="entry">The entry to remove.</param>
        /// <param name="postEvent">Send modifcation event.</param>
        /// <returns>True if the entry was found and removed.</returns>
        internal bool RemoveAssetEntry(AddressableAssetEntry entry, bool postEvent = true)
        {
            if (entry == null)
                return false;
            if (entry.parentGroup != null)
                entry.parentGroup.RemoveAssetEntry(entry, postEvent);
            return true;
        }

        void OnEnable()
        {
            buildSettings.OnAfterDeserialize(this);
        }

        void OnDisable()
        {
        }

        void Validate()
        {
            // Begin update any SchemaTemplate to GroupTemplateObjects
            if (m_SchemaTemplates != null && m_SchemaTemplates.Count > 0)
            {
                Debug.LogError("Updating from GroupSchema version that is too old, deleting schemas");
                m_SchemaTemplates = null;
            }
            // End update of SchemaTemplate to GroupTemplates

            if (m_BuildSettings == null)
                m_BuildSettings = new AddressableAssetBuildSettings();
            if (m_LabelTable == null)
                m_LabelTable = new LabelTable();

            buildSettings.Validate(this);
        }

        T CreateScriptAsset<T>() where T : ScriptableObject
        {
            var script = CreateInstance<T>();
            if (!Directory.Exists(DataBuilderFolder))
                Directory.CreateDirectory(DataBuilderFolder);
            var path = DataBuilderFolder + "/" + typeof(T).Name + ".asset";
            if (!File.Exists(path))
                AssetDatabase.CreateAsset(script, path);
            return AssetDatabase.LoadAssetAtPath<T>(path);
        }

        internal const string DefaultLocalGroupName = "Default Local Group";

        /// <summary>
        /// Create a new AddressableAssetSettings object.
        /// </summary>
        /// <param name="configFolder">The folder to store the settings object.</param>
        /// <param name="configName">The name of the settings object.</param>
        /// <param name="createDefaultGroups">If true, create groups for player data and local packed content.</param>
        /// <param name="isPersisted">If true, assets are created.</param>
        /// <returns></returns>
        public static AddressableAssetSettings Create(string configFolder, string configName, bool isPersisted)
        {
            AddressableAssetSettings aa;
            var path = configFolder + "/" + configName + ".asset";
            aa = isPersisted ? AssetDatabase.LoadAssetAtPath<AddressableAssetSettings>(path) : null;
            if (aa == null)
            {
                aa = CreateInstance<AddressableAssetSettings>();
                aa.m_IsTemporary = !isPersisted;
                aa.name = configName;
                // TODO: Uncomment after initial opt-in testing period
                //aa.ContiguousBundles = true;

                if (isPersisted)
                {
                    Directory.CreateDirectory(configFolder);
                    AssetDatabase.CreateAsset(aa, path);
                    aa = AssetDatabase.LoadAssetAtPath<AddressableAssetSettings>(path);
                    aa.Validate();
                }

                if (isPersisted)
                    AssetDatabase.SaveAssets();
            }
            return aa;
        }

        /// <summary>
        /// Creates a new AddressableAssetGroupTemplate Object with the set of schema types with default settings for use in the editor GUI.
        /// </summary>
        /// <param name="displayName">The display name of the template.</param>
        /// <param name="description">Description text use with the template.</param>
        /// <param name="types">The schema types for the template.</param>
        /// <returns>True if the template was added, false otherwise.</returns>
        public bool CreateAndAddGroupTemplate(string displayName, string description, params Type[] types)
        {
            string assetPath = GroupTemplateFolder + "/" + displayName + ".asset";

            if (!CanCreateGroupTemplate(displayName, assetPath, types))
                return false;

            if (!Directory.Exists(GroupTemplateFolder))
                Directory.CreateDirectory(GroupTemplateFolder);

            AddressableAssetGroupTemplate newAssetGroupTemplate = ScriptableObject.CreateInstance<AddressableAssetGroupTemplate>();
            newAssetGroupTemplate.Description = description;

            AssetDatabase.CreateAsset(newAssetGroupTemplate, assetPath);
            AssetDatabase.SaveAssets();

            AddGroupTemplateObject(newAssetGroupTemplate);

            foreach (Type type in types)
                newAssetGroupTemplate.AddSchema(type);


            return true;
        }

        private bool CanCreateGroupTemplate(string displayName, string assetPath, Type[] types)
        {
            if (string.IsNullOrEmpty(displayName))
            {
                Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template must have a valid name.");
                return false;
            }
            if (types.Length == 0)
            {
                Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template {0} must contain at least 1 schema type.", displayName);
                return false;
            }
            bool typesAreValid = true;
            for (int i = 0; i < types.Length; i++)
            {
                var t = types[i];
                if (t == null)
                {
                    Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template {0} schema type at index {1} is null.", displayName, i);
                    typesAreValid = false;
                }
                else if (!typeof(AddressableAssetGroupSchema).IsAssignableFrom(t))
                {
                    Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template {0} schema type at index {1} must inherit from AddressableAssetGroupSchema.  Specified type was {2}.", displayName, i, t.FullName);
                    typesAreValid = false;
                }
            }
            if (!typesAreValid)
            {
                Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template {0} must contains at least 1 invalid schema type.", displayName);
                return false;
            }

            if (File.Exists(assetPath))
            {
                Debug.LogWarningFormat("CreateAndAddGroupTemplate - Group template {0} already exists at location {1}.", displayName, assetPath);
                return false;
            }

            return true;
        }

        /// <summary>
        /// Find asset group by functor.
        /// </summary>
        /// <param name="func">The functor to call on each group.  The first group that evaluates to true is returned.</param>
        /// <returns>The group found or null.</returns>
        public AddressableAssetGroup FindGroup(Func<AddressableAssetGroup, bool> func)
        {
            return groups.Find(g => g != null && func(g));
        }

        /// <summary>
        /// Find asset group by name.
        /// </summary>
        /// <param name="groupName">The name of the group.</param>
        /// <returns>The group found or null.</returns>
        public AddressableAssetGroup FindGroup(string groupName)
        {
            return FindGroup(g => g != null && g.Name == groupName);
        }

        private static bool LoadGroupTemplateObject(AddressableAssetSettings aa, string assetPath)
        {
            return aa.AddGroupTemplateObject(AssetDatabase.LoadAssetAtPath(assetPath, typeof(ScriptableObject)) as IGroupTemplate);
        }

        internal AddressableAssetEntry CreateEntry(string guid, string address, AddressableAssetGroup parent, bool readOnly, bool postEvent = true)
        {
            AddressableAssetEntry entry = parent.GetAssetEntry(guid);
            if (entry == null)
                entry = new AddressableAssetEntry(guid, address, parent, readOnly);

            if (!readOnly)
                SetDirty(ModificationEvent.EntryCreated, entry, postEvent, false);

            return entry;
        }

        /// <summary>
        /// Marks the object as modified.
        /// </summary>
        /// <param name="modificationEvent">The event type that is changed.</param>
        /// <param name="eventData">The object data that corresponds to the event.</param>
        /// <param name="postEvent">If true, the event is propagated to callbacks.</param>
        /// <param name="settingsModified">If true, the settings asset will be marked as dirty.</param>
        public void SetDirty(ModificationEvent modificationEvent, object eventData, bool postEvent, bool settingsModified = false)
        {
            if (this != null)
            {
                if (postEvent)
                {
                    if (OnModificationGlobal != null)
                        OnModificationGlobal(this, modificationEvent, eventData);
                    if (OnModification != null)
                        OnModification(this, modificationEvent, eventData);
                }

                if (settingsModified && IsPersisted)
                    EditorUtility.SetDirty(this);
            }
        }

        internal bool RemoveMissingGroupReferences()
        {
            List<int> missingGroupsIndices = new List<int>();
            for (int i = 0; i < groups.Count; i++)
            {
                var g = groups[i];
                if (g == null)
                    missingGroupsIndices.Add(i);
            }
            if (missingGroupsIndices.Count > 0)
            {
                Debug.Log("Addressable settings contains " + missingGroupsIndices.Count + " group reference(s) that are no longer there. Removing reference(s).");
                for (int i = missingGroupsIndices.Count - 1; i >= 0; i--)
                {
                    groups.RemoveAt(missingGroupsIndices[i]);
                }
                return true;
            }
            return false;
        }

        /// <summary>
        /// Find and asset entry by guid.
        /// </summary>
        /// <param name="guid">The asset guid.</param>
        /// <returns>The found entry or null.</returns>
        public AddressableAssetEntry FindAssetEntry(string guid)
        {
            return FindAssetEntry(guid, false);
        }

        /// <summary>
        /// Find and asset entry by guid.
        /// </summary>
        /// <param name="guid">The asset guid.</param>
        /// <param name="includeImplicit">Whether or not to include implicit asset entries in the search.</param>
        /// <returns>The found entry or null.</returns>
        public AddressableAssetEntry FindAssetEntry(string guid, bool includeImplicit)
        {
            foreach (var g in groups)
            {
                if (g != null)
                {
                    var e = g.GetAssetEntry(guid, includeImplicit);
                    if (e != null)
                        return e;
                }
            }
            return null;
        }

        internal bool IsAssetPathInAddressableDirectory(string assetPath, out string assetName)
        {
            if (!string.IsNullOrEmpty(assetPath))
            {
                var dir = Path.GetDirectoryName(assetPath);
                while (!string.IsNullOrEmpty(dir))
                {
                    var dirEntry = FindAssetEntry(AssetDatabase.AssetPathToGUID(dir));
                    if (dirEntry != null)
                    {
                        assetName = dirEntry.address + assetPath.Remove(0, dir.Length);
                        return true;
                    }

                    dir = Path.GetDirectoryName(dir);
                }
            }
            assetName = "";
            return false;
        }

        internal void MoveAssetsFromResources(Dictionary<string, string> guidToNewPath, AddressableAssetGroup targetParent)
        {
            if (guidToNewPath == null || targetParent == null)
            {
                return;
            }

            var entries = new List<AddressableAssetEntry>();
            var createdDirs = new List<string>();
            AssetDatabase.StartAssetEditing();
            foreach (var item in guidToNewPath)
            {
                var dirInfo = new FileInfo(item.Value).Directory;
                if (dirInfo != null && !dirInfo.Exists)
                {
                    dirInfo.Create();
                    createdDirs.Add(dirInfo.FullName);
                    AssetDatabase.StopAssetEditing();
                    AssetDatabase.Refresh();
                    AssetDatabase.StartAssetEditing();
                }

                var oldPath = AssetDatabase.GUIDToAssetPath(item.Key);
                var errorStr = AssetDatabase.MoveAsset(oldPath, item.Value);
                if (!string.IsNullOrEmpty(errorStr))
                {
                    Debug.LogError("Error moving asset: " + errorStr); 
                }
                else
                {
                    AddressableAssetEntry e = FindAssetEntry(item.Key);
                    if (e != null)
                        e.IsInResources = false;

                    var newEntry = CreateOrMoveEntry(item.Key, targetParent, false, false);
                    var index = oldPath.ToLower().LastIndexOf("resources/");
                    if (index >= 0)
                    {
                        var newAddress = oldPath.Substring(index + 10);
                        if (Path.HasExtension(newAddress))
                        {
                            newAddress = newAddress.Replace(Path.GetExtension(oldPath), "");
                        }

                        if (!string.IsNullOrEmpty(newAddress))
                        {
                            newEntry.SetAddress(newAddress, false);
                        }
                    }
                    entries.Add(newEntry);
                }
            }

            //TODO:macdeng
            /*foreach (var dir in createdDirs)
                DirectoryUtility.DeleteDirectory(dir, onlyIfEmpty: true);*/

            AssetDatabase.StopAssetEditing();
            AssetDatabase.Refresh();
            SetDirty(ModificationEvent.EntryMoved, entries, true, true);
        }

        /// <summary>
        /// Move an existing entry to a group.
        /// </summary>
        /// <param name="entries">The entries to move.</param>
        /// <param name="targetParent">The group to add the entries to.</param>
        /// <param name="readOnly">Should the entries be read only.</param>
        /// <param name="postEvent">Send modification event.</param>
        public void MoveEntries(List<AddressableAssetEntry> entries, AddressableAssetGroup targetParent, bool readOnly = false, bool postEvent = true)
        {
            if (entries != null)
            {
                foreach (var entry in entries)
                {
                    MoveEntry(entry, targetParent, readOnly, false);
                }

                SetDirty(ModificationEvent.EntryMoved, entries, postEvent, false);
            }
        }

        /// <summary>
        /// Move an existing entry to a group.
        /// </summary>
        /// <param name="entry">The entry to move.</param>
        /// <param name="targetParent">The group to add the entry to.</param>
        /// <param name="readOnly">Should the entry be read only.</param>
        /// <param name="postEvent">Send modification event.</param>
        public void MoveEntry(AddressableAssetEntry entry, AddressableAssetGroup targetParent, bool readOnly = false, bool postEvent = true)
        {
            if (targetParent == null || entry == null)
                return;

            entry.ReadOnly = readOnly;

            if (entry.parentGroup != null && entry.parentGroup != targetParent)
                entry.parentGroup.RemoveAssetEntry(entry, postEvent);

            targetParent.AddAssetEntry(entry, postEvent);
        }

        /// <summary>
        /// Create a new entry, or if one exists in a different group, move it into the new group.
        /// </summary>
        /// <param name="guid">The asset guid.</param>
        /// <param name="targetParent">The group to add the entry to.</param>
        /// <param name="readOnly">Is the new entry read only.</param>
        /// <param name="postEvent">Send modification event.</param>
        /// <returns></returns>
        public AddressableAssetEntry CreateOrMoveEntry(string guid, AddressableAssetGroup targetParent, bool readOnly = false, bool postEvent = true)
        {
            if (targetParent == null || string.IsNullOrEmpty(guid))
                return null;

            AddressableAssetEntry entry = FindAssetEntry(guid);
            if (entry != null) //move entry to where it should go...
            {
                MoveEntry(entry, targetParent, readOnly, postEvent);
            }
            else //create entry
            {
                entry = CreateAndAddEntryToGroup(guid, targetParent, readOnly, postEvent);
            }

            return entry;
        }

        /// <summary>
        /// Create a new entries for each asset, or if one exists in a different group, move it into the targetParent group.
        /// </summary>
        /// <param name="guids">The asset guid's to move.</param>
        /// <param name="targetParent">The group to add the entries to.</param>
        /// <param name="createdEntries">List to add new entries to.</param>
        /// <param name="movedEntries">List to add moved entries to.</param>
        /// <param name="readOnly">Is the new entry read only.</param>
        /// <param name="postEvent">Send modification event.</param>
        /// <exception cref="ArgumentException"></exception>
        internal void CreateOrMoveEntries(IEnumerable guids, AddressableAssetGroup targetParent, List<AddressableAssetEntry> createdEntries, List<AddressableAssetEntry> movedEntries, bool readOnly = false, bool postEvent = true)
        {
            if (targetParent == null)
                throw new ArgumentException("targetParent must not be null");

            if (createdEntries == null)
                createdEntries = new List<AddressableAssetEntry>();
            if (movedEntries == null)
                movedEntries = new List<AddressableAssetEntry>();

            foreach (string guid in guids)
            {
                AddressableAssetEntry entry = FindAssetEntry(guid);
                if (entry != null)
                {
                    MoveEntry(entry, targetParent, readOnly, postEvent);
                    movedEntries.Add(entry);
                }
                else
                {
                    createdEntries.Add(CreateAndAddEntryToGroup(guid, targetParent, readOnly, postEvent));
                }
            }
        }

        private AddressableAssetEntry CreateAndAddEntryToGroup(string guid, AddressableAssetGroup targetParent, bool readOnly = false, bool postEvent = true)
        {
            AddressableAssetEntry entry = null;
            var path = AssetDatabase.GUIDToAssetPath(guid);

            if (AddressableAssetUtility.IsPathValidForEntry(path))
            {
                entry = CreateEntry(guid, path, targetParent, readOnly, postEvent);
            }
            else
            {
                //TODO:macdeng
                /*if (AssetDatabase.GetMainAssetTypeAtPath(path) != null && BuildUtility.IsEditorAssembly(AssetDatabase.GetMainAssetTypeAtPath(path).Assembly))
                    return null;*/
                entry = CreateEntry(guid, guid, targetParent, true, postEvent);
            }

            targetParent.AddAssetEntry(entry, postEvent);
            return entry;
        }

        internal AddressableAssetEntry CreateSubEntryIfUnique(string guid, string address, AddressableAssetEntry parentEntry)
        {
            if (string.IsNullOrEmpty(guid))
                return null;

            AddressableAssetEntry entry = FindAssetEntry(guid);

            if (entry == null)
            {
                entry = new AddressableAssetEntry(guid, address, parentEntry.parentGroup, true);
                entry.IsSubAsset = true;
                entry.ParentEntry = parentEntry;
                entry.BundleFileId = parentEntry.BundleFileId;
                //parentEntry.parentGroup.AddAssetEntry(entry);
                return entry;
            }

            //if the sub-entry already exists update it's info.  This mainly covers the case of dragging folders around.
            if (entry.IsSubAsset)
            {
                entry.parentGroup = parentEntry.parentGroup;
                entry.IsInResources = parentEntry.IsInResources;
                entry.address = address;
                entry.ReadOnly = true;
                entry.BundleFileId = parentEntry.BundleFileId;
                return entry;
            }
            return null;
        }

        /// <summary>
        /// Create a new asset group.
        /// </summary>
        /// <param name="groupName">The group name.</param>
        /// <param name="setAsDefaultGroup">Set the new group as the default group.</param>
        /// <param name="readOnly">Is the new group read only.</param>
        /// <param name="postEvent">Post modification event.</param>
        /// <param name="schemasToCopy">Schema set to copy from.</param>
        /// <param name="types">Types of schemas to add.</param>
        /// <returns>The newly created group.</returns>
        public AddressableAssetGroup CreateGroup(string groupName, bool readOnly, bool postEvent, List<AddressableAssetGroupSchema> schemasToCopy, params Type[] types)
        {
            if (string.IsNullOrEmpty(groupName))
                groupName = kNewGroupName;
            string validName = FindUniqueGroupName(groupName);
            var group = CreateInstance<AddressableAssetGroup>();
            group.Initialize(this, validName, GUID.Generate().ToString(), readOnly);

            if (IsPersisted)
            {
                if (!Directory.Exists(GroupFolder))
                    Directory.CreateDirectory(GroupFolder);
                AssetDatabase.CreateAsset(group, GroupFolder + "/" + group.Name + ".asset");
            }
            if (schemasToCopy != null)
            {
                foreach (var s in schemasToCopy)
                    group.AddSchema(s, false);
            }
            foreach (var t in types)
                group.AddSchema(t);

            if (!m_GroupAssets.Contains(group))
                groups.Add(group);
           
            SetDirty(ModificationEvent.GroupAdded, group, postEvent, true);
            AddressableAssetUtility.OpenAssetIfUsingVCIntegration(this);
            return group;
        }

        internal string FindUniqueGroupName(string potentialName)
        {
            var cleanedName = potentialName.Replace('/', '-');
            cleanedName = cleanedName.Replace('\\', '-');
            if (cleanedName != potentialName)
                Debug.Log("Group names cannot include '\\' or '/'.  Replacing with '-'. " + cleanedName);
            var validName = cleanedName;
            int index = 1;
            bool foundExisting = true;
            while (foundExisting)
            {
                if (index > 1000)
                {
                    Debug.LogError("Unable to create valid name for new Addressable Assets group.");
                    return cleanedName;
                }
                foundExisting = IsNotUniqueGroupName(validName);
                if (foundExisting)
                {
                    validName = cleanedName + index;
                    index++;
                }
            }

            return validName;
        }

        internal bool IsNotUniqueGroupName(string groupName)
        {
            bool foundExisting = false;
            foreach (var g in groups)
            {
                if (g != null && g.Name == groupName)
                {
                    foundExisting = true;
                    break;
                }
            }
            return foundExisting;
        }

        /// <summary>
        /// Remove an asset group.
        /// </summary>
        /// <param name="g"></param>
        public void RemoveGroup(AddressableAssetGroup g)
        {
            RemoveGroupInternal(g, true, true);
        }

        internal void RemoveGroupInternal(AddressableAssetGroup g, bool deleteAsset, bool postEvent)
        {
            g?.ClearSchemas(true);
            groups.Remove(g);
            SetDirty(ModificationEvent.GroupRemoved, g, postEvent, true);
            if (g != null && deleteAsset)
            {
                string guidOfGroup;
                long localId;
                if (AssetDatabase.TryGetGUIDAndLocalFileIdentifier(g, out guidOfGroup, out localId))
                {
                    var groupPath = AssetDatabase.GUIDToAssetPath(guidOfGroup);
                    if (!string.IsNullOrEmpty(groupPath))
                        AssetDatabase.DeleteAsset(groupPath);
                }
            }
        }

        internal void SetLabelValueForEntries(List<AddressableAssetEntry> entries, string label, bool value, bool postEvent = true)
        {
            var addedNewLabel = value && m_LabelTable.AddLabelName(label);

            foreach (var e in entries)
            {
                e.SetLabel(label, value, false, false);
                AddressableAssetUtility.OpenAssetIfUsingVCIntegration(e.parentGroup);
            }

            SetDirty(ModificationEvent.EntryModified, entries, postEvent, addedNewLabel);
            AddressableAssetUtility.OpenAssetIfUsingVCIntegration(this);
        }

        internal void OnPostprocessAllAssets(string[] importedAssets, string[] deletedAssets, string[] movedAssets, string[] movedFromAssetPaths)
        {
            var aa = this;
            bool relatedAssetChanged = false;
            bool settingsChanged = false;
            foreach (string str in importedAssets)
            {
                var assetType = AssetDatabase.GetMainAssetTypeAtPath(str);
                if (typeof(AddressableAssetSettings).IsAssignableFrom(assetType))
                {
                    var settings = AssetDatabase.LoadAssetAtPath<AddressableAssetSettings>(str);
                    if (settings != null)
                        settings.Validate();
                }
                if (typeof(AddressableAssetGroup).IsAssignableFrom(assetType))
                {
                    AddressableAssetGroup group = aa.FindGroup(Path.GetFileNameWithoutExtension(str));
                    if (group == null)
                    {
                        var foundGroup = AssetDatabase.LoadAssetAtPath<AddressableAssetGroup>(str);
                        if (!aa.groups.Contains(foundGroup))
                        {
                            aa.groups.Add(foundGroup);
                            group = aa.FindGroup(Path.GetFileNameWithoutExtension(str));
                            relatedAssetChanged = true;
                            settingsChanged = true;
                        }
                    }
                    if (group != null)
                        group.DedupeEnteries();
                }

                if (typeof(AddressableAssetEntryCollection).IsAssignableFrom(assetType))
                {
                    Debug.LogError("in valid action!"); //TODO:macdeng to be deleted.
                }

                var guid = AssetDatabase.AssetPathToGUID(str);
                if (aa.FindAssetEntry(guid) != null)
                    relatedAssetChanged = true;

                if (AddressableAssetUtility.IsInResources(str))
                    relatedAssetChanged = true;
            }

            if (deletedAssets.Length > 0)
            {
                // if any directly referenced assets were deleted while Unity was closed, the path isn't useful, so Remove(null) is our only option
                //  this can lead to orphaned schema files.
                if (groups.Remove(null) ||
                    GroupTemplateObjects.Remove(null) ||
                    InitializationObjects.Remove(null))
                {
                    relatedAssetChanged = true;
                }
            }

            foreach (string str in deletedAssets)
            {
                if (AddressableAssetUtility.IsInResources(str))
                    relatedAssetChanged = true;
                else
                {
                    if (CheckForGroupDataDeletion(str))
                    {
                        relatedAssetChanged = true;
                        settingsChanged = true;
                        continue;
                    }

                    var guidOfDeletedAsset = AssetDatabase.AssetPathToGUID(str);
                    if (aa.RemoveAssetEntry(guidOfDeletedAsset))
                    {
                        relatedAssetChanged = true;
                    }
                }
            }
            for (int i = 0; i < movedAssets.Length; i++)
            {
                var str = movedAssets[i];
                var assetType = AssetDatabase.GetMainAssetTypeAtPath(str);
                if (typeof(AddressableAssetGroup).IsAssignableFrom(assetType))
                {
                    var oldGroupName = Path.GetFileNameWithoutExtension(movedFromAssetPaths[i]);
                    var group = aa.FindGroup(oldGroupName);
                    if (group != null)
                    {
                        var newGroupName = Path.GetFileNameWithoutExtension(str);
                        group.Name = newGroupName;
                        relatedAssetChanged = true;
                    }
                }
                else
                {
                    var guid = AssetDatabase.AssetPathToGUID(str);
                    AddressableAssetEntry entry = aa.FindAssetEntry(guid);

                    bool isAlreadyAddressable = entry != null;
                    bool startedInResources = AddressableAssetUtility.IsInResources(movedFromAssetPaths[i]);
                    bool endedInResources = AddressableAssetUtility.IsInResources(str);
                    bool inEditorSceneList = BuiltinSceneCache.Contains(new GUID(guid));

                    //update entry cached path
                    entry?.SetCachedPath(str);

                    //move to Resources
                    if (isAlreadyAddressable && endedInResources)
                    {
                        var fileName = Path.GetFileNameWithoutExtension(str);
                        Debug.Log("You have moved addressable asset " + fileName + " into a Resources directory.  It has been unmarked as addressable, but can still be loaded via the Addressables API via its Resources path.");
                        aa.RemoveAssetEntry(guid, false);
                    }
                    else if (inEditorSceneList)
                        BuiltinSceneCache.ClearState();

                    //any addressables move or resources move (even resources to within resources) needs to refresh the UI.
                    relatedAssetChanged = isAlreadyAddressable || startedInResources || endedInResources || inEditorSceneList;
                }
            }

            if (relatedAssetChanged || settingsChanged)
                aa.SetDirty(ModificationEvent.BatchModification, null, true, settingsChanged);
        }

        internal bool CheckForGroupDataDeletion(string str)
        {
            if (string.IsNullOrEmpty(str))
                return false;

            bool modified = false;
            AddressableAssetGroup groupToDelete = null;
            bool deleteGroup = false;
            foreach (var group in groups)
            {
                if (group != null)
                {
                    if (AssetDatabase.GUIDToAssetPath(group.Guid) == str)
                    {
                        groupToDelete = group;
                        deleteGroup = true;
                        break;
                    }

                    if (group.Schemas.Remove(null))
                        modified = true;
                }
            }

            if (deleteGroup)
            {
                RemoveGroupInternal(groupToDelete, false, true);
                modified = true;
            }

            return modified;
        }

        static Dictionary<string, Action<IEnumerable<AddressableAssetEntry>>> s_CustomAssetEntryCommands = new Dictionary<string, Action<IEnumerable<AddressableAssetEntry>>>();
        /// <summary>
        /// Register a custom command to process asset entries.  These commands will be shown in the context menu of the groups window.
        /// </summary>
        /// <param name="cmdId">The id of the command.  This will be used for the display name of the context menu item.</param>
        /// <param name="cmdFunc">The command handler function.</param>
        /// <returns>Returns true if the command was registered.</returns>
        public static bool RegisterCustomAssetEntryCommand(string cmdId, Action<IEnumerable<AddressableAssetEntry>> cmdFunc)
        {
            if (string.IsNullOrEmpty(cmdId))
            {
                Debug.LogError("RegisterCustomAssetEntryCommand - invalid command id.");
                return false;
            }
            if (cmdFunc == null)
            {
                Debug.LogError($"RegisterCustomAssetEntryCommand - command functor for id '{cmdId}'.");
                return false;
            }
            s_CustomAssetEntryCommands[cmdId] = cmdFunc;
            return true;
        }

        /// <summary>
        /// Removes a registered custom entry command.
        /// </summary>
        /// <param name="cmdId">The command id.</param>
        /// <returns>Returns true if the command was removed.</returns>
        public static bool UnregisterCustomAssetEntryCommand(string cmdId)
        {
            if (string.IsNullOrEmpty(cmdId))
            {
                Debug.LogError("UnregisterCustomAssetEntryCommand - invalid command id.");
                return false;
            }

            if (!s_CustomAssetEntryCommands.Remove(cmdId))
            {
                Debug.LogError($"UnregisterCustomAssetEntryCommand - command id '{cmdId}' is not registered.");
                return false;
            }
            return true;
        }

        /// <summary>
        /// Invoke a registered command for a set of entries.
        /// </summary>
        /// <param name="cmdId">The id of the command.</param>
        /// <param name="entries">The entries to run the command on.</param>
        /// <returns>Returns true if the command was executed without exceptions.</returns>
        public static bool InvokeAssetEntryCommand(string cmdId, IEnumerable<AddressableAssetEntry> entries)
        {
            try
            {
                if (string.IsNullOrEmpty(cmdId) || !s_CustomAssetEntryCommands.ContainsKey(cmdId))
                {
                    Debug.LogError($"Asset Entry Command '{cmdId}' not found.  Ensure that it is registered by calling RegisterCustomAssetEntryCommand.");
                    return false;
                }
                if (entries == null)
                {
                    Debug.LogError($"Asset Entry Command '{cmdId}' called with null entry collection.");
                    return false;
                }
                s_CustomAssetEntryCommands[cmdId](entries);
                return true;
            }
            catch (Exception e)
            {
                Debug.LogError($"Encountered exception when running Asset Entry Command '{cmdId}': {e.Message}");
                return false;
            }
        }

        /// <summary>
        /// The ids of the registered commands.
        /// </summary>
        public static IEnumerable<string> CustomAssetEntryCommands => s_CustomAssetEntryCommands.Keys;

        static Dictionary<string, Action<IEnumerable<AddressableAssetGroup>>> s_CustomAssetGroupCommands = new Dictionary<string, Action<IEnumerable<AddressableAssetGroup>>>();
        /// <summary>
        /// Register a custom command to process asset groups.  These commands will be shown in the context menu of the groups window.
        /// </summary>
        /// <param name="cmdId">The id of the command.  This will be used for the display name of the context menu item.</param>
        /// <param name="cmdFunc">The command handler function.</param>
        /// <returns>Returns true if the command was registered.</returns>
        public static bool RegisterCustomAssetGroupCommand(string cmdId, Action<IEnumerable<AddressableAssetGroup>> cmdFunc)
        {
            if (string.IsNullOrEmpty(cmdId))
            {
                Debug.LogError("RegisterCustomAssetGroupCommand - invalid command id.");
                return false;
            }
            if (cmdFunc == null)
            {
                Debug.LogError($"RegisterCustomAssetGroupCommand - command functor for id '{cmdId}'.");
                return false;
            }
            s_CustomAssetGroupCommands[cmdId] = cmdFunc;
            return true;
        }

        /// <summary>
        /// Removes a registered custom group command.
        /// </summary>
        /// <param name="cmdId">The command id.</param>
        /// <returns>Returns true if the command was removed.</returns>
        public static bool UnregisterCustomAssetGroupCommand(string cmdId)
        {
            if (string.IsNullOrEmpty(cmdId))
            {
                Debug.LogError("UnregisterCustomAssetGroupCommand - invalid command id.");
                return false;
            }
            if (!s_CustomAssetGroupCommands.Remove(cmdId))
            {
                Debug.LogError($"UnregisterCustomAssetGroupCommand - command id '{cmdId}' is not registered.");
                return false;
            }
            return true;
        }

        /// <summary>
        /// Invoke a registered command for a set of groups.
        /// </summary>
        /// <param name="cmdId">The id of the command.</param>
        /// <param name="entries">The groups to run the command on.</param>
        /// <returns>Returns true if the command was invoked successfully.</returns>
        public static bool InvokeAssetGroupCommand(string cmdId, IEnumerable<AddressableAssetGroup> groups)
        {
            try
            {
                if (string.IsNullOrEmpty(cmdId) || !s_CustomAssetGroupCommands.ContainsKey(cmdId))
                {
                    Debug.LogError($"Asset Group Command '{cmdId}' not found.  Ensure that it is registered by calling RegisterCustomAssetGroupCommand.");
                    return false;
                }
                if (groups == null)
                {
                    Debug.LogError($"Asset Group Command '{cmdId}' called with null group collection.");
                    return false;
                }
                s_CustomAssetGroupCommands[cmdId](groups);
                return true;
            }
            catch (Exception e)
            {
                Debug.LogError($"Encountered exception when running Asset Group Command '{cmdId}': {e.Message}");
                return false;
            }
        }

        /// <summary>
        /// The ids of the registered commands.
        /// </summary>
        public static IEnumerable<string> CustomAssetGroupCommands => s_CustomAssetGroupCommands.Keys;
    }
}
