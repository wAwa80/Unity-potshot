using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
//using KHD;
using Newtonsoft.Json;
using UnityEngine;

namespace Game.Walker
{
		public static class GameHelper
	{
				public static T ReadDataServiceRequest<T>(string dataName)
		{
			TextAsset textAsset = Resources.Load(dataName) as TextAsset;
			return JsonConvert.DeserializeObject<T>(textAsset.text);
		}

				public static T[] ReadDataArrayServiceRequest<T>(string dataName)
		{
			TextAsset textAsset = Resources.Load(dataName) as TextAsset;
			return JsonConvert.DeserializeObject<T[]>(textAsset.text);
		}

				public static T ReadUserDataServiceRequest<T>(string dataName)
		{
			string path = GameHelper.DataPath + dataName;
			if (File.Exists(path))
			{
				string text = File.ReadAllText(path);
				string value = string.Empty;
				try
				{
					byte[] bytes = Convert.FromBase64String(text);
					value = Encoding.UTF8.GetString(bytes);
				}
				catch
				{
					value = text;
				}
				return JsonConvert.DeserializeObject<T>(value);
			}
			return default(T);
		}

				public static void WriteUserDataServiceRequest<T>(string dataName, T data)
		{
			string path = GameHelper.DataPath + dataName;
			string text = JsonConvert.SerializeObject(data);
			string directoryName = Path.GetDirectoryName(path);
			if (!Directory.Exists(directoryName))
			{
				Directory.CreateDirectory(directoryName);
			}
			string contents = string.Empty;
			byte[] bytes = Encoding.UTF8.GetBytes(text);
			try
			{
				contents = Convert.ToBase64String(bytes);
			}
			catch
			{
				contents = text;
			}
			File.WriteAllText(path, contents);
		}

				public static bool IsInvaildVector(this Vector3 vec)
		{
			return float.IsNaN(vec.x) || float.IsInfinity(vec.x) || float.IsNaN(vec.y) || float.IsInfinity(vec.y) || float.IsNaN(vec.z) || float.IsInfinity(vec.z);
		}

				public static bool IsInvaildValue(this float val)
		{
			return float.IsNaN(val) || float.IsInfinity(val);
		}

				public static Vector3 ClampByMagnitude(this Vector3 vec, float maxMag)
		{
			float magnitude = vec.magnitude;
			if (magnitude > maxMag)
			{
				return vec * (maxMag / magnitude);
			}
			return vec;
		}

				public static string ToJson(this object obj)
		{
			return JsonConvert.SerializeObject(obj);
		}

				public static void UpdateAnchor(this ConfigurableJoint joint)
		{
			Debug.Log(joint.name);
			if (joint.connectedBody != null)
			{
				joint.xMotion = ConfigurableJointMotion.Locked;
				joint.yMotion = ConfigurableJointMotion.Locked;
				joint.zMotion = ConfigurableJointMotion.Locked;
				Vector3 position = joint.connectedBody.position;
				BoxCollider component = joint.connectedBody.GetComponent<BoxCollider>();
				BoxCollider component2 = joint.GetComponent<BoxCollider>();
				if (component != null && component2 != null)
				{
					position = GameHelper.GenerateJointParentAnchor(joint, component, component2);
				}
				joint.connectedAnchor = joint.connectedBody.transform.InverseTransformPoint(position);
				joint.anchor = joint.transform.InverseTransformPoint(position);
			}
			else
			{
				joint.xMotion = ConfigurableJointMotion.Free;
				joint.yMotion = ConfigurableJointMotion.Free;
				joint.zMotion = ConfigurableJointMotion.Free;
				Collider component3 = joint.GetComponent<Collider>();
				Vector3 position2 = joint.transform.position;
				position2.y += component3.bounds.size.y * 0.5f;
				joint.connectedAnchor = joint.transform.InverseTransformPoint(position2);
				joint.anchor = joint.transform.InverseTransformPoint(position2);
			}
		}

