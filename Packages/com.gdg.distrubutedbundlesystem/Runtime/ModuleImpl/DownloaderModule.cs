using Game.Addresssables.Type;
using Game.Addresssables.Utils;
using Cysharp.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Threading;
using UnityEngine;
using UnityEngine.Networking;

namespace Game.Addresssables.ModuleImpl
{
    public enum DownloadTaskState
    {
        None,
        Success,
        CrcFail,
        Canceled,
        Destroyed,
        Exceptional
    }

    public class DownloadTask
    {
        private volatile HttpWebRequest request;
        private volatile WebResponse response;

        private FileStream _stream;

        public float downloadTime;
        private volatile string Error;

        public string url;
        readonly long totalLength;
        readonly uint crc;
        readonly string cachePath;
        private readonly Action<float> onProgressValueChanged;
        readonly Action onStarted;
        readonly Action<bool> onCompleted;
        public readonly Action OnCanceled;

        public byte[] BufferRead;
        const int BufferSize = 32 * 1024;

        public CancellationTokenSource source;

        public DownloadingPriority downloadingPriority;
        public DownloadTask(CancellationTokenSource cts, string url, long totalLength, uint crc, string cachePath, Action<float> onProgressValueChanged, Action onStarted, Action<bool> onCompleted, Action onCanceled, DownloadingPriority downloadingPriority)
        {
            this.url = url;
            this.totalLength = totalLength;
            this.crc = crc;
            this.cachePath = cachePath;
            this.onProgressValueChanged = onProgressValueChanged;
            this.onStarted = onStarted;
            this.onCompleted = onCompleted;
            OnCanceled = onCanceled;
            _progress = 0;
            ProgressChanged = false;
            BufferRead = BoquBufferPool.Get(BufferSize, true);
            source = cts;
            this.downloadingPriority = downloadingPriority;
        }

        private long fileLength;
        private float _progress;
        public volatile bool ProgressChanged;
        public volatile DownloadTaskState _taskState;

        public override string ToString()
        {
            return $"uri: {Path.GetFileName(url)} downloadingPriority:{downloadingPriority}  _taskState: {_taskState}  Error: {Error}";
        }

        public void Destroy()
        {
            if (_taskState != DownloadTaskState.None)
                return;
            Error = "Destroy:" + url;
            _taskState = DownloadTaskState.Destroyed;
            request?.Abort();
            response?.Close();
            request = null;
            response = null;
            CloseStream();
        }

        public void Cancel()
        {
            if (_taskState != DownloadTaskState.None)
                return;
            Error = "下载取消:" + url;
            _taskState = DownloadTaskState.Canceled;
            request?.Abort();
            response?.Close();
            request = null;
            response = null;
            CloseStream();
        }

        private readonly object streamLock = new object();
        private void CloseStream()
        {
            lock (streamLock)
            {
                if (_stream == null) return;
                _stream.Flush();
                _stream.Close();
                _stream.Dispose();
                _stream = null;
            }
        }
        public void InvokeProgressChangedCallback()
        {
            onProgressValueChanged?.Invoke(_progress);
        }

