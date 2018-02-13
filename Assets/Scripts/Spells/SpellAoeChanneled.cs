using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class SpellAoeChanneled : SpellProperties
    {
        protected List<GameObject> inEffect = new List<GameObject>();

        protected void Reset()
        {
            isChanneled = true;
            isHeld = true;
        }

        // Use this for initialization
        override protected void Start()
        {
            base.Start();
        }

        // Update is called once per frame
        override protected void Update()
        {
            base.Update();

            if (isChanneled)
            {
                foreach (GameObject g in inEffect)
                {
                    HitPoints hp = g.GetComponent<HitPoints>();
                    if (hp)
                    {
                        hp.Damage(GetDamage());
                    }
                }
            }
        }

        protected void OnTriggerEnter(Collider other)
        {
            if (!inEffect.Contains(other.gameObject))
            {
                inEffect.Add(other.gameObject);
            }
        }

        protected void OnTriggerExit(Collider other)
        {
            if (inEffect.Contains(other.gameObject))
            {
                inEffect.Remove(other.gameObject);
            }
        }
    }
}