				private static Vector3 GenerateJointParentAnchor(ConfigurableJoint joint, BoxCollider parentCollider, BoxCollider collider)
		{
			Vector3 vector = parentCollider.ClosestPoint(collider.transform.TransformPoint(collider.center));
			Ray ray = default(Ray);
			string key = joint.name + "_" + joint.connectedBody.name;
			Vector3 down = Vector3.down;
			if (GameHelper.nodeRayNormals.TryGetValue(key, out down))
			{
				ray.origin = collider.transform.TransformPoint(collider.center);
				ray.direction = down;
				RaycastHit raycastHit;
				if (parentCollider.Raycast(ray, out raycastHit, 100f))
				{
					Debug.Log(raycastHit.point);
					vector = raycastHit.point;
				}
				else
				{
					Debug.Log("failed: " + vector);
				}
			}
			else
			{
				key = joint.connectedBody.name + "_" + joint.name;
				if (GameHelper.nodeRayNormals.TryGetValue(key, out down))
				{
					ray.origin = parentCollider.transform.TransformPoint(parentCollider.center);
					ray.direction = down;
					RaycastHit raycastHit;
					if (collider.Raycast(ray, out raycastHit, 10f))
					{
						Debug.Log(raycastHit.point);
						vector = raycastHit.point;
					}
					else
					{
						Debug.Log("failed: " + vector);
					}
				}
				else
				{
					ray.origin = collider.transform.TransformPoint(collider.center);
					ray.direction = Vector3.up;
					RaycastHit raycastHit;
					if (parentCollider.Raycast(ray, out raycastHit, 10f))
					{
						Debug.Log(raycastHit.point);
						vector = raycastHit.point;
					}
					else
					{
						ray.origin = parentCollider.transform.TransformPoint(parentCollider.center);
						ray.direction = Vector3.down;
						if (collider.Raycast(ray, out raycastHit, 10f))
						{
							Debug.Log(raycastHit.point);
							vector = raycastHit.point;
						}
						else
						{
							Debug.Log(vector);
						}
					}
				}
			}
			return vector;
		}

				private static Vector3 GenerateJointAnchor(ConfigurableJoint joint, Collider parentCollider, Collider collider)
		{
			Vector3 vector = collider.ClosestPoint(joint.connectedBody.position);
			Ray ray = default(Ray);
			string text = joint.name + "_" + joint.connectedBody.name;
			Vector3 down = Vector3.down;
			if (GameHelper.nodeRayNormals.TryGetValue(text, out down))
			{
				ray.origin = joint.transform.position;
				ray.direction = down;
				RaycastHit raycastHit;
				if (parentCollider.Raycast(ray, out raycastHit, 100f))
				{
					Debug.Log(raycastHit.point);
					vector = raycastHit.point;
				}
				else
				{
					Debug.Log("failed: " + vector);
				}
			}
			else
			{
				Debug.Log(text + " not exists");
				text = joint.connectedBody.name + "_" + joint.name;
				if (GameHelper.nodeRayNormals.TryGetValue(text, out down))
				{
					ray.origin = joint.connectedBody.transform.position;
					ray.direction = down;
					RaycastHit raycastHit;
					if (collider.Raycast(ray, out raycastHit, 100f))
					{
						Debug.Log(raycastHit.point);
						vector = raycastHit.point;
					}
					else
					{
						Debug.Log("failed: " + vector);
					}
				}
				else
				{
					Debug.Log(text + " not exists");
					ray.origin = joint.connectedBody.position;
					ray.direction = Vector3.down;
					RaycastHit raycastHit;
					if (collider.Raycast(ray, out raycastHit, 10f))
					{
						Debug.Log(raycastHit.point);
						vector = raycastHit.point;
					}
					else
					{
						ray.origin = joint.transform.position;
						ray.direction = Vector3.up;
						if (parentCollider.Raycast(ray, out raycastHit, 10f))
						{
							Debug.Log(raycastHit.point);
							vector = raycastHit.point;
						}
						else
						{
							Debug.Log(vector);
						}
					}
				}
			}
			return vector;
		}

				public static void ToDefault(this ConfigurableJoint joint)
		{
			joint.autoConfigureConnectedAnchor = false;
			joint.configuredInWorldSpace = false;
			joint.enablePreprocessing = false;
			joint.rotationDriveMode = RotationDriveMode.Slerp;
			joint.axis = joint.transform.InverseTransformVector(joint.transform.right);
			joint.secondaryAxis = joint.transform.InverseTransformVector(joint.transform.up);
			joint.UpdateAnchor();
			joint.angularXMotion = ConfigurableJointMotion.Locked;
			joint.angularYMotion = ConfigurableJointMotion.Locked;
			joint.angularZMotion = ConfigurableJointMotion.Locked;
			joint.projectionMode = JointProjectionMode.PositionAndRotation;
		}

