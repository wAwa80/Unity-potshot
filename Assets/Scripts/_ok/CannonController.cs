using EZCameraShake;
using Game.Walker;
using System;
using System.Collections;
using UnityEngine;

public class CannonController : MonoBehaviour
{
    public Animation animation { get; set; }

    public GameObject CurrentAvatar { get; set; }

    public void LoadAvatar(string id)
    {
        Debug.Log("id::" + id);
        base.StartCoroutine(this.SetupCannon(id));
    }

    private IEnumerator SetupCannon(string id)
    {
        //UNdone 射线失效？

        this.IsOnContinuousFire = false;
        this.ContinuousFireTimeTemp = 0f;
        this.isChangingAvatar = true;
        if (this.CurrentAvatar)
        {
            if (this.avatarInfo != null && !string.IsNullOrEmpty(this.avatarInfo.DeadAnimationName) && this.animation != null)
            {
                Debug.Log("CURRENTaVATAR::" + this.CurrentAvatar + "::" + this.avatarInfo.DeadAnimationName);
                this.animation.Play(this.avatarInfo.DeadAnimationName);
                yield return new WaitForSeconds(1f);
            }
            UnityEngine.Object.Destroy(this.CurrentAvatar);
        }
        GameObject prefab = Resources.Load<GameObject>(Texts.AvatarPath + id);
        this.CurrentAvatar = UnityEngine.Object.Instantiate<GameObject>(prefab, base.transform.position, base.transform.rotation);
        this.CurrentAvatar.transform.parent = base.transform;
        this.animation = this.CurrentAvatar.GetComponent<Animation>();
        IEnumerator enumerator = this.CurrentAvatar.transform.GetEnumerator();
        try
        {
            while (enumerator.MoveNext())
            {
                //undone 射线失效
                object obj = enumerator.Current;
                Transform transform = (Transform)obj;

                //undone 场景加载后不动，显示为一级场景，射线无效
                //                Base(UnityEngine.Transform)
                //UnityEngine.Debug:Log(Object)
                //< SetupCannon > c__Iterator0:MoveNext()(at Assets / Scripts / Assembly - CSharp / CannonController.cs:55)
                //UnityEngine.MonoBehaviour:StartCoroutine(IEnumerator)
                //CannonController: LoadAvatar(String)(at Assets / Scripts / Assembly - CSharp / CannonController.cs:23)
                //CannonController: Start()(at Assets / Scripts / Assembly - CSharp / CannonController.cs:192)

                if (transform.name.Contains("Turret"))
                {
                    this.barrel = transform;
                    IEnumerator enumerator2 = this.barrel.GetEnumerator();
                    try
                    {
                        while (enumerator2.MoveNext())
                        {
                            object obj2 = enumerator2.Current;
                            Transform transform2 = (Transform)obj2;
                            if (transform2.name == "ef_00")
                            {
                                this.extraSpawnPoint = transform2;
                            }
                            else if (transform2.name == "ef_01")
                            {
                                this.spawnPoint = transform2;
                            }
                            else if (transform2.name == "ef_02")
                            {
                                this.firePoint = transform2;
                            }
                        }
                    }
                    finally
                    {
                        IDisposable disposable;
                        if ((disposable = (enumerator2 as IDisposable)) != null)
                        {
                            disposable.Dispose();
                        }
                    }
                }
                else if (transform.name == "ef_00")
                {
                    this.extraSpawnPoint = transform;
                }
                else if (transform.name == "ef_01")
                {
                    this.spawnPoint = transform;
                }
                else if (transform.name == "ef_02")
                {
                    this.firePoint = transform;
                }
            }
        }
        finally
        {
            IDisposable disposable2;
            if ((disposable2 = (enumerator as IDisposable)) != null)
            {
                disposable2.Dispose();
            }
        }
        this.avatarInfo = GameDataManager.AvatarInfoDatas[GameDataManager.PlayerAvatarIds.IndexOf(id)];
        if (this.avatarInfo.FireCount > 1)
        {
            this.spawnPoints = new Transform[this.avatarInfo.FireCount - 1];
            for (int i = 0; i < this.avatarInfo.FireCount - 1; i++)
            {
                string str = (i + 1 <= 10) ? ("0" + (i + 1)) : (i + 1).ToString();
                this.spawnPoints[i] = GameHelper.GetTransformByName(this.CurrentAvatar.transform, "ef_01_" + str);
            }
        }
        if (this.avatarInfo.FireEffectCount > 1)
        {
            this.firePoints = new Transform[this.avatarInfo.FireEffectCount - 1];
            for (int j = 0; j < this.avatarInfo.FireEffectCount - 1; j++)
            {
                string str2 = (j + 1 <= 10) ? ("0" + (j + 1)) : (j + 1).ToString();
                this.firePoints[j] = GameHelper.GetTransformByName(this.CurrentAvatar.transform, "ef_02_" + str2);
            }
        }
        this.bulletPrefab = Resources.Load<GameObject>(this.avatarInfo.EffectBullet);
        if (!string.IsNullOrEmpty(this.avatarInfo.EffectMuzzle))
        {
            this.muzzlePrefab = Resources.Load<GameObject>(this.avatarInfo.EffectMuzzle);
        }
        else
        {
            this.muzzlePrefab = null;
        }
        this.superFireCannonEffectPrefab = Resources.Load<GameObject>(this.avatarInfo.SuperFireCannonEffect);
        if (this.superFireCannonEffect != null)
        {
            UnityEngine.Object.Destroy(this.superFireCannonEffect);
        }
        this.superFireCannonEffect = UnityEngine.Object.Instantiate<GameObject>(this.superFireCannonEffectPrefab, base.transform.position, base.transform.rotation);
        this.superFireCannonEffect.SetActive(this.isSuperFireReady);
        this.shoot = Resources.Load<AudioClip>(this.avatarInfo.SoundFire);
        if (this.avatarInfo != null)
        {
            if (!string.IsNullOrEmpty(this.avatarInfo.SpawnEffectPath))
            {
                GameObject obj3 = UnityEngine.Object.Instantiate<GameObject>(Resources.Load<GameObject>(this.avatarInfo.SpawnEffectPath), base.transform.position, base.transform.rotation);
                UnityEngine.Object.Destroy(obj3, 0.5f);
            }
            if (!string.IsNullOrEmpty(this.avatarInfo.SpawnAnimationName))
            {
                this.animation.Play(this.avatarInfo.SpawnAnimationName);
                yield return new WaitForSeconds(1f);
            }
        }
        this.isChangingAvatar = false;
        yield return null;
        //print("测试5");
        yield break;
    }

