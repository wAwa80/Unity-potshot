using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace UnityEditor.Game.AddressableAssets.Settings
{
    internal class AddressableAssetTree
    {
        internal class TreeNode
        {
            internal string Path { get; set; }
            internal bool IsAddressable { get; set; }
            public bool IsFolder { get; set; }
            internal bool HasEnumerated { get; set; }

            internal Dictionary<string, TreeNode> Children { get; set; }

            internal TreeNode(string path)
            {
                Path = path;
            }

            internal bool GetChild(string p, out TreeNode node)
            {
                if (Children != null)
                    return Children.TryGetValue(p, out node);
                node = null;
                return false;
            }

            internal void AddChild(string p, TreeNode node)
            {
                if (Children == null)
                    Children = new Dictionary<string, TreeNode>();
                Children.Add(p, node);
            }
        }

        TreeNode m_Root;

        internal AddressableAssetTree()
        {
            m_Root = new TreeNode("");
            m_Root.IsFolder = true;
        }

        IEnumerable<string> EnumAddressables(TreeNode node, bool recursive, string relativePath)
        {
            if (node.Children != null)
            {
                List<TreeNode> curDirectory = new List<TreeNode>(node.Children.Values.Where(x => !x.IsAddressable));
                curDirectory.Sort((x, y) => { return string.Compare(x.Path, y.Path); });
                string pathPrepend = string.IsNullOrEmpty(relativePath) ? "" : $"{relativePath}/";
                foreach (var v in curDirectory)
                {
                    if (!v.IsFolder)
                        yield return pathPrepend + v.Path;
                }

                if (recursive)
                {
                    foreach (var v in curDirectory)
                        if (v.Children != null)
                            foreach (string v2 in EnumAddressables(v, true, pathPrepend + v.Path))
                                yield return v2;
                }
            }
        }

        internal IEnumerable<string> Enumerate(string path, bool recursive)
        {
            TreeNode node = FindNode(path, false);
            if (node == null)
                throw new Exception($"Path {path} was not in the enumeration tree");
            if (!node.HasEnumerated)
                throw new Exception($"Path {path} cannot be enumerated because the file system has not enumerated them yet");

            return EnumAddressables(node, recursive, path);
        }

        internal TreeNode FindNode(string path, bool shouldAdd)
        {
            TreeNode it = m_Root;
            foreach (string p in path.Split('/'))
            {
                if (!it.GetChild(p, out TreeNode it2))
                {
                    if (!shouldAdd)
                        return null;
                    it2 = new TreeNode(p);
                    it.AddChild(p, it2);
                    it.IsFolder = true;
                }
                it = it2;
            }
            return it;
        }
    }

    internal class AddressablesFileEnumeration
    {
        internal static AddressableAssetTree BuildAddressableTree(AddressableAssetSettings settings)
        {
            if (!ExtractAddressablePaths(settings, out HashSet<string> paths))
                return null;

            AddressableAssetTree tree = new AddressableAssetTree();
            foreach (string path in paths)
            {
                AddressableAssetTree.TreeNode node = tree.FindNode(path, true);
                node.IsAddressable = true;
            }
            return tree;
        }

        static bool ExtractAddressablePaths(AddressableAssetSettings settings, out HashSet<string> paths)
        {
            paths = new HashSet<string>();
            bool hasAddrFolder = false;
            foreach (AddressableAssetGroup group in settings.groups)
            {
                if (group == null)
                    continue;
                foreach (AddressableAssetEntry entry in group.entries)
                {
                    string convertedPath = entry.AssetPath;
                    if (!hasAddrFolder && AssetDatabase.IsValidFolder(convertedPath))
                        hasAddrFolder = true;
                    paths.Add(convertedPath);
                }
            }
            return hasAddrFolder;
        }

        static void AddLocalFilesToTreeIfNotEnumerated(AddressableAssetTree tree, string path)
        {
            AddressableAssetTree.TreeNode pathNode = tree.FindNode(path, true);

            if (pathNode == null || pathNode.HasEnumerated) // Already enumerated
                return;

            pathNode.HasEnumerated = true;
            foreach (string filename in Directory.EnumerateFileSystemEntries(path, "*.*", SearchOption.AllDirectories))
            {
                if (!AddressableAssetUtility.IsPathValidForEntry(filename) || string.IsNullOrEmpty(AssetDatabase.AssetPathToGUID(filename)))
                    continue;
                string convertedPath = filename.Replace('\\', '/');
                var node = tree.FindNode(convertedPath, true);
                node.IsFolder = AssetDatabase.IsValidFolder(filename);
                node.HasEnumerated = true;
            }
        }

        internal class AddressablesFileEnumerationScope : IDisposable
        {
            AddressableAssetTree m_PrevTree;
            internal AddressablesFileEnumerationScope(AddressableAssetTree tree)
            {
                m_PrevTree = m_PrecomputedTree;
                m_PrecomputedTree = tree;
            }

            public void Dispose()
            {
                m_PrecomputedTree = m_PrevTree;
            }
        }

        internal class AddressablesFileEnumerationCache : IDisposable
        {
            internal AddressablesFileEnumerationCache(AddressableAssetSettings settings, bool prepopulateAssetsFolder)
            {
                BeginPrecomputedEnumerationSession(settings, prepopulateAssetsFolder);
            }

            public void Dispose()
            {
                EndPrecomputedEnumerationSession();
            }
        }

        internal static AddressableAssetTree m_PrecomputedTree;

        static void BeginPrecomputedEnumerationSession(AddressableAssetSettings settings, bool prepopulateAssetsFolder)
        {
            m_PrecomputedTree = BuildAddressableTree(settings);
            if (m_PrecomputedTree != null && prepopulateAssetsFolder)
                AddLocalFilesToTreeIfNotEnumerated(m_PrecomputedTree, "Assets");
        }

        static void EndPrecomputedEnumerationSession()
        {
            m_PrecomputedTree = null;
        }

        public static List<string> EnumerateAddressableFolder(string path, AddressableAssetSettings settings, bool recurseAll)
        {
            if (!AssetDatabase.IsValidFolder(path))
                throw new Exception($"Path {path} cannot be enumerated because it does not exist");

            AddressableAssetTree tree = m_PrecomputedTree != null ? m_PrecomputedTree : BuildAddressableTree(settings);
            if (tree == null)
                return new List<string>();

            AddLocalFilesToTreeIfNotEnumerated(tree, path);

            List<string> files = new List<string>();
            foreach (string file in tree.Enumerate(path, recurseAll))
            {
                if (BuiltinSceneCache.Contains(file))
                    continue;
                files.Add(file);
            }
            return files;
        }
    }
}
