using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Game.Addresssables.Config
{
    public static class AddressablesConfig
    {
        //consts:
        public const string kAssetbundleOutputPath = "Assetbundles";

        public const string kCachingRootPath = "SlotsCachingV2";

        public const string kMainCatalogName = "MainCatalog.data";

        public const string kMainCatalogHashName = "MainCatalog.hash";

        public const string kSubCatalogNamePattern = "SubCatalog_{0}.data";

        public const string kMainResourceMappingName = "MainAssetGroup.mp";

        public const string kSubResourceMappingNamePattern = "SubAssetGroup_{0}.mp";

        //dynamics:
        public static string ServerAddress;
        public static string WebVersion;
        public static string GameId;
    }
}