    private Rigidbody SetupBall(GameObject prefab, bool isSuper = false)
    {
        GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(prefab, base.transform.position, base.transform.rotation);
        Rigidbody orAddComponent = gameObject.GetOrAddComponent<Rigidbody>();
        orAddComponent.collisionDetectionMode = CollisionDetectionMode.ContinuousDynamic;
        gameObject.GetOrAddComponent<SphereCollider>();
        AudioSource orAddComponent2 = gameObject.GetOrAddComponent<AudioSource>();
        BallHitEffect orAddComponent3 = gameObject.GetOrAddComponent<BallHitEffect>();
        orAddComponent3.IsSuper = isSuper;
        for (int i = 0; i < this.avatarInfo.SoundHit.Length; i++)
        {
            string path = this.avatarInfo.SoundHit[i];
            orAddComponent3.HitSounds.Add(Resources.Load<AudioClip>(path));
        }
        GameWorld.Instance.cacheAliveBalls[gameObject.GetHashCode()] = gameObject;
        return orAddComponent;
    }

    private void Start()
    {
        EventDispatcher.AddEventListener(Texts.EventOnFireDownStay, new Action(this.OnFireDownStay));
        EventDispatcher.AddEventListener<bool>(Texts.EventSuperFireReady, new Action<bool>(this.OnSuperFireReady));
        this.aS = base.GetComponent<AudioSource>();
        this.camera = Camera.main;
        this.camera.fieldOfView = GameHelper.AdaptiveFov(this.defaultFov);
        this.LoadAvatar(GameMenu.Instance.CurrentAvatarId);
        this.BallText.transform.localPosition = new Vector3(-45, -72, -10);
    }

