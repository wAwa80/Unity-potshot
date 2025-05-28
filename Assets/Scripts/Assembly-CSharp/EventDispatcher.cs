using System;
using System.Collections.Generic;
using UnityEngine;
public enum EventNameList
{
    eEventNone = 0,


    OnSuperFireVideoReward = 1,
    OnSuperFireVideoEnd = 2,//左



}
public  class EventDispatcher
{
    public enum RSEventType
    {
        rewaEvent,
        failEvent,
    }

    public static bool EnableLog = false;

    public static EventDispatcher Instance;

    public delegate void EventHandler(object data);

    private Dictionary<RSEventType, Dictionary<EventNameList, EventHandler>> eventList = new Dictionary<RSEventType, Dictionary<EventNameList, EventHandler>>();


    static EventDispatcher()
    {
        Instance = new EventDispatcher();
    }
    public bool EnableEventRewa { get; set; }

    public bool EnableEventFail { get; set; }
    private EventDispatcher()
    {
        eventList.Add(RSEventType.rewaEvent, new Dictionary<EventNameList, EventHandler>());
        eventList.Add(RSEventType.failEvent, new Dictionary<EventNameList, EventHandler>());

        EnableEventRewa = true;
        EnableEventRewa = true;
    }

    private void AddEventListener(RSEventType eventType, EventNameList eventName, EventHandler handler)
    {
        if (eventList[eventType].ContainsKey(eventName))
        {
            eventList[eventType][eventName] += handler;
        }
        else
        {
            eventList[eventType].Add(eventName, handler);
        }
    }
    private void RemoveEventListener(RSEventType eventType, EventNameList eventName, EventHandler handler)
    {
        if (eventList[eventType].ContainsKey(eventName))
        {
            eventList[eventType][eventName] -= handler;
            if (eventList[eventType][eventName] == null)
            {
                eventList[eventType].Remove(eventName);
            }
        }
        else
        {
            //Debug.Log("EventDispatch Warnning...");
        }
    }

    private void RemoveEventListenerAll(RSEventType eventType, EventNameList eventName)
    {
        if (eventList[eventType].ContainsKey(eventName))
        {
            eventList[eventType].Remove(eventName);
        }
    }

    private bool InvokeEvent(RSEventType eventType, EventNameList eventName, object data)
    {
        if (eventList[eventType].ContainsKey(eventName))
        {
            eventList[eventType][eventName].Invoke(data);
            if (EnableLog)
            {
                Debug.Log("EventDistribute Success:" + eventName);
            }

            return true;
        }

        if (EnableLog)
        {
            Debug.Log("EventDistribute Failed:" + eventName);
        }

        return false;
    }


    //rewa
    public void AddListenerRewa(EventNameList eventName, EventHandler handler)
    {
        AddEventListener(RSEventType.rewaEvent, eventName, handler);
    }

    public void RemoveListenerRewa(EventNameList eventName, EventHandler handler)
    {
        RemoveEventListener(RSEventType.rewaEvent , eventName, handler);
    }

    public void RemoveListenerRewaAll(EventNameList eventName)
    {
        RemoveEventListenerAll(RSEventType.rewaEvent, eventName);
    }

    public void InvokeRewa(EventNameList eventName, object data)
    {
        if (EnableEventRewa)
        {
            InvokeEvent(RSEventType.rewaEvent, eventName, data);
        }
    }


    //fail
    public void AddListenerFail(EventNameList eventName, EventHandler handler)
    {
        AddEventListener(RSEventType.failEvent, eventName, handler);
    }

    public void RemoveListenerFail(EventNameList eventName, EventHandler handler)
    {
        RemoveEventListener(RSEventType.failEvent, eventName, handler);
    }

    public void RemoveListenerFailAll(EventNameList eventName)
    {
        RemoveEventListenerAll(RSEventType.failEvent, eventName);
    }

    public void InvokeFail(EventNameList eventName, object data)
    {
        if (EnableEventFail)
        {
            InvokeEvent(RSEventType.failEvent, eventName, data);
        }
    }




        public static void AddEventListener(string eventType, Action handler)
	{
		EventDispatcher.m_eventController.AddEventListener(eventType, handler, false);
	}

		public static void SetEventListener(string eventType, Action handler)
	{
		EventDispatcher.m_eventController.SetEventListener(eventType, handler);
	}

		public static void AddEventListener<T>(string eventType, Action<T> handler)
	{
		EventDispatcher.m_eventController.AddEventListener<T>(eventType, handler, false);
	}

		public static void SetEventListener<T>(string eventType, Action<T> handler)
	{
		EventDispatcher.m_eventController.SetEventListener<T>(eventType, handler);
	}

		public static void AddEventListener<T, U>(string eventType, Action<T, U> handler)
	{
		EventDispatcher.m_eventController.AddEventListener<T, U>(eventType, handler, false);
	}

		public static void SetEventListener<T, U>(string eventType, Action<T, U> handler)
	{
		EventDispatcher.m_eventController.SetEventListener<T, U>(eventType, handler);
	}

		public static void RemoveEventListener(string eventType, Action handler)
	{
		EventDispatcher.m_eventController.RemoveEventListener(eventType, handler);
	}

		public static void RemoveEventListener<T>(string eventType, Action<T> handler)
	{
		EventDispatcher.m_eventController.RemoveEventListener<T>(eventType, handler);
	}

		public static void RemoveEventListener<T, U>(string eventType, Action<T, U> handler)
	{
		EventDispatcher.m_eventController.RemoveEventListener<T, U>(eventType, handler);
	}

		public static void TriggerEvent(string eventType)
	{
		EventDispatcher.m_eventController.TriggerEvent(eventType);
	}

		public static void TriggerEvent<T>(string eventType, T arg1)
	{
		EventDispatcher.m_eventController.TriggerEvent<T>(eventType, arg1);
	}

		public static void TriggerEvent<T, U>(string eventType, T arg1, U arg2)
	{
		EventDispatcher.m_eventController.TriggerEvent<T, U>(eventType, arg1, arg2);
	}

		public static void Cleanup()
	{
		EventDispatcher.m_eventController.Cleanup();
	}

		public static bool ContainsEvent(string eventType)
	{
		return EventDispatcher.m_eventController.ContainsEvent(eventType);
	}

		public static void MarkAsPermanent(string eventType)
	{
		EventDispatcher.m_eventController.MarkAsPermanent(eventType);
	}

		private static readonly EventController m_eventController = new EventController();

   
}