        public async UniTaskVoid Execute()
        {
            LoggerInternal.LogFormat("downloading bundle: {0}", url);
            onStarted?.Invoke();
            _progress = 0f;

            if (_taskState == DownloadTaskState.None)
            {
                await UniTask.SwitchToThreadPool();

                var dir = Path.GetDirectoryName(cachePath);
                if (!string.IsNullOrEmpty(dir) && !Directory.Exists(dir))
                    Directory.CreateDirectory(dir);
                //GameUtils.CheckFileAndCreateDirWhenNeeded(cachePath);

                if (File.Exists(cachePath))
                {
                    FileStream fs = new FileStream(cachePath, FileMode.OpenOrCreate, FileAccess.Read);
                    if (!GameUtils.CheckCrc2(fs, crc))
                    {
                        fs.Dispose();
                        File.Delete(cachePath);
                        //LoggerInternal.Log("沙盒目录已经有这个文件，而且crc不对，删除这个文件重新下载");
                    }
                    else
                    {
                        fs.Dispose();
                        //LoggerInternal.Log("沙盒目录已经有这个文件，crc一样，不用下载了");
                        _taskState = DownloadTaskState.Success;
                    }
                }

                if (_taskState == DownloadTaskState.None)
                {
                    // 下载的临时取名文件crc，防止重名
                    var tempPath = cachePath + crc;
                    _stream = new FileStream(tempPath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                    fileLength = _stream.Length;
                    _progress = (float)fileLength / totalLength;
                    ProgressChanged = true;
                    LoggerInternal.LogFormat("file: {0}, downloaded:{1} M, remain:{2} M", cachePath, fileLength / 1048576f, (totalLength - fileLength) / 1048576f);
                    if (fileLength < totalLength)
                    {
                        _stream.Seek(fileLength, SeekOrigin.Begin);
                        try
                        {
                            System.GC.Collect();
                            LoggerInternal.LogFormat("before_create_httpwebrequet: {0}", url);
                            request = WebRequest.Create(url) as HttpWebRequest;
                            LoggerInternal.LogFormat("after_create_httpwebrequet: {0}", url);
                            request.AddRange((int)fileLength);
                            request.ServicePoint.ConnectionLimit = DownloaderModule.MaxConnectionLimit;
                            request.ServicePoint.Expect100Continue = false;
                            request.KeepAlive = true;
                            request.Proxy = null;
                            response = await request.GetResponseAsync().AsUniTask(false);
                            LoggerInternal.LogFormat("after_create_GetResponseAsync: {0}", url);
                            using (Stream stream = response.GetResponseStream())
                            {
                                int readLength = await stream.ReadAsync(BufferRead, 0, BufferSize, source.Token);
                                while (readLength > 0)
                                {
                                    if (source.IsCancellationRequested)
                                    {
                                        _taskState = DownloadTaskState.Canceled;
                                        break;
                                    }
                                    if (_taskState != DownloadTaskState.None) break;
                                    await _stream.WriteAsync(BufferRead, 0, readLength, source.Token);
                                    fileLength += readLength;
                                    _progress = (float)fileLength / totalLength;
                                    ProgressChanged = true;
                                    readLength = await stream.ReadAsync(BufferRead, 0, BufferSize, source.Token);
                                    //LoggerInternal.Log($"正在下载:  url: {url}");
                                }
                            }
                            request?.Abort();
                            response?.Close();

                            if (_taskState == DownloadTaskState.None)
                            {
                                _progress = 1;
                                ProgressChanged = true;
                                _taskState = GameUtils.CheckCrc2(_stream, crc) ? DownloadTaskState.Success : DownloadTaskState.CrcFail;
                            }
                        }
                        catch (WebException webEx)
                        {
                            if (string.IsNullOrEmpty(Error)) Error = $"下载失败 url: {url} type: WebException  webEx.Status:{webEx.Status}], message:{webEx.Message}, \nstack trace:{webEx.StackTrace}";
                            if (_taskState == DownloadTaskState.None) _taskState = DownloadTaskState.Exceptional;
                        }
                        catch (Exception Ex)
                        {
                            if (string.IsNullOrEmpty(Error)) Error = $"下载失败 url: {url} type: Exception  message:{Ex.Message}, \nstack trace:{Ex.StackTrace}";
                            if (_taskState == DownloadTaskState.None) _taskState = DownloadTaskState.Exceptional;
                        }
                    }
                    else
                    {
                        //LoggerInternal.Log($"DownloaderModule 断点续传的文件: {_taskState}  tempPath: {tempPath}");
                        _progress = 1;
                        ProgressChanged = true;
                        _taskState = GameUtils.CheckCrc2(_stream, crc) ? DownloadTaskState.Success : DownloadTaskState.CrcFail;
                    }

                    CloseStream();

                    if (_taskState == DownloadTaskState.Success)
                    {
                        File.Move(tempPath, cachePath);
                    }
                }

            }
        }

        public void Completed()
        {
            //Debug.Log($"DownloaderModule 下载完成: {this}");
            switch (_taskState)
            {
                case DownloadTaskState.Success:
                    onCompleted?.Invoke(true);
                    break;
                case DownloadTaskState.Canceled:
                    OnCanceled?.Invoke();
                    break;
                case DownloadTaskState.Destroyed:
                case DownloadTaskState.CrcFail:
                case DownloadTaskState.Exceptional:
                default:
                    //LoggerInternal.LogWarning(Error);
                    onCompleted?.Invoke(false);
                    break;
            }
        }
    }
    public class DownloaderModule
    {
        public List<DownloadTask> downloadingTaskList = new List<DownloadTask>();
        public List<DownloadTask> finishTaskList = new List<DownloadTask>();