    private void OnFireDownStay()
    {
        if (!this.isChangingAvatar && GameMenu.Instance.state == GameState.Playing && this.start && Input.GetMouseButtonDown(0))
        {
            if (this.noOfBalls <= 0)
            {
                return;
            }
            this.UpdateAim();
            if (!this.IsOnContinuousFire)
            {
                if (GameMenu.Instance.IsSuperFireState)
                {
                    ShakeManager.HeavyShake();
                    if (!string.IsNullOrEmpty(GameMenu.Instance.CurrentSuperFireInfo.EffectMuzzle))
                    {
                        GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectMuzzle), this.firePoint.position, this.firePoint.rotation);
                        gameObject.transform.LookAt(this.firePos);
                        UnityEngine.Object.Destroy(gameObject, 2f);
                    }
                    if (!this.avatarInfo.DisableFireShake)
                    {
                        this.animation.Play(Texts.AnimationAvatarFire);
                    }
                    this.aS.clip = Resources.Load<AudioClip>(GameMenu.Instance.CurrentSuperFireInfo.SoundFire);
                    this.aS.Play();
                    if (!this.avatarInfo.DisableFireShake)
                    {
                        CameraShaker.Instance.ShakeOnce(1.5f, 1.5f, 0f, 0.5f);
                    }
                    switch (GameMenu.Instance.CurrentSuperFireInfo.SuperFireType)
                    {
                        case SuperFireType.BigBullet:
                            {
                                Rigidbody rigidbody = this.SetupBall(Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet), true);
                                rigidbody.transform.position = this.spawnPoint.position;
                                rigidbody.transform.LookAt(this.firePos);
                                rigidbody.AddForce(rigidbody.transform.forward * this.force * 1000f * 15f);
                                GameMenu.Instance.OnSuperFireOver();
                                break;
                            }
                        case SuperFireType.ManyBullets:
                            base.StartCoroutine(this.FireManyBullets(this.firePos));
                            break;
                        case SuperFireType.Laser:
                            base.StartCoroutine(this.FireLaser(this.firePos));
                            break;
                        case SuperFireType.Hole:
                            base.StartCoroutine(this.FireHole(this.firePos));
                            break;
                        case SuperFireType.ContinuousFire:
                            base.StartCoroutine(this.FireContinuousFire());
                            break;
                    }
                }
                else
                {
                    this.FireNormalBullet();
                    this.BallsReduce();
                }
            }
        }
    }

    private void UpdateAim()
    {
        float a = Screen.height * this.inputBottom;
        Vector3 position = new Vector3(Input.mousePosition.x, Mathf.Max(a, Input.mousePosition.y), Camera.main.nearClipPlane);
        this.firePos = Camera.main.ScreenToWorldPoint(position);
        position.z = this.distance;
        this.firePos = Camera.main.ScreenToWorldPoint(position);
        this.target = this.firePos;
        this.barrelTarget = Quaternion.LookRotation(this.firePos - this.barrel.position);
        this.barrel.rotation = this.barrelTarget;
    }

    private void FireNormalBullet()
    {
        ShakeManager.MediumShake();
        if (this.muzzlePrefab)
        {
            GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.muzzlePrefab, this.firePoint.position, this.firePoint.rotation);
            gameObject.transform.LookAt(this.firePos);
            UnityEngine.Object.Destroy(gameObject, 2f);
            if (this.avatarInfo.FireEffectCount > 1)
            {
                for (int i = 0; i < this.firePoints.Length; i++)
                {
                    Transform transform = this.firePoints[i];
                    GameObject gameObject2 = UnityEngine.Object.Instantiate<GameObject>(this.muzzlePrefab, transform.position, transform.rotation);
                    gameObject2.transform.LookAt(this.firePos);
                    UnityEngine.Object.Destroy(gameObject2, 2f);
                }
            }
        }
        if (!this.avatarInfo.DisableFireShake)
        {
            this.animation.Play(Texts.AnimationAvatarFire);
        }
        Rigidbody rigidbody = this.SetupBall(this.bulletPrefab, false);
        rigidbody.transform.position = this.spawnPoint.position;
        rigidbody.transform.LookAt(this.firePos);
        //hack 修改子弹的力
        rigidbody.AddForce(rigidbody.transform.forward * this.force * 1500f);
        if (this.avatarInfo.FireCount > 1)
        {
            for (int j = 0; j < this.spawnPoints.Length; j++)
            {
                Transform transform2 = this.spawnPoints[j];
                Rigidbody rigidbody2 = this.SetupBall(this.bulletPrefab, false);
                rigidbody2.transform.position = transform2.position;
                rigidbody2.transform.position += transform2.transform.forward * 1.5f * (j + 1);
                rigidbody2.transform.LookAt(this.firePos);
                rigidbody2.AddForce(rigidbody2.transform.forward * this.force * 1500f);
            }

        }
        if (this.noOfExtraballs > 0)
        {
            Rigidbody rigidbody3 = this.SetupBall(this.bulletPrefab, false);
            rigidbody3.transform.position = this.extraSpawnPoint.position;
            rigidbody3.transform.position += this.extraSpawnPoint.transform.forward * 1.4f * avatarInfo.FireCount;
            rigidbody3.transform.LookAt(this.firePos);
            rigidbody3.AddForce(rigidbody3.transform.forward * this.force * 1500f);
        }
        this.aS.clip = this.shoot;
        this.aS.Play();
        if (!this.avatarInfo.DisableFireShake)
        {
            CameraShaker.Instance.ShakeOnce(1.5f, 1.5f, 0f, 0.5f);
        }
    }

    private IEnumerator FireManyBullets(Vector3 mousePos)
    {
        int count = 10;
        for (int i = 0; i < count; i++)
        {
            Vector3 worldPosition = mousePos + Quaternion.AngleAxis(i * 360f / count, mousePos - Camera.main.transform.position) * (Vector3.up * 2f);
            Rigidbody rigidbody = this.SetupBall(Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet), true);
            rigidbody.transform.position = this.spawnPoint.position;
            rigidbody.transform.position += (count - i) * rigidbody.transform.forward * 0.8f;
            rigidbody.transform.LookAt(worldPosition);
            rigidbody.AddForce(rigidbody.transform.forward * this.force * 8000f);
        }
        yield return new WaitForSeconds(0.05f);
        GameMenu.Instance.OnSuperFireOver();
        yield break;
    }

    private IEnumerator FireLaser(Vector3 mousePos)
    {
        Vector3 dir = mousePos - this.spawnPoint.position;
        if (!string.IsNullOrEmpty(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet))
        {
            Rigidbody rigidbody = this.SetupBall(Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet), true);
            rigidbody.transform.position = this.spawnPoint.position;
            rigidbody.transform.LookAt(mousePos);
        }
        yield return new WaitForSeconds(0.2f);
        foreach (RaycastHit raycastHit in Physics.SphereCastAll(this.spawnPoint.position, 2.5f, dir.normalized, 100f, GameHelper.ObjectLayerMasks, QueryTriggerInteraction.Ignore))
        {
            if (raycastHit.collider.tag == "Obstacles")
            {
                GameMenu.Instance.AddScore(1);
                GameWorld.Instance.currentObstacles.Remove(raycastHit.collider.gameObject.GetHashCode());
                UnityEngine.Object.Destroy(raycastHit.collider.gameObject, 0.25f);
            }
        }
        GameMenu.Instance.OnSuperFireOver();
        yield break;
    }

    private IEnumerator FireHole(Vector3 mousePos)
    {
        Vector3 dir = mousePos - this.spawnPoint.position;
        if (!string.IsNullOrEmpty(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet))
        {
            Rigidbody rigidbody = this.SetupBall(Resources.Load<GameObject>(GameMenu.Instance.CurrentSuperFireInfo.EffectBullet), true);
            rigidbody.transform.position = this.spawnPoint.position;
            rigidbody.transform.LookAt(mousePos);
            rigidbody.isKinematic = true;
            SphereCollider orAddComponent = rigidbody.gameObject.GetOrAddComponent<SphereCollider>();
            if (orAddComponent != null)
            {
                orAddComponent.isTrigger = true;
                orAddComponent.radius = 2.5f;
            }
            HoleHandler orAddComponent2 = rigidbody.gameObject.GetOrAddComponent<HoleHandler>();
            orAddComponent2.speed = 10f;
            orAddComponent2.life = 10f;
        }
        yield return new WaitForSeconds(0.05f);
        GameMenu.Instance.OnSuperFireOver();
        yield break;
    }

    private IEnumerator FireContinuousFire()
    {
        this.IsOnContinuousFire = true;
        yield return new WaitForSeconds(3f);
        this.IsOnContinuousFire = false;
        this.ContinuousFireTimeTemp = 0f;
        GameMenu.Instance.OnSuperFireOver();
        yield break;
    }

    private void Update()
    {
        if (this.IsOnContinuousFire)
        {
            this.UpdateAim();
            this.UpdateContinuousFire();
        }
        this.TextUpdate();
        Debug.DrawLine(Camera.main.transform.position, this.target);
    }

    private void UpdateContinuousFire()
    {
        this.ContinuousFireTimeTemp += Time.deltaTime;
        if (this.ContinuousFireTimeTemp >= this.ContinuousFireIntervial)
        {
            this.ContinuousFireTimeTemp = 0f;
            this.FireNormalBullet();
        }
    }

    private void BallsReduce()
    {
        this.noOfBalls--;
        if (this.noOfExtraballs > 0)
        {
            this.noOfExtraballs--;
        }
        //else
        //{
        //    //HACK  赠送和自己的子弹 消耗顺序

        //}
        AmmoDisplay.Instance.UpdateAmmonCount(this.noOfBalls);
        AmmoDisplay.Instance.UpdateExtraAmmonCount(this.noOfExtraballs);
    }

    public void AddBalls(int add)
    {
        this.noOfBalls += add;
        AmmoDisplay.Instance.UpdateAmmonCount(this.noOfBalls);
    }

    public void AddExtraBalls(int add)
    {
        this.noOfExtraballs += add;
        AmmoDisplay.Instance.UpdateExtraAmmonCount(this.noOfExtraballs);
    }

    private void TextUpdate()
    {

        //TODO  先消耗 赠送子弹，后消耗自己的 ,若想先后，在这里改
        if (!this.start)
        {
            this.BallText.gameObject.SetActive(false);
            this.BallTextShadow.gameObject.SetActive(false);
        }
        else if (!this.BallText.gameObject.activeSelf)
        {
            this.BallText.gameObject.SetActive(true);
            this.BallTextShadow.gameObject.SetActive(true);
        }
        if (this.noOfBalls > 0)
        {
            this.BallText.transform.localPosition = new Vector3(-45, -72, -10);
            if (this.noOfBalls != this.lastNumberOfBalls)
            {
                this.lastNumberOfBalls = this.noOfBalls;
                this.BallText.text = "x " + this.noOfBalls;
                this.BallTextShadow.text = "x " + this.noOfBalls;
                if (this.noOfBalls < 3)
                {
                    //TODO  改变最后子弹的颜色

                    this.BallText.color = Color.red;

                    //this.BallText.color = this.lessBallColor;
                    this.BallTextWarningAnimation.Play();
                }
                else
                {
                    this.BallText.color = Color.white;
                }
            }
        }
        else if (this.BallText.text != "NO BALLS")
        {
            this.BallText.transform.localPosition = new Vector3(-45, -72, 10);
            this.lastNumberOfBalls = 0;
            this.BallText.text = "NO BALLS";

            this.BallTextShadow.text = "NO BALLS";
        }

        if (this.noOfExtraballs > 0)
        {
            if (this.noOfExtraballs != this.lastNumberOfExtraBalls)
            {
                this.lastNumberOfExtraBalls = this.noOfExtraballs;
                this.ExtraText.gameObject.SetActive(true);
                this.ExtraText.text = "+ " + this.noOfExtraballs + " extra";
                this.ExtraTextShadow.text = this.noOfExtraballs + " extra";
            }
        }
        else if (this.ExtraText.gameObject.activeSelf)
        {
            this.lastNumberOfExtraBalls = 0;
            this.ExtraText.text = "0 extra";
            this.ExtraTextShadow.text = "0 extra";
            this.ExtraText.gameObject.SetActive(false);
            this.ExtraTextShadow.gameObject.SetActive(false);
        }

    }

    private void OnSuperFireReady(bool ready)
    {
        this.superFireCannonEffect.SetActive(ready);
        this.isSuperFireReady = ready;
    }

    private void OnDestroy()
    {
        EventDispatcher.RemoveEventListener(Texts.EventOnFireDownStay, new Action(this.OnFireDownStay));
        EventDispatcher.RemoveEventListener<bool>(Texts.EventSuperFireReady, new Action<bool>(this.OnSuperFireReady));
    }

    public GameObject cannonBall;

    public GameObject cannonShoot;

    public int MaxNoOfBalls = 5;

    public int noOfBalls = 5;

    public int noOfExtraballs;

    public Transform spawnPoint;

    public Transform extraSpawnPoint;

    public Transform firePoint;

    public Transform[] spawnPoints;

    public Transform[] firePoints;

    public float force;

    public float distance = 10f;

    public bool start;

    private AudioSource aS;

    public AudioClip shoot;

    public TextMesh BallText;
    public TextMesh BallTextShadow;

    public TextMesh ExtraText;

    public TextMesh ExtraTextShadow;

    public Animation BallTextAnimation;

    public Animation BallTextWarningAnimation;

    public Transform barrel;

    private Quaternion barrelTarget = Quaternion.identity;

    public Camera camera;

    public float defaultFov = 32.5f;

    private GameObject bulletPrefab;

    private GameObject muzzlePrefab;

    private GameObject superFireCannonEffectPrefab;

    private GameObject superFireCannonEffect;

    private AvatarInfo avatarInfo;

    private float inputBottom = 0.2f;

    [NonSerialized]
    public int lastNumberOfBalls;

    [NonSerialized]
    public int lastNumberOfExtraBalls;

    private bool isSuperFireReady;

    [HideInInspector]
    public bool IsOnContinuousFire;

    private float ContinuousFireIntervial = 0.15f;

    private float ContinuousFireTimeTemp;

    private Vector3 firePos;

    private Color lessBallColor = new Color(1f, 0.8980392f, 0.06666667f);

    private bool isChangingAvatar;

    private Vector3 target = Vector3.zero;
}