				public static void ToDynamic(this ConfigurableJoint joint)
		{
			joint.autoConfigureConnectedAnchor = false;
			joint.configuredInWorldSpace = false;
			joint.enablePreprocessing = false;
			joint.rotationDriveMode = RotationDriveMode.Slerp;
			joint.axis = joint.transform.InverseTransformVector(joint.transform.right);
			joint.secondaryAxis = joint.transform.InverseTransformVector(joint.transform.up);
			joint.UpdateAnchor();
			SoftJointLimit softJointLimit = new SoftJointLimit
			{
				limit = -45f
			};
			joint.angularXMotion = ConfigurableJointMotion.Limited;
			joint.lowAngularXLimit = softJointLimit;
			softJointLimit.limit = 45f;
			joint.highAngularXLimit = softJointLimit;
			joint.angularYMotion = ConfigurableJointMotion.Locked;
			joint.angularZMotion = ConfigurableJointMotion.Locked;
			joint.projectionMode = JointProjectionMode.PositionAndRotation;
		}

				public static Vector3 AlignToGround(Vector3 position, float hight)
		{
			Vector3 start = position + Vector3.up * hight;
			Vector3 end = position + Vector3.down * hight;
			RaycastHit raycastHit;
			if (Physics.Linecast(start, end, out raycastHit, GameHelper.GroundLayerMasks, QueryTriggerInteraction.Ignore))
			{
				return raycastHit.point;
			}
			return position;
		}

				public static int GetTileIdxFromObject(GameObject obj)
		{
			Transform transform = obj.transform;
			while (!transform.name.Contains(":") && transform.parent != null)
			{
				transform = transform.parent;
			}
			string[] array = transform.name.Split(new char[]
				{
					':'
				});
			if (array.Length == 2)
			{
				return (int)short.Parse(array[1]);
			}
			return int.MaxValue;
		}

				public static Component ReplaceComponent(this GameObject go, Type type)
		{
			Component component = go.GetComponent(type);
			if (component != null)
			{
				UnityEngine.Object.Destroy(component);
			}
			return go.AddComponent(type);
		}

				public static Component GetOrAddComponent(this GameObject go, Type type)
		{
			Component component = go.GetComponent(type);
			return (!(component != null)) ? go.AddComponent(type) : component;
		}

				public static T GetOrAddComponent<T>(this GameObject go) where T : Component
		{
			T component = go.GetComponent<T>();
			return (!(component != null)) ? go.AddComponent<T>() : component;
		}

				public static T GetOrAddComponent<T>(this Transform trans) where T : Component
		{
			T component = trans.GetComponent<T>();
			return (!(component != null)) ? trans.gameObject.AddComponent<T>() : component;
		}

				public static List<T> ToList<T>(this T[] data, int index, int length)
		{
			List<T> list = new List<T>(length);
			for (int i = 0; i < length; i++)
			{
				list.Add(data[index + i]);
			}
			return list;
		}

				public static T Last<T>(this List<T> list)
		{
			return (list.Count <= 0) ? default(T) : list[list.Count - 1];
		}

				public static T First<T>(this List<T> list)
		{
			return (list.Count <= 0) ? default(T) : list[0];
		}

				public static T Last<T>(this T[] list)
		{
			return list[list.Length - 1];
		}

				public static T First<T>(this T[] list)
		{
			return list[0];
		}

						public static string DataPath
		{
			get
			{
				string text = "KBSupper".ToLower();
				if (Application.isMobilePlatform)
				{
					return Application.persistentDataPath + "/" + text + "/";
				}
				if (Application.platform == RuntimePlatform.WindowsPlayer || Application.platform == RuntimePlatform.LinuxPlayer || Application.platform == RuntimePlatform.OSXPlayer)
				{
					return Application.dataPath + "/Data/";
				}
				if (Application.platform == RuntimePlatform.OSXEditor)
				{
					int num = Application.dataPath.LastIndexOf('/');
					return Application.dataPath.Substring(0, num + 1) + text + "/";
				}
				return "c:/" + text + "/";
			}
		}

				public static float AdaptiveFov(float fov)
		{
			float num = 1f / ((float)Screen.width / (float)Screen.height);
			if (num >= 1f)
			{
				fov = Mathf.Atan(Mathf.Tan(fov * 0.0174532924f * 0.5f) * num) * 2f * 57.29578f;
			}
			return fov;
		}