        public readonly List<DownloadTask> pendingQueueNormal = new List<DownloadTask>();
        public readonly List<DownloadTask> pendingStackHigh = new List<DownloadTask>();
        public int normalCount = 0;
        public int highCount = 0;

        public int MaxConcurrentDownloadingTaskSizeNormal = 6;
        public int MaxConcurrentDownloadingTaskSizeHigh = 3;

        public const int MaxConnectionLimit = 50;

        public int _timeout = 10;

        private bool destroyed = false;

        private HashSet<string> Repeat = new HashSet<string>();// 检测重复下载
        public void Init()
        {
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            ServicePointManager.DefaultConnectionLimit = MaxConnectionLimit;
            ServicePointManager.Expect100Continue = false;
            _processingPendingQueue = false;
            BoquBufferPool.IsEnabled = false;
        }

        public void Destroy()
        {
            destroyed = true;
            LoggerInternal.LogFormat("downloading task list size: {0}", downloadingTaskList.Count);
            foreach (DownloadTask downloadingTask in downloadingTaskList)
            {
                downloadingTask.Destroy();
            }
            LoggerInternal.LogFormat("pending queue normal size: {0}", pendingQueueNormal.Count);
            LoggerInternal.LogFormat("pending queue high size: {0}", pendingStackHigh.Count);
        }

