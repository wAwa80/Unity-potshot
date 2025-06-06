﻿namespace Game.Addresssables.AsyncOperations
{
    /// <summary>
    /// Options for IAsyncOperations status values
    /// </summary>
    public enum AsyncOperationStatus
    {
        /// <summary>
        /// Use to indicate that the operation is still in progress.
        /// </summary>
        None,
        /// <summary>
        /// Use to indicate that the operation succeeded.
        /// </summary>
        Succeeded,
        /// <summary>
        /// Use to indicate that the operation failed.
        /// </summary>
        Failed
    }
}
