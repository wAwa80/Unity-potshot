using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace PathologicalGames
{
        [AddComponentMenu("Path-o-logical/PoolManager/SpawnPool")]
    public sealed class SpawnPool : MonoBehaviour
    {
                                public bool dontDestroyOnLoad
        {
            get
            {
                return this._dontDestroyOnLoad;
            }
            set
            {
                this._dontDestroyOnLoad = value;
                if (this.group != null)
                {
                    UnityEngine.Object.DontDestroyOnLoad(this.group.gameObject);
                }
            }
        }

                                public Transform group { get; private set; }

                private void Awake()
        {
            if (this._dontDestroyOnLoad)
            {
                UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
            }
            this.group = base.transform;
            if (this.poolName == string.Empty)
            {
                this.poolName = this.group.name.Replace("Pool", string.Empty);
                this.poolName = this.poolName.Replace("(Clone)", string.Empty);
            }
            if (this.logMessages)
            {
                Debug.Log(string.Format("SpawnPool {0}: Initializing..", this.poolName));
            }
            for (int i = 0; i < this._perPrefabPoolOptions.Count; i++)
            {
                if (this._perPrefabPoolOptions[i].prefab == null)
                {
                    Debug.LogWarning(string.Format("Initialization Warning: Pool '{0}' contains a PrefabPool with no prefab reference. Skipping.", this.poolName));
                }
                else
                {
                    this._perPrefabPoolOptions[i].inspectorInstanceConstructor();
                    this.CreatePrefabPool(this._perPrefabPoolOptions[i]);
                }
            }
            PoolManager.Pools.Add(this);
        }

                private void OnDestroy()
        {
            if (this.logMessages)
            {
                Debug.Log(string.Format("SpawnPool {0}: Destroying...", this.poolName));
            }
            if (PoolManager.Pools.ContainsKey(this.poolName))
            {
                PoolManager.Pools.Remove(this);
            }
            base.StopAllCoroutines();
            this.Clear();
        }

                private void LateUpdate()
        {
            if (this.despawnItems.Count > 0)
            {
                for (int i = this.despawnItems.Count - 1; i >= 0; i--)
                {
                    DespawnItem item = this.despawnItems[i];
                    if (this.DoUpdateDespawn(item))
                    {
                        this.despawnItems.RemoveAt(i);
                    }
                }
            }
            foreach (KeyValuePair<string, PrefabPool> keyValuePair in this._prefabPools)
            {
                keyValuePair.Value.DoUpdate();
            }
        }

                public void CreatePrefabPool(PrefabPool prefabPool)
        {
            if (this.GetPrefabPool(prefabPool.prefab) == null)
            {
                prefabPool.spawnPool = this;
                this._prefabPools.Add(prefabPool.prefab.name, prefabPool);
                this.prefabs._Add(prefabPool.prefab.name, prefabPool.prefab);
            }
            if (!prefabPool.preloaded)
            {
                if (this.logMessages)
                {
                    Debug.Log(string.Format("SpawnPool {0}: Preloading {1} {2}", this.poolName, prefabPool.preloadAmount, prefabPool.prefab.name));
                }
                prefabPool.PreloadInstances();
            }
        }

                public void Add(Transform instance, string prefabName, bool despawn, bool parent)
        {
            PrefabPool prefabPool = null;
            if (this._prefabPools.TryGetValue(prefabName, out prefabPool) && prefabPool.prefabGO != null)
            {
                prefabPool.AddUnpooled(instance, despawn);
                if (this.logMessages)
                {
                    Debug.Log(string.Format("SpawnPool {0}: Adding previously unpooled instance {1}", this.poolName, instance.name));
                }
                if (parent)
                {
                    instance.parent = this.group;
                }
                if (!despawn)
                {
                    this._spawnedInfos.Add(instance.GetHashCode(), prefabName);
                }
                return;
            }
            if (prefabPool != null && prefabPool.prefabGO == null)
            {
                Debug.LogError("Unexpected Error: PrefabPool.prefabGO is null");
            }
            else
            {
                Debug.LogError(string.Format("SpawnPool {0}: PrefabPool {1} not found.", this.poolName, prefabName));
            }
        }

                public void Add(Transform item)
        {
            string message = "Use SpawnPool.Spawn() to properly add items to the pool.";
            throw new NotImplementedException(message);
        }

                public void Remove(Transform item)
        {
            string message = "Use Despawn() to properly manage items that should remain in the pool but be deactivated.";
            throw new NotImplementedException(message);
        }

                public Transform Spawn(Transform prefab, Vector3 pos, Quaternion rot, Transform parent, bool autoActive)
        {
            PrefabPool prefabPool = null;
            Transform transform;
            if (!this._prefabPools.TryGetValue(prefab.name, out prefabPool) || !(prefabPool.prefabGO == prefab.gameObject))
            {
                PrefabPool prefabPool2 = new PrefabPool(prefab);
                this.CreatePrefabPool(prefabPool2);
                transform = prefabPool2.SpawnInstance(pos, rot, autoActive);
                if (parent != null)
                {
                    transform.parent = parent;
                }
                else
                {
                    transform.parent = this.group;
                }
                this._spawnedInfos.Add(transform.GetHashCode(), prefab.name);
                transform.gameObject.BroadcastMessage("OnSpawned", this, SendMessageOptions.DontRequireReceiver);
                return transform;
            }
            transform = prefabPool.SpawnInstance(pos, rot, autoActive);
            if (transform == null)
            {
                return null;
            }
            if (parent != null)
            {
                transform.parent = parent;
            }
            else if (!this.dontReparent && transform.parent != this.group)
            {
                transform.parent = this.group;
            }
            this._spawnedInfos.Add(transform.GetHashCode(), prefab.name);
            transform.gameObject.BroadcastMessage("OnSpawned", this, SendMessageOptions.DontRequireReceiver);
            return transform;
        }

                public Transform Spawn(Transform prefab, Vector3 pos, Quaternion rot, bool autoActive = true)
        {
            Transform transform = this.Spawn(prefab, pos, rot, null, autoActive);
            if (transform == null)
            {
                return null;
            }
            return transform;
        }

                public Transform Spawn(Transform prefab)
        {
            return this.Spawn(prefab, Vector3.zero, Quaternion.identity, true);
        }

                public Transform Spawn(Transform prefab, Transform parent)
        {
            return this.Spawn(prefab, Vector3.zero, Quaternion.identity, parent);
        }

                public Transform Spawn(GameObject prefab, Vector3 pos, Quaternion rot, Transform parent)
        {
            return this.Spawn(prefab.transform, pos, rot, parent);
        }

                public Transform Spawn(GameObject prefab, Vector3 pos, Quaternion rot)
        {
            return this.Spawn(prefab.transform, pos, rot, true);
        }

                public Transform Spawn(GameObject prefab)
        {
            return this.Spawn(prefab.transform);
        }

                public Transform Spawn(GameObject prefab, Transform parent)
        {
            return this.Spawn(prefab.transform, parent);
        }

                public Transform Spawn(string prefabName)
        {
            Transform prefab = this.prefabs[prefabName];
            return this.Spawn(prefab);
        }

                public Transform Spawn(string prefabName, Transform parent)
        {
            Transform prefab = this.prefabs[prefabName];
            return this.Spawn(prefab, parent);
        }

                public Transform Spawn(string prefabName, Vector3 pos, Quaternion rot, bool autoActive)
        {
            Transform prefab = this.prefabs[prefabName];
            return this.Spawn(prefab, pos, rot, autoActive);
        }

                public Transform Spawn(string prefabName, Vector3 pos, Quaternion rot, Transform parent)
        {
            Transform prefab = this.prefabs[prefabName];
            return this.Spawn(prefab, pos, rot, parent);
        }

                public AudioSource Spawn(AudioSource prefab, Vector3 pos, Quaternion rot)
        {
            return this.Spawn(prefab, pos, rot, null);
        }

                public AudioSource Spawn(AudioSource prefab)
        {
            return this.Spawn(prefab, Vector3.zero, Quaternion.identity, null);
        }

                public AudioSource Spawn(AudioSource prefab, Transform parent)
        {
            return this.Spawn(prefab, Vector3.zero, Quaternion.identity, parent);
        }

                public AudioSource Spawn(AudioSource prefab, Vector3 pos, Quaternion rot, Transform parent)
        {
            Transform transform = this.Spawn(prefab.transform, pos, rot, parent);
            if (transform == null)
            {
                return null;
            }
            AudioSource component = transform.GetComponent<AudioSource>();
            component.Play();
            base.StartCoroutine(this.ListForAudioStop(component));
            return component;
        }

                public ParticleSystem Spawn(ParticleSystem prefab, Vector3 pos, Quaternion rot)
        {
            return this.Spawn(prefab, pos, rot, null);
        }

                public ParticleSystem Spawn(ParticleSystem prefab, Vector3 pos, Quaternion rot, Transform parent)
        {
            Transform transform = this.Spawn(prefab.transform, pos, rot, parent);
            if (transform == null)
            {
                return null;
            }
            ParticleSystem component = transform.GetComponent<ParticleSystem>();
            base.StartCoroutine(this.ListenForEmitDespawn(component));
            return component;
        }

                //TODO 未引用
        //public ParticleEmitter Spawn(ParticleEmitter prefab, Vector3 pos, Quaternion rot)
        //{
        //    Transform transform = this.Spawn(prefab.transform, pos, rot, true);
        //    if (transform == null)
        //    {
        //        return null;
        //    }
        //    ParticleAnimator component = transform.GetComponent<ParticleAnimator>();
        //    if (component != null)
        //    {
                
        //        component.autodestruct = false;
        //    }
        //    ParticleEmitter component2 = transform.GetComponent<ParticleEmitter>();
        //    component2.emit = true;
        //    base.StartCoroutine(this.ListenForEmitDespawn(component2));
        //    return component2;
        //}

                //TODO 未引用
        //public ParticleEmitter Spawn(ParticleEmitter prefab, Vector3 pos, Quaternion rot, string colorPropertyName, Color color)
        //{
        //    Transform transform = this.Spawn(prefab.transform, pos, rot, true);
        //    if (transform == null)
        //    {
        //        return null;
        //    }
        //    ParticleAnimator component = transform.GetComponent<ParticleAnimator>();
        //    if (component != null)
        //    {
        //        component.autodestruct = false;
        //    }
        //    ParticleEmitter component2 = transform.GetComponent<ParticleEmitter>();
        //    component2.GetComponent<Renderer>().material.SetColor(colorPropertyName, color);
        //    component2.emit = true;
        //    base.StartCoroutine(this.ListenForEmitDespawn(component2));
        //    return component2;
        //}

                public void Despawn(Transform instance)
        {
            int hashCode = instance.GetHashCode();
            bool flag = false;
            string key = null;
            if (this._spawnedInfos.TryGetValue(hashCode, out key))
            {
                PrefabPool prefabPool = null;
                if (this._prefabPools.TryGetValue(key, out prefabPool))
                {
                    if (prefabPool._spawned.Contains(hashCode))
                    {
                        flag = prefabPool.DespawnInstance(instance);
                    }
                    else if (prefabPool._despawned.Contains(hashCode))
                    {
                        Debug.LogError(string.Format("SpawnPool {0}: {1} has already been despawned. You cannot despawn something more than once!", this.poolName, instance.name));
                        return;
                    }
                }
            }
            if (!flag)
            {
                Debug.LogError(string.Format("SpawnPool {0}: {1} not found in SpawnPool", this.poolName, instance.name));
                return;
            }
            this._spawnedInfos.Remove(hashCode);
        }

                public void Despawn(Transform instance, Transform parent)
        {
            instance.parent = parent;
            this.Despawn(instance);
        }

                public void Despawn(Transform instance, float seconds)
        {
            if (seconds <= 0f)
            {
                this.DoDespawn(instance, false, null);
            }
            else
            {
                this.despawnItems.Add(new DespawnItem(instance, seconds, false, null));
            }
        }

                public void Despawn(Transform instance, float seconds, Transform parent)
        {
            if (seconds <= 0f)
            {
                this.DoDespawn(instance, true, parent);
            }
            else
            {
                this.despawnItems.Add(new DespawnItem(instance, seconds, true, parent));
            }
        }

                private IEnumerator DoDespawnAfterSeconds(Transform instance, float seconds, bool useParent, Transform parent)
        {
            GameObject go = instance.gameObject;
            while (seconds > 0f)
            {
                yield return null;
                if (!go.activeInHierarchy)
                {
                    if (go.activeSelf && this.IsSpawned(instance))
                    {
                        Debug.LogWarning(string.Format("{0} DoDespawnAfterSeconds is break ? ", go.name));
                    }
                    yield break;
                }
                seconds -= Time.deltaTime;
            }
            if (useParent)
            {
                this.Despawn(instance, parent);
            }
            else
            {
                this.Despawn(instance);
            }
            yield break;
        }

                private void DoDespawn(Transform instance, bool useParent, Transform parent)
        {
            if (useParent)
            {
                this.Despawn(instance, parent);
            }
            else
            {
                this.Despawn(instance);
            }
        }

                private bool DoUpdateDespawn(DespawnItem item)
        {
            Transform instance = item.Instance;
            if (instance == null)
            {
                Debug.LogWarning(string.Format("DoUpdateDespawn instance is null ? {0}", item));
                return true;
            }
            GameObject gameObject = instance.gameObject;
            if (item.Seconds >= 0f)
            {
                if (!gameObject.activeInHierarchy)
                {
                    if (gameObject.activeSelf && this.IsSpawned(instance))
                    {
                        Debug.LogWarning(string.Format("{0} DoDespawnAfterSeconds is break ? {1}", instance, item.Seconds));
                        this.DoDespawn(instance, item.UseParent, item.Parent);
                        return true;
                    }
                    return false;
                }
                else
                {
                    item.Seconds -= Time.deltaTime;
                }
            }
            if (item.Seconds <= 0f)
            {
                this.DoDespawn(instance, item.UseParent, item.Parent);
                return true;
            }
            return false;
        }

                public bool IsSpawned(Transform instance)
        {
            return this._spawnedInfos.ContainsKey(instance.GetHashCode());
        }

                public PrefabPool GetPrefabPool(Transform prefab)
        {
            PrefabPool prefabPool = null;
            if (this._prefabPools.TryGetValue(prefab.name, out prefabPool))
            {
                if (prefabPool.prefabGO == null)
                {
                    Debug.LogError(string.Format("SpawnPool {0}: PrefabPool.prefabGO is null", this.poolName));
                }
                return prefabPool;
            }
            return null;
        }

                public PrefabPool GetPrefabPool(GameObject prefab)
        {
            PrefabPool prefabPool = null;
            if (this._prefabPools.TryGetValue(prefab.name, out prefabPool))
            {
                if (prefabPool.prefabGO == null)
                {
                    Debug.LogError(string.Format("SpawnPool {0}: PrefabPool.prefabGO is null", this.poolName));
                }
                return prefabPool;
            }
            return null;
        }

                public Transform GetPrefab(Transform instance)
        {
            string key = null;
            int hashCode = instance.GetHashCode();
            if (this._spawnedInfos.TryGetValue(hashCode, out key))
            {
                PrefabPool prefabPool = null;
                if (this._prefabPools.TryGetValue(key, out prefabPool) && prefabPool.Contains(hashCode))
                {
                    return prefabPool.prefab;
                }
            }
            return null;
        }

                public GameObject GetPrefab(GameObject instance)
        {
            string key = null;
            int hashCode = instance.transform.GetHashCode();
            if (this._spawnedInfos.TryGetValue(hashCode, out key))
            {
                PrefabPool prefabPool = null;
                if (this._prefabPools.TryGetValue(key, out prefabPool) && prefabPool.Contains(hashCode))
                {
                    return prefabPool.prefabGO;
                }
            }
            return null;
        }

                private IEnumerator ListForAudioStop(AudioSource src)
        {
            yield return null;
            while (src.isPlaying)
            {
                yield return null;
            }
            this.Despawn(src.transform);
            yield break;
        }

                //未引用
        //private IEnumerator ListenForEmitDespawn(ParticleEmitter emitter)
        //{
        //    yield return null;
        //    yield return new WaitForEndOfFrame();
        //    float safetimer = 0f;
        //    while (emitter.particleCount > 0)
        //    {
        //        safetimer += Time.deltaTime;
        //        if (safetimer > this.maxParticleDespawnTime)
        //        {
        //            Debug.LogWarning(string.Format("SpawnPool {0}: Timed out while listening for all particles to die. Waited for {1}sec.", this.poolName, this.maxParticleDespawnTime));
        //        }
        //        yield return null;
        //    }
        //    emitter.emit = false;
        //    this.Despawn(emitter.transform);
        //    yield break;
        //}

                private IEnumerator ListenForEmitDespawn(ParticleSystem emitter)
        {
            yield return new WaitForSeconds(emitter.startDelay + 0.25f);
            float safetimer = 0f;
            while (emitter.IsAlive(true))
            {
                if (!PoolManagerUtils.activeInHierarchy(emitter.gameObject))
                {
                    emitter.Clear(true);
                    yield break;
                }
                safetimer += Time.deltaTime;
                if (safetimer > this.maxParticleDespawnTime)
                {
                    Debug.LogWarning(string.Format("SpawnPool {0}: Timed out while listening for all particles to die. Waited for {1}sec.", this.poolName, this.maxParticleDespawnTime));
                }
                yield return null;
            }
            this.Despawn(emitter.transform);
            yield break;
        }

                public int IndexOf(Transform item)
        {
            throw new NotImplementedException();
        }

                public void Insert(int index, Transform item)
        {
            throw new NotImplementedException();
        }

                public void RemoveAt(int index)
        {
            throw new NotImplementedException();
        }

                public void Clear()
        {
            if (this.logMessages)
            {
                Debug.Log(string.Format("SpawnPool {0}: Destroying...", this.poolName));
            }
            this._spawnedInfos.Clear();
            foreach (PrefabPool prefabPool in this._prefabPools.Values)
            {
                prefabPool.SelfDestruct();
            }
            this._prefabPools.Clear();
            this.prefabs._Clear();
            this.despawnItems.Clear();
        }

                        public bool IsReadOnly
        {
            get
            {
                throw new NotImplementedException();
            }
        }

                public void RecycleDespawned()
        {
            foreach (PrefabPool prefabPool in this._prefabPools.Values)
            {
                prefabPool.RecycleDespawned();
            }
        }

                public string poolName = string.Empty;

                public bool matchPoolScale;

                public bool matchPoolLayer;

                public bool dontReparent;

                public bool _dontDestroyOnLoad;

                public bool logMessages;

                public List<PrefabPool> _perPrefabPoolOptions = new List<PrefabPool>();

                public Dictionary<object, bool> prefabsFoldOutStates = new Dictionary<object, bool>();

                public List<DespawnItem> despawnItems = new List<DespawnItem>();

                public float maxParticleDespawnTime = 300f;

                public PrefabsDict prefabs = new PrefabsDict();

                public Dictionary<object, bool> _editorListItemStates = new Dictionary<object, bool>();

                private Dictionary<string, PrefabPool> _prefabPools = new Dictionary<string, PrefabPool>();

                internal Dictionary<int, string> _spawnedInfos = new Dictionary<int, string>();
    }
}