        private bool _processingPendingQueue;
        private async UniTaskVoid ProcessPendingQueue()
        {
            _processingPendingQueue = true;
            await UniTask.Yield();

            while (true)
            {
                if (destroyed)
                    return;
                float currTime = Time.time;

                for (int i = pendingStackHigh.Count - 1; i >= 0; i--)
                {
                    var task = pendingStackHigh[i];
                    if (task.source != null && task.source.IsCancellationRequested)
                    {
                        task.Cancel();
                    }
                    if (task._taskState != DownloadTaskState.None)
                    {
                        pendingStackHigh.Remove(task);
                        finishTaskList.Add(task);
                    }
                }

                for (int i = pendingQueueNormal.Count - 1; i >= 0; i--)
                {
                    var task = pendingQueueNormal[i];
                    if (task.source != null && task.source.IsCancellationRequested)
                    {
                        task.Cancel();
                    }
                    if (task._taskState != DownloadTaskState.None)
                    {
                        pendingQueueNormal.Remove(task);
                        finishTaskList.Add(task);
                    }
                }

                for (int i = downloadingTaskList.Count - 1; i >= 0; i--)
                {
                    var task = downloadingTaskList[i];
                    if (task.source != null && task.source.IsCancellationRequested)
                    {
                        task.Cancel();
                    }
                    if (task._taskState != DownloadTaskState.None)
                    {
                        downloadingTaskList.Remove(task);
                        finishTaskList.Add(task);
                        if (task.downloadingPriority == DownloadingPriority.Normal)
                            normalCount--;
                        else
                            highCount--;
                    }
                }

                if (finishTaskList.Count > 0)
                {
                    foreach (var t in finishTaskList)
                    {
                        t.Completed();
                        if (Repeat.Contains(t.url))
                        {
                            Repeat.Remove(t.url);
                            Debug.LogWarning($"Repeat 删除等待队列里的url：{t}");
                        }
                    }
                    finishTaskList.Clear();
                }


                if (pendingStackHigh.Count > 0 && highCount < MaxConcurrentDownloadingTaskSizeHigh)
                {
                    DownloadTask downloadingTask = pendingStackHigh[pendingStackHigh.Count - 1];
                    if (downloadingTaskList.Exists(item => item.url.Equals(downloadingTask.url)))
                    {
                        if (!Repeat.Contains(downloadingTask.url))
                        {
                            Debug.LogError($"Repeat pendingStackHigh检测下载队列正在下载这个url，等待：{downloadingTask}");
                            Repeat.Add(downloadingTask.url);
                        }
                    }
                    else
                    {
                        highCount++;
                        pendingStackHigh.Remove(downloadingTask);
                        downloadingTaskList.Add(downloadingTask);
                        downloadingTask.downloadTime = currTime;
                        downloadingTask.Execute().Forget();
                    }
                }
                if (pendingQueueNormal.Count > 0 && normalCount < MaxConcurrentDownloadingTaskSizeNormal)
                {
                    DownloadTask downloadingTask = pendingQueueNormal[0];
                    if (downloadingTaskList.Exists(item => item.url.Equals(downloadingTask.url)))
                    {
                        if (!Repeat.Contains(downloadingTask.url))
                        {
                            Debug.LogError($"Repeat pendingQueueNormal检测下载队列正在下载这个url，等待：{downloadingTask}");
                            Repeat.Add(downloadingTask.url);
                        }
                    }
                    else
                    {
                        normalCount++;
                        pendingQueueNormal.Remove(downloadingTask);
                        downloadingTaskList.Add(downloadingTask);
                        downloadingTask.downloadTime = currTime;
                        downloadingTask.Execute().Forget();
                    }
                }

                await UniTask.Yield(PlayerLoopTiming.PreUpdate);
                foreach (DownloadTask task in downloadingTaskList)
                {
                    //LoggerInternal.Log($"正在下载: {task.url}  ProgressChanged :{task.ProgressChanged}   同时下载数量： {downloadingTaskList.Count}");
                    if (task.ProgressChanged)
                    {
                        task.downloadTime = currTime;
                        task.ProgressChanged = false;
                        task.InvokeProgressChangedCallback();
                    }
                    // 因为http异步下载，这里自己实现超时
                    if (currTime - task.downloadTime > _timeout)
                    {
                        Debug.LogWarning($"下载超时, 超时时间{(int)(currTime - task.downloadTime)}  task: {task}");
                        task.Destroy();
                    }
                }
                await UniTask.Yield(PlayerLoopTiming.LastUpdate);
                if (pendingQueueNormal.Count == 0 && pendingStackHigh.Count == 0 && downloadingTaskList.Count == 0)
                {
                    _processingPendingQueue = false;
                    if (BoquBufferPool.PoolSize > 1048576)
                    {
                        BoquBufferPool.Clear();
                        GC.Collect();
                    }
                    break;
                }
            }
        }
        public void DownloadAsestBundleAsync(CancellationTokenSource cts, string url, long totalLength, uint crc, string cachePath, Action<float> onProgressValueChanged, Action onStarted, Action<bool> onCompleted, Action onCanceled, DownloadingPriority downloadingPriority)
        {
            DownloadTask downloadTask = new DownloadTask(cts, url, totalLength, crc, cachePath, onProgressValueChanged, onStarted, onCompleted, onCanceled, downloadingPriority);
            //Debug.Log($"DownloaderModule 加入下载队列: {downloadTask}");
            if (downloadingPriority == DownloadingPriority.Normal)
            {
                pendingQueueNormal.Add(downloadTask);
            }
            else
            {
                pendingStackHigh.Add(downloadTask);
            }
            if (!_processingPendingQueue)
            {
                ProcessPendingQueue().Forget();
            }
        }

        public async void LoadBytesInJarPathAsync(string url, Action<byte[]> callback)
        {
            var data = await DownloadBytes(url);
            callback?.Invoke(data);
        }

        public async UniTask<string> DownloadText(string url)
        {
            try
            {
                UnityWebRequest request = await new UnityWebRequest(url, UnityWebRequest.kHttpVerbGET, new DownloadHandlerBuffer(), null).SendWebRequest();
                if (!GameUtils.RequestHasErrors(request, out _))
                {
                    return request.downloadHandler.text;
                }
                else
                {
                    return null;
                }
            }
            catch (UnityWebRequestException)
            {
                LoggerInternal.LogFormat("file text: {0} not found", url);
                return null;
            }
        }

        public async UniTask<byte[]> DownloadBytes(string url)
        {
            try
            {
                UnityWebRequest request = await new UnityWebRequest(url, UnityWebRequest.kHttpVerbGET, new DownloadHandlerBuffer(), null).SendWebRequest();
                if (!GameUtils.RequestHasErrors(request, out _))
                {
                    return request.downloadHandler.data;
                }
                else
                {
                    return null;
                }
            }
            catch (UnityWebRequestException)
            {
                LoggerInternal.LogFormat("file text: {0} not found", url);
                return null;
            }
        }
    }
}