using Game.Addresssables.Type;
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using UnityEngine;

namespace UnityEditor.Game.AddressableAssets.Settings
{
    public class GroupEntryCache : ScriptableObject
    {
        [Serializable]
        public class CachedAssets
        {
            public CachedAssets(List<AddressableAssetEntry> value)
            {
                this.value = value;
            }
            [SerializeField]
            public List<AddressableAssetEntry> value;
        }


        [Serializable]
        public class CachedAssetsDictionary : SerializableDictionary<string, CachedAssets> // key: group guid + entry guid, value: assets
        {
            public CachedAssetsDictionary() : base()
            {

            }

            public CachedAssetsDictionary(SerializationInfo info, StreamingContext context) : base(info, context)
            {

            }

            protected override bool KeysAreEqual(string a, string b)
            {
                return a == b;
            }

            protected override bool ValuesAreEqual(CachedAssets aa, CachedAssets bb)
            {
                List<AddressableAssetEntry> a = aa.value;
                List<AddressableAssetEntry> b = bb.value;
                if (a == null && b == null)
                {
                    return true;
                }
                else if (a == null && b != null)
                {
                    return false;
                }
                else if (a != null && b == null)
                {
                    return false;
                }
                else if (a.Count != b.Count)
                {
                    return false;
                }
                else
                {
                    int count = a.Count;
                    for (int i = 0; i < count; i++)
                    {
                        if (a[i].guid != b[i].guid)
                        {
                            return false;
                        }
                    }
                    return true;
                }
            }
        }

        [SerializeField]
        CachedAssetsDictionary m_GroupEntry2AssetsMap = new CachedAssetsDictionary();
        internal CachedAssetsDictionary GroupEntry2AssetsMap
        {
            get { return m_GroupEntry2AssetsMap; }
            set { m_GroupEntry2AssetsMap = value; }
        }

        public void ForceDirty()
        {
            EditorUtility.SetDirty(this);
        }
        
    }

}
