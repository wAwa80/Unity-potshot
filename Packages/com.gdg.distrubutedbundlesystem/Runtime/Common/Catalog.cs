using Game.Addresssables.Type;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;

namespace Game.Addresssables.Common
{
    public enum BundleLocation
    {
        InPackage = 0,
        InPersitent,
        Remote
    }

    [Serializable]
    public struct DependencyBundle
    {
        public DependencyBundle(string bundleName, string groupId)
        {
            this.bundleName = bundleName;
            this.groupId = groupId;
        }
        public string bundleName;
        public string groupId;
    }
    [Serializable]
    public class BundleInfo
    {
        public BundleInfo(string hashCode, long size, ChangeState changeState, BundleLocation bundleLocation, DependencyBundle[] dependencies)
        {
            this.hashCode = hashCode;
            this.size = size;
            this.changeState = changeState;
            this.bundleLocation = bundleLocation;
            this.dependencies = dependencies;
        }
        public string hashCode; //128 bit hash code
        public long size; //bytes
        public uint crc;
        public ChangeState changeState;
        public BundleLocation bundleLocation;
        public DependencyBundle[] dependencies;
    }

    [Serializable]
    public class AssetGroupInfo
    {
        public AssetGroupInfo(string hashCode, ChangeState changeState)
        {
            this.hashCode = hashCode;
            this.changeState = changeState;
        }
        public string hashCode; //128 bit hash code
        public ChangeState changeState;
    }

    [Serializable]
    public class BundleInfoDictionary : SerializableDictionary<string, BundleInfo> // key: bundle name
    {
        public BundleInfoDictionary() : base()
        {

        }

        public BundleInfoDictionary(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }

        protected override bool KeysAreEqual(string a, string b)
        {
            return a == b;
        }

        protected override bool ValuesAreEqual(BundleInfo a, BundleInfo b)
        {
            return a.hashCode == b.hashCode && a.size == b.size;
        }
    }
    
    [Serializable]
    public class BundleMappingDictionary : SerializableDictionary<string, string[]> // key: bundle name, value: asset names in the bundle
    {
        public BundleMappingDictionary() : base()
        {

        }

        public BundleMappingDictionary(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }
        protected override bool KeysAreEqual(string a, string b)
        {
            return a == b;
        }

        protected override bool ValuesAreEqual(string[] a, string[] b)
        {
            if(a.Length != b.Length)
            {
                return false;
            }
            for(int i = 0; i < a.Length; i++)
            {
                if(a[i] != b[i])
                {
                    return false;
                }
            }
            return true;
        }
    }

    [Serializable]
    public class AssetMappingDictionary : SerializableDictionary<string, string> //key: asset name, value: bundle name which contains the asset
    {
        public AssetMappingDictionary() : base()
        {

        }

        public AssetMappingDictionary(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }
        protected override bool KeysAreEqual(string a, string b)
        {
            return a == b;
        }

        protected override bool ValuesAreEqual(string a, string b)
        {
            return a == b;
        }
    }


    [Serializable]
    public class AssetGroupInfoDictionary : SerializableDictionary<string, AssetGroupInfo> //key: group id
    {
        public AssetGroupInfoDictionary() : base()
        {

        }

        public AssetGroupInfoDictionary(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }
        protected override bool KeysAreEqual(string a, string b)
        {
            return a == b;
        }

        protected override bool ValuesAreEqual(AssetGroupInfo a, AssetGroupInfo b)
        {
            return a.hashCode == b.hashCode;
        }
    }

    [Serializable]
    [StructLayout(LayoutKind.Sequential)]
    public class MainCatalog
    {
        public MainCatalog(BundleInfoDictionary mainBundleInfoMap, AssetGroupInfoDictionary additionalAssetGroupInfoMap)
        {
            this.MainBundleInfoMap = mainBundleInfoMap;
            this.additionalAssetGroupInfoMap = additionalAssetGroupInfoMap;
            isAllBundlesDownloaded = false;
        }
        private BundleInfoDictionary mainBundleInfoMap; //all bundle infos map which group id == "0"
        public BundleInfoDictionary MainBundleInfoMap { get => mainBundleInfoMap; set => mainBundleInfoMap = value; }
        public string mappingFileHash;

        public AssetGroupInfoDictionary additionalAssetGroupInfoMap; //all asset group info map which group id != "0" 
        private bool isAllBundlesDownloaded;


        public void SetMappingFileHash(string mappingFileHash)
        {
            this.mappingFileHash = mappingFileHash;
        }

        public void MarkAsDownloaded()
        {
            isAllBundlesDownloaded = true;
        }

        public bool IsAllBundlesDownloaded()
        {
            return isAllBundlesDownloaded;
        }
    }

    [Serializable]
    [StructLayout(LayoutKind.Sequential)]
    public class SubCatalog
    {
        public SubCatalog(BundleInfoDictionary bundleInfoMap)
        {
            this.bundleInfoMap = bundleInfoMap;
            isAllBundlesDownloaded = false;
        }
        public BundleInfoDictionary bundleInfoMap;
        public string mappingFileHash;
        private bool isAllBundlesDownloaded;

        public void SetMappingFileHash(string mappingFileHash)
        {
            this.mappingFileHash = mappingFileHash;
        }

        public bool IsAllBundlesDownloaded()
        {
            return isAllBundlesDownloaded;
        }

        public void SetIsAllBundlesDownloaded(bool value)
        {
            isAllBundlesDownloaded = value;
        }

        public void MarkAsDownloaded()
        {
            isAllBundlesDownloaded = true;
        }
    }

    [Serializable]
    [StructLayout(LayoutKind.Sequential)]
    public class ResourceMapping
    {
        public ResourceMapping(AssetMappingDictionary assetMapping, BundleMappingDictionary bundleMapping)
        {
            this.assetMapping = assetMapping;
            this.bundleMapping = bundleMapping;
            isValid = false;
        }
        public AssetMappingDictionary assetMapping;
        public BundleMappingDictionary bundleMapping;
        private bool isValid;
        public void Validate()
        {
            if (isValid)
            {
                LoggerInternal.LogError("already valid!!!!");
            }
            isValid = true;
        }

        public bool IsValid()
        {
            return isValid;
        }
    }

    public enum ChangeState
    {
        /// <summary>
        /// init state
        /// </summary>
        None = 0,
        /// <summary>
        /// uptodate
        /// </summary>
        Uptodate,
        /// <summary>
        /// newly added on remote server. download only
        /// </summary>
        Add,
        /// <summary>
        /// bundle/assetgroup changed on remote server. download and remove old one if it's in persistent path
        /// </summary>
        Modify,
        /// <summary>
        /// bundle/assetgroup removed on remote server. 
        /// </summary>
        Remove,
    }

    public struct CompareMainCatalogResult
    {
        public bool isMainGroupBundleChanged;
        public bool isMappingFileChanged;
        public bool isSubGroupAddedOrChanged;
        public List<string> toDeleteGroupIdList;
        public long downloadSize;
    }
}
