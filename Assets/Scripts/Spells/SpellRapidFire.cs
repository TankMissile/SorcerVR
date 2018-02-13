using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    /**
     * <summary>
     * This is a subclass of <seealso cref="SpellProperties"/>, used for spells that fire multiple projectiles as long as the input trigger is held.
     * </summary>
     */
    public class SpellRapidFire : SpellProperties
    {
        [Header("Rapid Fire Properties")]
        [Tooltip("Number of shots per second")]
        public float fireRate = 4f;
        private float timeBetweenFiring;
        private float timeSinceFired = 0.0f;
        [Tooltip("Projectile to be fired")]
        public GameObject rapidProjectile;

        public void Reset()
        {
            isHeld = true;
        }

        // Use this for initialization
        override protected void Start()
        {
            timeBetweenFiring = 1f / fireRate;
            timeSinceFired = timeBetweenFiring; //make it fire on the first frame
        }

        // Update is called once per frame
        override protected void Update()
        {
            timeSinceFired += Time.deltaTime;

            if(timeSinceFired >= timeBetweenFiring)
            {
                FireProjectile();
            }

            base.Update();
        }

        virtual protected GameObject FireProjectile()
        {
            timeSinceFired -= timeBetweenFiring;
            GameObject p = Instantiate(rapidProjectile, transform.position, transform.rotation);
            p.tag = "target_enemy";
            SpellProperties sp = p.GetComponent<SpellProperties>();

            sp.baseDamage = this.baseDamage;
            sp.speed = this.speed;
            return p;
        }
    }
}
