using System;
using System.Collections;
using System.Collections.Specialized;
using UnityEngine;

namespace PathologicalGames
{
		[Serializable]
	public class PrefabPool
	{
				public PrefabPool(Transform prefab)
		{
			this.prefab = prefab;
			this.prefabGO = prefab.gameObject;
		}

				public PrefabPool()
		{
		}

						public bool logMessages
		{
			get
			{
				if (this.forceLoggingSilent)
				{
					return false;
				}
				if (this.spawnPool.logMessages)
				{
					return this.spawnPool.logMessages;
				}
				return this._logMessages;
			}
		}

				internal void inspectorInstanceConstructor()
		{
			this.prefabGO = this.prefab.gameObject;
			this._spawned = new OrderedDictionary();
			this._despawned = new OrderedDictionary();
			this.lastSpawnTime = Time.time;
		}

				internal bool IsSpawnExpired()
		{
			return Time.time - this.lastSpawnTime > this.ExpiredTime + Time.fixedDeltaTime;
		}

				internal void CleanupDespawnedInstances()
		{
			IDictionaryEnumerator enumerator = this._despawned.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					Transform transform = ((DictionaryEntry)obj).Value as Transform;
					if (transform != null)
					{
						UnityEngine.Object.Destroy(transform.gameObject);
					}
				}
			}
			finally
			{
				IDisposable disposable;
				if ((disposable = (enumerator as IDisposable)) != null)
				{
					disposable.Dispose();
				}
			}
			this._despawned.Clear();
		}

				internal void SelfDestruct()
		{
			this.prefab = null;
			this.prefabGO = null;
			this.spawnPool = null;
			IDictionaryEnumerator enumerator = this._despawned.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					Transform transform = ((DictionaryEntry)obj).Value as Transform;
					if (transform != null)
					{
						UnityEngine.Object.Destroy(transform.gameObject);
					}
				}
			}
			finally
			{
				IDisposable disposable;
				if ((disposable = (enumerator as IDisposable)) != null)
				{
					disposable.Dispose();
				}
			}
			IDictionaryEnumerator enumerator2 = this._spawned.GetEnumerator();
			try
			{
				while (enumerator2.MoveNext())
				{
					object obj2 = enumerator2.Current;
					Transform transform2 = ((DictionaryEntry)obj2).Value as Transform;
					if (transform2 != null)
					{
						UnityEngine.Object.Destroy(transform2.gameObject);
					}
				}
			}
			finally
			{
				IDisposable disposable2;
				if ((disposable2 = (enumerator2 as IDisposable)) != null)
				{
					disposable2.Dispose();
				}
			}
			this._spawned.Clear();
			this._despawned.Clear();
			this.lastSpawnTime = 0f;
		}

						public int totalCount
		{
			get
			{
				int num = 0;
				num += this._spawned.Count;
				return num + this._despawned.Count;
			}
		}

								internal bool preloaded
		{
			get
			{
				return this._preloaded;
			}
			private set
			{
				this._preloaded = value;
			}
		}

				internal bool DespawnInstance(Transform xform)
		{
			return this.DespawnInstance(xform, true);
		}

				internal bool DespawnInstance(Transform xform, bool sendEventMessage)
		{
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): Despawning '{2}'", this.spawnPool.poolName, this.prefab.name, xform.name));
			}
			this._spawned.Remove(xform.GetHashCode());
			if (sendEventMessage)
			{
				try
				{
					xform.gameObject.BroadcastMessage("OnDespawning", this.spawnPool, SendMessageOptions.DontRequireReceiver);
				}
				catch (Exception ex)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): Despawning '{2} Exception: {3}'", new object[]
					{
						this.spawnPool.poolName,
						this.prefab.name,
						xform.name,
						ex
					}));
				}
			}
			this.DoUpdateRecycle(xform, sendEventMessage);
			return true;
		}

				internal void DoUpdateRecycle(Transform xform, bool sendEventMessage)
		{
			if (xform == null)
			{
				if (this.logMessages)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): DoDespawnRecycle '{2}' xform is null", this.spawnPool.poolName, this.prefab.name, xform.name));
				}
				return;
			}
			this._despawned.Add(xform.GetHashCode(), xform);
			if (sendEventMessage)
			{
				xform.gameObject.BroadcastMessage("OnDespawned", this.spawnPool, SendMessageOptions.DontRequireReceiver);
			}
			PoolManagerUtils.SetActive(xform.gameObject, false);
			this.lastSpawnTime = Time.time;
		}

				internal void DoCullDespawned()
		{
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING TRIGGERED! Waiting {2}sec to begin checking for despawns...", this.spawnPool.poolName, this.prefab.name, this.cullDelay));
			}
			if (Time.time - this.lastCullTime < (float)this.cullDelay)
			{
				return;
			}
			this.lastCullTime = Time.time;
			if (this.totalCount > this.cullAbove)
			{
				for (int i = 0; i < this.cullMaxPerPass; i++)
				{
					if (this.totalCount <= this.cullAbove)
					{
						break;
					}
					if (this._despawned.Count > 0)
					{
						Transform transform = this._despawned[0] as Transform;
						this._despawned.RemoveAt(0);
						UnityEngine.Object.Destroy(transform.gameObject);
						if (this.logMessages)
						{
							Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING to {2} instances. Now at {3}.", new object[]
							{
								this.spawnPool.poolName,
								this.prefab.name,
								this.cullAbove,
								this.totalCount
							}));
						}
					}
					else if (this.logMessages)
					{
						Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING waiting for despawn. Checking again in {2}sec", this.spawnPool.poolName, this.prefab.name, this.cullDelay));
						break;
					}
				}
			}
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING FINISHED! Stopping", this.spawnPool.poolName, this.prefab.name));
			}
			this.cullingActive = false;
		}

				internal void DoUpdate()
		{
			if (!this.cullingActive && this.cullDespawned && this.totalCount > this.cullAbove)
			{
				this.cullingActive = true;
				this.DoCullDespawned();
			}
			if (this.IsSpawnExpired() && this._despawned.Count > 0)
			{
				this.CleanupDespawnedInstances();
				this.lastSpawnTime = Time.time;
			}
		}

				internal IEnumerator DoDespawnRecycle(Transform xform, bool sendEventMessage)
		{
			if (xform == null)
			{
				if (this.logMessages)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): DoDespawnRecycle '{2}' xform is null", this.spawnPool.poolName, this.prefab.name, xform.name));
				}
				yield break;
			}
			this._despawned.Add(xform.GetHashCode(), xform);
			if (sendEventMessage)
			{
				xform.gameObject.BroadcastMessage("OnDespawned", this.spawnPool, SendMessageOptions.DontRequireReceiver);
			}
			PoolManagerUtils.SetActive(xform.gameObject, false);
			if (!this.cullingActive && this.cullDespawned && this.totalCount > this.cullAbove)
			{
				this.cullingActive = true;
				IEnumerator enumerator = this.CullDespawned();
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					yield return obj;
				}
			}
			this.lastSpawnTime = Time.time;
			yield break;
		}

				internal IEnumerator CullDespawned()
		{
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING TRIGGERED! Waiting {2}sec to begin checking for despawns...", this.spawnPool.poolName, this.prefab.name, this.cullDelay));
			}
			yield return new WaitForSeconds((float)this.cullDelay);
			while (this.totalCount > this.cullAbove)
			{
				for (int i = 0; i < this.cullMaxPerPass; i++)
				{
					if (this.totalCount <= this.cullAbove)
					{
						break;
					}
					if (this._despawned.Count > 0)
					{
						Transform transform = this._despawned[0] as Transform;
						this._despawned.RemoveAt(0);
						UnityEngine.Object.Destroy(transform.gameObject);
						if (this.logMessages)
						{
							Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING to {2} instances. Now at {3}.", new object[]
							{
								this.spawnPool.poolName,
								this.prefab.name,
								this.cullAbove,
								this.totalCount
							}));
						}
					}
					else if (this.logMessages)
					{
						Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING waiting for despawn. Checking again in {2}sec", this.spawnPool.poolName, this.prefab.name, this.cullDelay));
						break;
					}
				}
				yield return new WaitForSeconds((float)this.cullDelay);
			}
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): CULLING FINISHED! Stopping", this.spawnPool.poolName, this.prefab.name));
			}
			this.cullingActive = false;
			yield return null;
			yield break;
		}

				internal void RecycleDespawned()
		{
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): RECYCLE TRIGGERED! ", this.spawnPool.poolName, this.prefab.name));
			}
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): RECYCLE FINISHED! Stopping", this.spawnPool.poolName, this.prefab.name));
			}
		}

				internal Transform SpawnInstance(Vector3 pos, Quaternion rot, bool autoActive)
		{
			if (this.limitInstances && this.limitFIFO && this._spawned.Count >= this.limitAmount)
			{
				Transform transform = this._spawned[0] as Transform;
				if (this.logMessages)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): LIMIT REACHED! FIFO=True. Calling despawning for {2}...", this.spawnPool.poolName, this.prefab.name, transform));
				}
				this.DespawnInstance(transform);
				this.spawnPool._spawnedInfos.Remove(transform.GetHashCode());
			}
			Transform transform2;
			if (this._despawned.Count == 0)
			{
				transform2 = this.SpawnNew(pos, rot);
			}
			else
			{
				transform2 = (this._despawned[0] as Transform);
				this._despawned.RemoveAt(0);
				if (transform2 == null)
				{
					string message = "Make sure you didn't delete a despawned instance directly. " + this.prefab.name;
					Debug.LogWarning(message);
					transform2 = this.SpawnNew(pos, rot);
				}
				this._spawned.Add(transform2.GetHashCode(), transform2);
				if (this.logMessages)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): respawning '{2}'.", this.spawnPool.poolName, this.prefab.name, transform2.name));
				}
				transform2.position = pos;
				transform2.rotation = rot;
				if (autoActive)
				{
					PoolManagerUtils.SetActive(transform2.gameObject, true);
				}
			}
			this.lastSpawnTime = Time.time;
			return transform2;
		}

				public Transform SpawnNew()
		{
			return this.SpawnNew(Vector3.zero, Quaternion.identity);
		}

				public Transform SpawnNew(Vector3 pos, Quaternion rot)
		{
			if (this.limitInstances && this.totalCount >= this.limitAmount)
			{
				if (this.logMessages)
				{
					Debug.Log(string.Format("SpawnPool {0} ({1}): LIMIT REACHED! Not creating new instances! (Returning null)", this.spawnPool.poolName, this.prefab.name));
				}
				return null;
			}
			if (pos == Vector3.zero)
			{
				pos = this.spawnPool.group.position;
			}
			if (rot == Quaternion.identity)
			{
				rot = this.spawnPool.group.rotation;
			}
			Transform transform = UnityEngine.Object.Instantiate<Transform>(this.prefab, pos, rot);
			this.nameInstance(transform);
			if (!this.spawnPool.dontReparent)
			{
				transform.parent = this.spawnPool.group;
			}
			if (this.spawnPool.matchPoolScale)
			{
				transform.localScale = Vector3.one;
			}
			if (this.spawnPool.matchPoolLayer)
			{
				this.SetRecursively(transform, this.spawnPool.gameObject.layer);
			}
			this._spawned.Add(transform.GetHashCode(), transform);
			if (this.logMessages)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): Spawned new instance '{2}'.", this.spawnPool.poolName, this.prefab.name, transform.name));
			}
			this.lastSpawnTime = Time.time;
			return transform;
		}

				private void SetRecursively(Transform xform, int layer)
		{
			xform.gameObject.layer = layer;
			IEnumerator enumerator = xform.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					Transform xform2 = (Transform)obj;
					this.SetRecursively(xform2, layer);
				}
			}
			finally
			{
				IDisposable disposable;
				if ((disposable = (enumerator as IDisposable)) != null)
				{
					disposable.Dispose();
				}
			}
		}

				internal void AddUnpooled(Transform inst, bool despawn)
		{
			this.nameInstance(inst);
			if (despawn)
			{
				PoolManagerUtils.SetActive(inst.gameObject, false);
				this._despawned.Add(inst.GetHashCode(), inst);
				this.lastSpawnTime = Time.time;
			}
			else
			{
				this._spawned.Add(inst.GetHashCode(), inst);
				this.lastSpawnTime = Time.time;
			}
		}

				internal void PreloadInstances()
		{
			if (this.preloaded)
			{
				Debug.Log(string.Format("SpawnPool {0} ({1}): Already preloaded! You cannot preload twice. If you are running this through code, make sure it isn't also defined in the Inspector.", this.spawnPool.poolName, this.prefab.name));
				return;
			}
			if (this.prefab == null)
			{
				Debug.LogError(string.Format("SpawnPool {0} ({1}): Prefab cannot be null.", this.spawnPool.poolName, this.prefab.name));
				return;
			}
			if (this.limitInstances && this.preloadAmount > this.limitAmount)
			{
				Debug.LogWarning(string.Format("SpawnPool {0} ({1}): You turned ON 'Limit Instances' and entered a 'Limit Amount' greater than the 'Preload Amount'! Setting preload amount to limit amount.", this.spawnPool.poolName, this.prefab.name));
				this.preloadAmount = this.limitAmount;
			}
			if (this.cullDespawned && this.preloadAmount > this.cullAbove)
			{
				Debug.LogWarning(string.Format("SpawnPool {0} ({1}): You turned ON Culling and entered a 'Cull Above' threshold greater than the 'Preload Amount'! This will cause the culling feature to trigger immediatly, which is wrong conceptually. Only use culling for extreme situations. See the docs.", this.spawnPool.poolName, this.prefab.name));
			}
			if (this.preloadTime)
			{
				if (this.preloadFrames > this.preloadAmount)
				{
					Debug.LogWarning(string.Format("SpawnPool {0} ({1}): Preloading over-time is on but the frame duration is greater than the number of instances to preload. The minimum spawned per frame is 1, so the maximum time is the same as the number of instances. Changing the preloadFrames value...", this.spawnPool.poolName, this.prefab.name));
					this.preloadFrames = this.preloadAmount;
				}
				this.spawnPool.StartCoroutine(this.PreloadOverTime());
			}
			else
			{
				this.forceLoggingSilent = true;
				for (int i = 0; i < this.preloadAmount; i++)
				{
					Transform xform = this.SpawnNew();
					this.DespawnInstance(xform, false);
				}
				this.forceLoggingSilent = false;
			}
		}

				private IEnumerator PreloadOverTime()
		{
			yield return new WaitForSeconds(this.preloadDelay);
			int amount = this.preloadAmount - this.totalCount;
			if (amount <= 0)
			{
				yield break;
			}
			int remainder = amount % this.preloadFrames;
			int numPerFrame = amount / this.preloadFrames;
			this.forceLoggingSilent = true;
			for (int i = 0; i < this.preloadFrames; i++)
			{
				int numThisFrame = numPerFrame;
				if (i == this.preloadFrames - 1)
				{
					numThisFrame += remainder;
				}
				for (int j = 0; j < numThisFrame; j++)
				{
					Transform inst = this.SpawnNew();
					if (inst != null)
					{
						this.DespawnInstance(inst, false);
					}
					yield return null;
				}
				if (this.totalCount > this.preloadAmount)
				{
					break;
				}
			}
			this.forceLoggingSilent = false;
			yield break;
		}

				public bool Contains(int hashCode)
		{
			bool flag = this._spawned.Contains(hashCode);
			return flag || this._despawned.Contains(hashCode);
		}

				public bool Contains(Transform transform)
		{
			if (this.prefabGO == null)
			{
				Debug.LogError(string.Format("SpawnPool {0}: PrefabPool.prefabGO is null", this.spawnPool.poolName));
			}
			int hashCode = transform.GetHashCode();
			return this.Contains(hashCode);
		}

				private void nameInstance(Transform instance)
		{
			instance.name += (this.totalCount + 1).ToString("#000");
		}

				public Transform prefab;

				internal GameObject prefabGO;

				public int preloadAmount = 1;

				public bool preloadTime;

				public int preloadFrames = 2;

				public float preloadDelay;

				public bool limitInstances;

				public int limitAmount = 100;

				public bool limitFIFO;

				public bool cullDespawned;

				public int cullAbove = 50;

				public int cullDelay = 60;

				public int cullMaxPerPass = 5;

				private float lastCullTime;

				public bool _logMessages;

				private bool forceLoggingSilent;

				public SpawnPool spawnPool;

				private bool cullingActive;

				internal OrderedDictionary _spawned = new OrderedDictionary();

				private float lastSpawnTime;

				public float ExpiredTime = 30f;

				internal OrderedDictionary _despawned = new OrderedDictionary();

				private bool _preloaded;
	}
}
