using System;
using UnityEngine;

namespace PathologicalGames
{
		public class RecycleItem
	{
				public RecycleItem(Transform instance, bool isSendMessage)
		{
			this.Instance = instance;
			this.IsSendMessage = isSendMessage;
		}

				public Transform Instance;

				public bool IsSendMessage;
	}
}