				public static void PlayRewardVideo(Action reward, Action end, Action fail, string tag, string level, string prefabName)
		{
			if (GameDataManager.SuperGame)
			{
				if (reward != null)
				{
					reward();
				}
				return;
			}
			// MachbirdSDKHelper.OnRewardRequest(tag, IronSource.Agent.isRewardedVideoAvailable());
			// MachbirdSDKHelper.LogByBranch("RewardedVideo", new Dictionary<string, string>
			// 	{
			// 		{
			// 			"tag",
			// 			tag
			// 		}
			// 	});
			// MachbirdSDKHelper.LogByBranch(tag);
			EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);
			if (!GameHelper.IsConnectingNetwork())
			{
				EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
				EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
					{
						Content = Texts.String_CheckNetwork
					});
			}
			//else if (IronSourceEvents.Instance.isReadyVideoAd())
			//{
			//	IronSourceEvents.showRewardAd(reward,end);
				/*IronSourceEvents.onRewardedVideoAdOpenedEvent += delegate()
				{
					MachbirdSDKHelper.OnRewardOpen(tag);
				};
				IronSourceEvents.onRewardedVideoAdStartedEvent += delegate()
				{
					MachbirdSDKHelper.OnRewardShow(tag);
				};
				IronSourceEvents.onRewardedVideoAdClickedEvent += delegate(IronSourcePlacement isp)
				{
					MachbirdSDKHelper.OnRewardClick(tag);
				};
				IronSourceEvents.onRewardedVideoAdRewardedEvent += delegate(IronSourcePlacement isp)
				{
					MachbirdSDKHelper.OnRewardFinish(tag);
					MachbirdSDKHelper.LogByBranch("RewardedVideoSucceed", new Dictionary<string, string>
						{
							{
								"tag",
								tag
							}
						});
					MachbirdSDKHelper.LogByBranch(tag + "Succeed");
					if (reward != null)
					{
						reward(isp);
					}
				};
				if (end != null)
				{
					IronSourceEvents.onRewardedVideoAdEndedEvent += end;
					IronSourceEvents.onRewardedVideoAdClosedEvent += delegate()
					{
						MachbirdSDKHelper.OnRewardClose(tag);
						if (end != null)
						{
							end();
						}
					};
				}
				if (fail != null)
				{
					IronSourceEvents.onRewardedVideoAdShowFailedEvent += fail;
				}
				IronSource.Agent.showRewardedVideo();*/
				// GameHelper.parameters.Clear();
				// GameHelper.parameters["tag"] = tag;
				// GameHelper.parameters["level"] = level;
				// GameHelper.parameters["prefabName"] = prefabName;
				// SingletonCrossSceneAutoCreate<FlurryAnalytics>.Instance.LogEventWithParameters("RewardedVideo", GameHelper.parameters);
			//}
			else
			{
				EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
				EventDispatcher.TriggerEvent<bool, MessageBoxModel>(Texts.EventShowMessageBox, true, new MessageBoxModel
					{
						Content = Texts.String_NoVideoContent
					});
			}
		}

				public static void LogEvent(string eventName, params string[] kvs)
		{
            //TODO ��Բ�� ���ע��
            if (kvs != null && kvs.Length > 0)
            {
                GameHelper.parameters.Clear();
                for (int i = 0; i < kvs.Length; i += 2)
                {
                    GameHelper.parameters[kvs[i]] = kvs[i + 1];
                }
                //SingletonCrossSceneAutoCreate<FlurryAnalytics>.Instance.LogEventWithParameters(eventName, GameHelper.parameters);
                MachbirdSDKHelper.LogCustomEvent(eventName, GameHelper.parameters.ToJson());
            }
            else
            {
                //SingletonCrossSceneAutoCreate<FlurryAnalytics>.Instance.LogEvent(eventName);
                MachbirdSDKHelper.LogCustomEvent(eventName, "{}");
            }
        }

				public static void PlayInterstitialAd(Action listener, string tag, string level)
		{
            //HACK �岥ʽ��� ����
            return;
			if (GameDataManager.SuperGame)
			{
				if (listener != null)
				{
					listener();
				}
				return;
			}
            //UNDONE  ����AndroidAgent ctr ����������Ϸ��ͣBug
            //MachbirdSDKHelper.OnInterstitialRequest(tag, IronSource.Agent.isInterstitialReady());
			EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, true);
			GameLauncher.Instance.OnInterstitialEndListener = null;
			// if (IronSource.Agent.isInterstitialReady())
			// {
			// 	GameLauncher.Instance.OnInterstitialEndListener = delegate()
			// 	{
			// 		MachbirdSDKHelper.OnInterstitialClose(tag);
			// 		if (listener != null)
			// 		{
			// 			listener();
			// 		}
			// 	};
			// 	GameLauncher.Instance.OnInterstitialShowListener = null;
			// 	GameLauncher.Instance.OnInterstitialShowListener = delegate()
			// 	{
			// 		MachbirdSDKHelper.OnInterstitialShow(tag);
			// 	};
			// 	GameLauncher.Instance.OnInterstitialAdClickedListener = null;
			// 	GameLauncher.Instance.OnInterstitialAdClickedListener = delegate()
			// 	{
			// 		MachbirdSDKHelper.OnInterstitialClick(tag);
			// 	};
			// 	IronSource.Agent.showInterstitial();
			// 	GameHelper.parameters.Clear();
			// 	GameHelper.parameters["tag"] = tag;
			// 	GameHelper.parameters["level"] = level;
			// 	SingletonCrossSceneAutoCreate<FlurryAnalytics>.Instance.LogEventWithParameters("Interstitial", GameHelper.parameters);
			// }
			// else
			// {
			// 	EventDispatcher.TriggerEvent<bool>(Texts.EventShowLoading, false);
			// 	if (listener != null)
			// 	{
			// 		listener();
			// 	}
			// }
		}

				public static void ShowBanner()
		{
			if (!GameLauncher.Instance.IsBannerLoaded)
			{
				//IronSource.Agent.loadBanner(IronSourceBannerSize.BANNER, IronSourceBannerPosition.BOTTOM);
			}
			else
			{
				//IronSource.Agent.displayBanner();
			}
		}

				public static void HideBanner()
		{
			if (!GameLauncher.Instance.IsBannerLoaded)
			{
				//IronSource.Agent.hideBanner();
			}
		}

				public static void SetLayer(this GameObject parent, int layer, bool includeChildren = true)
		{
			parent.layer = layer;
			if (includeChildren)
			{
				foreach (Transform transform in parent.transform.GetComponentsInChildren<Transform>(true))
				{
					transform.gameObject.layer = layer;
				}
			}
		}

				public static void SetLayer(this Transform parent, int layer, bool includeChildren = true)
		{
			parent.gameObject.SetLayer(layer, includeChildren);
		}

				public static void SetActive(this Transform trans, bool state)
		{
			trans.gameObject.SetActive(state);
		}

				public static void ToDict<T>(this List<T> list, Dictionary<string, T> dict) where T : IItem
		{
			foreach (T value in list)
			{
				dict[value.id] = value;
			}
		}

				public static void ToList<T>(this Dictionary<string, T> dict, List<T> list, Func<T, bool> filter) where T : IItem
		{
			foreach (KeyValuePair<string, T> keyValuePair in dict)
			{
				if (filter == null || filter(keyValuePair.Value))
				{
					list.Add(keyValuePair.Value);
				}
			}
		}

				public static bool Contains<T>(this T[] array, T item) where T : class
		{
			foreach (T t in array)
			{
				if (t.Equals(item))
				{
					return true;
				}
			}
			return false;
		}

				public static Transform GetTransformByName(Transform parent, string name)
		{
			if (parent.name == name)
			{
				return parent;
			}
			if (parent.childCount <= 0)
			{
				return null;
			}
			Transform transform = null;
			IEnumerator enumerator = parent.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					object obj = enumerator.Current;
					Transform parent2 = (Transform)obj;
					transform = GameHelper.GetTransformByName(parent2, name);
					if (transform != null)
					{
						break;
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
			return transform;
		}

				public static bool IsConnectingNetwork()
		{
			return Application.internetReachability != NetworkReachability.NotReachable;
		}

				public const string AppName = "KBSupper";

				public const bool DebugMode = false;

				private const string userDataFile = "user.data";

				public static int GroundLayerMasks = 1 << LayerMask.NameToLayer("Tile") | 1 << LayerMask.NameToLayer("Default");

				public static int TileLayer = LayerMask.NameToLayer("Tile");

				public static int TileLayerMasks = 1 << LayerMask.NameToLayer("Tile");

				public static int UILayer = LayerMask.NameToLayer("UI");

				public static int ObjectLayer = LayerMask.NameToLayer("Objects");

				public static int ObjectLayerMasks = 1 << GameHelper.ObjectLayer;

				public static int GhostLayer = LayerMask.NameToLayer("Ghost");

				public static int GhostLayerMasks = 1 << GameHelper.GhostLayer;

				public static Dictionary<string, Vector3> nodeRayNormals = new Dictionary<string, Vector3>
		{
			{
				"Chest_Head",
				Vector3.up
			},
			{
				"Chest_Left_Upper_Arm",
				Vector3.left
			},
			{
				"Chest_Right_Upper_Arm",
				Vector3.right
			},
			{
				"Right_Upper_Leg_Hips",
				Vector3.up
			},
			{
				"Left_Upper_Leg_Hips",
				Vector3.up
			},
			{
				"Hips_Chest",
				Vector3.down
			},
			{
				"Right_Lower_Leg_Right_Foot",
				Vector3.down
			},
			{
				"Left_Lower_Leg_Left_Foot",
				Vector3.down
			}
		};

				private static Dictionary<string, string> parameters = new Dictionary<string, string>();
	}
}
