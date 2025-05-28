using System;
using UnityEngine;

[ExecuteInEditMode]
public class ChangeSortingLayerAndOrder : MonoBehaviour
{
		private void Start()
	{
		base.GetComponent<Renderer>().sortingLayerID = this.Layer;
		base.GetComponent<Renderer>().sortingOrder = this.Order;
	}

		public int Layer;

		public int Order;
}
