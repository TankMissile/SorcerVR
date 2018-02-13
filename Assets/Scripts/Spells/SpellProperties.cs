using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    /**
     * <summary>
     * This is the base class of all spells.  It has basic properties and methods required for all spells, as well as some generic properties that can be used in different situations by many spell types.
     * <para>It also functions as a standalone projectile, which will automatically travel forward at a rate of speed/second if a Rigidbody is attached.</para>
     * </summary>
     */
    public class SpellProperties : MonoBehaviour
    {
        public GameObject selectorIcon;
        public GameObject handEffect;
        public GameObject groundEffect;

        [Header("Basic Spell Properties")]
        [Tooltip("Minimum damage without charging")]
        public float baseDamage = 10;
        protected float currentDamage;
        [Tooltip("Minimum mana cost without charging")]
        public int baseCost = 10;
        [Tooltip("Initial speed of the spell, in units per second.  This can have varying effects based on the spell")]
        public float speed = 10;
        [Tooltip("Maximum range of the spell.  This does not affect projectile range, rather it affects Raycast range for spells like Ice Beam.  Set to 0 to have no maximum range.")]
        public float maxRange = 0;
        [Tooltip("Maximum lifetime (seconds) of the spell, after which it will call Release() on itself and both be destroyed and instantiate whatever is set to releaseProjectile.  Set to 0 to have no maximum lifetime.  This also serves as a way to enforce a range limit on projectiles.")]
        public float maxLifetime = 0;
        public float currentLifetime = 0;
        [Tooltip("Object to be spawned when Release() is called, which occurs when the input trigger is released or the object reaches it maximum lifetime.")]
        public GameObject releaseProjectile;
        [Tooltip("If checked, the spell will be locked to the player's hand.  The object is not made a child of the hand, it just follows its transform.")]
        public bool isHeld;

        [Header("Charged Spell Properties")]
        [Tooltip("If checked, the spell will gain damage over time until being released or the maximum charge time is reached.")]
        public bool isChargeable = false;
        [Tooltip("Maximum amount of time until the spell is fully charged, after which point it will no longer gain damage from charging.")]
        public float maxChargeTime = 3f;
        [Tooltip("If checked, Release() will be called as soon as the spell is fully charged.  If unchecked, the spell can be held until the input trigger is released, regardless of charge.")]
        public bool fireWhenCharged = false;
        [Tooltip("How much to scale the object when it is fully charged (%).  Set to 1 for no change.")]
        public float fullChargeScale = 1.0f;
        [Tooltip("Maximum damage when fully charged.")]
        public float chargeDamage = 50;
        [Tooltip("Maximum mana cost after fully charging")]
        public int chargeCost = 15; //maximum cost after charging

        [Header("Channeled Spell Properties")] //lasers, objects, etc
        [Tooltip("If checked, the spell will deal damage over time (damage amount * delta time) as well as cost mana over time (mana cost * delta time)")]
        public bool isChanneled = false;
        [Tooltip("Maximum amount of time the spell can be channeled, after which Release() will be called.  Set to 0 for no maximum.")]
        public float maxChannelTime = 0;

        protected Vector2 stickInput = new Vector2(0, 0); //used for spells that take input from the thumbstick

        virtual protected void Start()
        {
            Rigidbody rb = GetComponent<Rigidbody>();
            if (rb)
            {
                rb.velocity = speed * transform.forward;
            }
            currentDamage = baseDamage;
        }

        virtual protected void Update()
        {
            currentLifetime += Time.deltaTime;

            if (isChargeable)
            {
                float progress = Mathf.Clamp(currentLifetime / maxChargeTime, 0, 1);
                currentDamage = Mathf.Lerp(baseDamage, chargeDamage, progress);
                transform.localScale = Vector3.Lerp(Vector3.one, Vector3.one * fullChargeScale, progress);
            }

            if (maxLifetime != 0 && currentLifetime > maxLifetime)
            {
                Release();
            }

            if (fireWhenCharged && isChargeable && currentLifetime >= maxChargeTime) Release();
        }

        virtual public float GetDamage()
        {
            if (!isChanneled)
            {
                return currentDamage;
            }
            else
            {
                return currentDamage * Time.deltaTime;
            }
        }

        //Get mana cost of spell at time this is called
        public float GetCost()
        {
            float cost;
            if (isChargeable)
            {
                cost = Mathf.Lerp(baseCost, chargeCost, Mathf.Clamp(currentLifetime / maxChargeTime, 0, 1));
            }
            else
            {
                cost = baseCost;
            }

            if(!isChanneled){
                return cost;
            }
            else
            {
                return cost * Time.deltaTime;
            }
        }

        public void OnTriggerStay(Collider other)
        {
            if (isChanneled)
            {
                HitPoints otherHP = other.GetComponent<HitPoints>();
                if (otherHP)
                {
                    otherHP.Damage(this.GetDamage());
                }
            }
        }
        
        public virtual void Release()
        {
            if (releaseProjectile)
            {
                SpellProperties released = Instantiate(releaseProjectile, transform.position, transform.rotation).GetComponent<SpellProperties>();
                released.baseDamage = currentDamage;
                released.transform.localScale = transform.localScale;
            }
            Destroy(gameObject);
        }

        public virtual void SetStickValue(Vector2 input)
        {
            stickInput.Set(input.x, input.y);
        }

        //Copies statistic values (not gameobjects!)
        public virtual void CopySpellProperties(SpellProperties sp)
        {
            baseDamage = sp.baseDamage;
            baseCost = sp.baseCost;
            speed = sp.speed;
            maxRange = sp.maxRange;
            maxChargeTime = sp.maxChargeTime;
            chargeDamage = sp.chargeDamage;
            chargeCost = sp.chargeCost;
        }
    }
}
