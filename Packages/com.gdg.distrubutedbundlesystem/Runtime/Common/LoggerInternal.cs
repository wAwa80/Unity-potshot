using System.Diagnostics;

namespace Game.Addresssables
{
    internal static class LoggerInternal
    {
        private static string MessageHead = "[DistributeBundleSystem]";

        [Conditional("DebugBoquAddressables")]
        internal static void Log(object message)
        {
            UnityEngine.Debug.Log(MessageHead + message);
        }

        [Conditional("DebugBoquAddressables")]
        internal static void LogWarning(object message)
        {
            UnityEngine.Debug.LogWarning(MessageHead + message);
        }

        internal static void LogError(object message)
        {
            UnityEngine.Debug.LogError(MessageHead + message);
        }

        [Conditional("DebugBoquAddressables")]
        internal static void LogFormat(string format, params object[] args)
        {
            UnityEngine.Debug.LogFormat(MessageHead + format, args);
        }

        [Conditional("DebugBoquAddressables")]
        internal static void LogWarningFormat(string format, params object[] args)
        {
            UnityEngine.Debug.LogWarningFormat(MessageHead + format, args);
        }

        internal static void LogErrorFormat(string format, params object[] args)
        {
            UnityEngine.Debug.LogErrorFormat(MessageHead + format, args);
        }
    }

}
