using Game.Addresssables.Utils;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Game.Addresssables.Serializer
{
    public static class ObjectSerializer
    {
        public static void Serialize<T>(T ToSerialized, string outputFile)
        {
            GameUtils.CheckFileAndCreateDirWhenNeeded(outputFile);
            FileStream fs = File.OpenWrite(outputFile);
            BinaryFormatter formatter = new BinaryFormatter();
            try
            {
                formatter.Serialize(fs, ToSerialized);
            }
            catch (SerializationException e)
            {
                LoggerInternal.LogErrorFormat("Failed to serialize: {0}", e.Message);
                throw;
            }
            finally
            {
                fs.Close();
            }
        } 
    }
}
