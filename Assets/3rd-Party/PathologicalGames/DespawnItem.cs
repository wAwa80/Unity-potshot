using System;
using UnityEngine;

namespace PathologicalGames
{
		public class DespawnItem
	{
				public DespawnItem(Transform instance, float seconds, bool useParent, Transform parent)
		{
			this.Instance = instance;
			this.Seconds = seconds;
			this.UseParent = useParent;
			this.Parent = parent;
		}

				public Transform Instance;

				public float Seconds;

				public bool UseParent;

				public Transform Parent;
	}
}
