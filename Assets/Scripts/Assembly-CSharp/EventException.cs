using System;

[Serializable]
public class EventException : Exception
{
		public EventException(string message) : base(message)
	{
	}
}
