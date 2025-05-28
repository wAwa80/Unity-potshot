using Game.Addresssables.Utils;
using UnityEngine;

namespace Game.Addresssables.Serializer
{
    public static class FileHashSerializer
    {
        public static void Serialize(string source, string outputFile, bool fromFile = true)
        {
            string hashString;
            if (fromFile)
            {
                Hash128 hash = new Hash128();
                byte[] bytes = GameUtils.SafeReadAllBytes(source);
                HashUtilities.ComputeHash128(bytes, ref hash);
                hashString = hash.ToString();
            }
            else
            {
                hashString = source;
            }
            GameUtils.SafeWriteAllText(outputFile, hashString);
        }
    }
}
