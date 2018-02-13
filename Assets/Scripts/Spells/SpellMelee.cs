using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    /**
     * This is a subclass of <seealso cref="SpellProperties"/> which is used for spells that deal damage based on their current velocity.  
     * <para>By default, the spell will be directly held by the caster, but this can be disabled and used for projectiles that deal velocity-based damage as well.</para>
     */
    public class SpellMelee : SpellProperties
    {
        [Header("Melee Properties")]
        [Tooltip("If checked, velocity will be factored in to damage calculation")]
        public bool useVelocityForDamage;
        [Tooltip("Minimum speed required to deal damage")]
        public float minSpeedForDamage = 1f; //unit per second
        [Tooltip("Speed required to deal maximum damage")]
        public float maxSpeedForDamage = 3f;
        [Tooltip("How much to scale damage at maximum speed")]
        public float velocityScaleFactor = 2f;

        protected Vector3 lastPos; //used to calculate velocity without a rigidbody velocity value
        protected float currentSpeed; //tracks speed over the last frame

        protected List<GameObject> inContactWith = new List<GameObject>();

        void Reset()
        {
            isHeld = true;
        }

        override protected void Update()
        {
            currentSpeed = Vector3.Distance(transform.position, lastPos) / Time.deltaTime;
            lastPos = transform.position;
        }

        override
        public float GetDamage()
        {
            if (useVelocityForDamage)
            {
                float mod;
                if(currentSpeed > minSpeedForDamage)
                {
                    mod = currentSpeed / maxSpeedForDamage;
                    mod *= velocityScaleFactor;
                }
                else
                {
                    mod = 0.1f;
                }

                mod = Mathf.Clamp(mod, 0.1f, velocityScaleFactor);

                return base.GetDamage() * mod;
            }
            else
            {
                return base.GetDamage();
            }
        }

        virtual protected void OnTriggerEnter(Collider other)
        {
            if (!inContactWith.Contains(other.gameObject))
            {
                inContactWith.Add(other.gameObject);
                HitPoints otherHP = other.gameObject.GetComponent<HitPoints>();
                if (otherHP) otherHP.Damage(this.GetDamage());
            }
        }

        void OnTriggerExit(Collider other)
        {
            if (inContactWith.Contains(other.gameObject))
            {
                inContactWith.Remove(other.gameObject);
            }
        }
    }
}