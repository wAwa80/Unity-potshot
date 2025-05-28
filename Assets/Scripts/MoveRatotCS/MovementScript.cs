using System;
using UnityEngine;

public class MovementScript : MonoBehaviour
{
    private void Start()
    {
        this.rot = UnityEngine.Random.Range(this.rotVal.x, this.rotVal.y);
        if (this.X)
        {
            iTween.MoveBy(base.gameObject, iTween.Hash(new object[]
            {
                "x",
                this.moveXVal,
                "easeType",
                "Linear",
                "loopType",
                "pingPong",
                "time",
                this.moveTime
            }));
        }
        else if (this.Y)
        {
            iTween.MoveBy(base.gameObject, iTween.Hash(new object[]
            {
                "y",
                this.moveYVal,
                "easeType",
                "Linear",
                "loopType",
                "pingPong",
                "time",
                this.moveTime
            }));
        }
        else if (this.Z)
        {
            iTween.MoveBy(base.gameObject, iTween.Hash(new object[]
            {
                "z",
                this.moveZVal,
                "easeType",
                "Linear",
                "loopType",
                "pingPong",
                "time",
                this.moveTime
            }));
        }
    }

    private void Update()
    {
        if (this.rotateZ)
        {
            base.transform.Rotate(Vector3.forward * this.rot * Time.deltaTime);
        }
        else if (this.rotateX)
        {
            base.transform.Rotate(Vector3.right * this.rot * Time.deltaTime);
        }
        else if (this.rotateY)
        {
            base.transform.Rotate(Vector3.up * this.rot * Time.deltaTime);
        }
    }
    [Header("旋转轴X")]
    public bool rotateX;
    [Header("旋转轴Y")]
    public bool rotateY;
    [Header("旋转轴Z")]
    public bool rotateZ;
    [Header("移动位置X")]
    public bool X;
    [Header("移动位置Y")]
    public bool Y;
    [Header("移动位置Z")]
    public bool Z;
    [Header("旋转速度范围")]
    public Vector2 rotVal;
    [Header("移动偏移量X")]
    public float moveXVal;
    [Header("移动偏移量Y")]
    public float moveYVal;
    [Header("移动偏移量Z")]
    public float moveZVal;
    [Header("移动所需时间")]
    public float moveTime;

    private float rot;

    private float moveX;

    private float moveY;

    public bool dontDestroy;
}
