using System;
using System.Collections.Generic;
using UnityEngine;

public class EventController
{
		private List<Delegate> GetHandlers(string eventType, bool clear = false)
	{
		List<Delegate> list;
		if (!this.m_listeners.TryGetValue(eventType, out list))
		{
			list = new List<Delegate>();
			this.m_listeners[eventType] = list;
		}
		else if (clear)
		{
			list.Clear();
		}
		return list;
	}

		public void AddEventListener(string eventType, Action handler, bool clear = false)
	{
		this.OnListenerAdding(eventType, handler);
		List<Delegate> handlers = this.GetHandlers(eventType, clear);
		handlers.Add(handler);
	}

		public void SetEventListener(string eventType, Action handler)
	{
		this.AddEventListener(eventType, handler, true);
	}

		public void AddEventListener<T>(string eventType, Action<T> handler, bool clear = false)
	{
		this.OnListenerAdding(eventType, handler);
		List<Delegate> handlers = this.GetHandlers(eventType, false);
		handlers.Add(handler);
	}

		public void SetEventListener<T>(string eventType, Action<T> handler)
	{
		this.AddEventListener<T>(eventType, handler, true);
	}

		public void AddEventListener<T, U>(string eventType, Action<T, U> handler, bool clear = false)
	{
		this.OnListenerAdding(eventType, handler);
		List<Delegate> handlers = this.GetHandlers(eventType, clear);
		handlers.Add(handler);
	}

		public void SetEventListener<T, U>(string eventType, Action<T, U> handler)
	{
		this.AddEventListener<T, U>(eventType, handler, true);
	}

		public void RemoveEventListener(string eventType, Action handler)
	{
		if (this.OnListenerRemoving(eventType, handler))
		{
			List<Delegate> handlers = this.GetHandlers(eventType, false);
			handlers.Remove(handler);
			this.OnListenerRemoved(eventType);
		}
	}

		public void RemoveEventListener<T>(string eventType, Action<T> handler)
	{
		if (this.OnListenerRemoving(eventType, handler))
		{
			List<Delegate> handlers = this.GetHandlers(eventType, false);
			handlers.Remove(handler);
			this.OnListenerRemoved(eventType);
		}
	}

		public void RemoveEventListener<T, U>(string eventType, Action<T, U> handler)
	{
		if (this.OnListenerRemoving(eventType, handler))
		{
			List<Delegate> handlers = this.GetHandlers(eventType, false);
			handlers.Remove(handler);
			this.OnListenerRemoved(eventType);
		}
	}

		public void TriggerEvent(string eventType)
	{
		List<Delegate> list;
		if (this.m_listeners.TryGetValue(eventType, out list))
		{
			if (list == null)
			{
				return;
			}
			for (int i = 0; i < list.Count; i++)
			{
				Action action = list[i] as Action;
				if (action == null)
				{
					throw new EventException(string.Format("Triggering event '{0}' but listeners have a different signature.", eventType));
				}
                try
                {
                    action();
                }
                catch (Exception ex)
                {
                    Debug.LogError(ex.StackTrace + "|" + ex.Message);
                }
            }
        }
	}

		public void TriggerEvent<T>(string eventType, T arg1)
	{
		List<Delegate> list;
		if (this.m_listeners.TryGetValue(eventType, out list))
		{
			if (list == null)
			{
				return;
			}
			for (int i = 0; i < list.Count; i++)
			{
				Action<T> action = list[i] as Action<T>;
				if (action == null)
				{
					throw new EventException(string.Format("Triggering event '{0}' but listeners have a different signature.", eventType));
				}
				try
				{
					action(arg1);
				}
				catch (Exception arg2)
				{
					Debug.LogError(string.Format("Event:{0}, {1} ==> {2}", eventType, arg1, arg2));
				}
			}
		}
	}

		public void TriggerEvent<T, U>(string eventType, T arg1, U arg2)
	{
		List<Delegate> list;
		if (this.m_listeners.TryGetValue(eventType, out list))
		{
			if (list == null)
			{
				return;
			}
			for (int i = 0; i < list.Count; i++)
			{
				Action<T, U> action = list[i] as Action<T, U>;
				if (action == null)
				{
					throw new EventException(string.Format("Triggering event '{0}' but listeners have a different signature.", eventType));
				}
				try
				{
					action(arg1, arg2);
				}
				catch (Exception ex)
				{
					Debug.LogError(ex.Message + "\n" + ex.StackTrace);
				}
			}
		}
	}

		public void Cleanup()
	{
		List<string> list = new List<string>();
		foreach (KeyValuePair<string, List<Delegate>> keyValuePair in this.m_listeners)
		{
			bool flag = false;
			foreach (string b in this.m_permanentEvents)
			{
				if (keyValuePair.Key == b)
				{
					flag = true;
					break;
				}
			}
			if (!flag)
			{
				list.Add(keyValuePair.Key);
			}
		}
		foreach (string key in list)
		{
			this.m_listeners.Remove(key);
		}
	}

		public bool ContainsEvent(string eventType)
	{
		return this.m_listeners.ContainsKey(eventType);
	}

		public void MarkAsPermanent(string eventType)
	{
		this.m_permanentEvents.Add(eventType);
	}

		private void OnListenerAdding(string eventType, Delegate listenerBeingAdded)
	{
		List<Delegate> list;
		if (this.m_listeners.TryGetValue(eventType, out list) && list.Count > 0 && list[0].GetType() != listenerBeingAdded.GetType())
		{
			throw new EventException(string.Format("Attempting to add listener with inconsistent signature for event type {0}. Current listeners have type {1} and listener being added has type {2}", eventType, list[0].GetType().Name, listenerBeingAdded.GetType().Name));
		}
	}

		private bool OnListenerRemoving(string eventType, Delegate listenerBeingRemoved)
	{
		List<Delegate> list;
		if (this.m_listeners.TryGetValue(eventType, out list) && list.Count > 0 && list[0].GetType() != listenerBeingRemoved.GetType())
		{
			throw new EventException(string.Format("Attempting to add listener with inconsistent signature for event type {0}. Current listeners have type {1} and listener being added has type {2}", eventType, list[0].GetType().Name, listenerBeingRemoved.GetType().Name));
		}
		return true;
	}

		private void OnListenerRemoved(string eventType)
	{
		if (this.m_listeners.ContainsKey(eventType) && this.m_listeners[eventType] == null)
		{
			this.m_listeners.Remove(eventType);
		}
	}

		private List<string> m_permanentEvents = new List<string>();

		private Dictionary<string, List<Delegate>> m_listeners = new Dictionary<string, List<Delegate>>();
}
