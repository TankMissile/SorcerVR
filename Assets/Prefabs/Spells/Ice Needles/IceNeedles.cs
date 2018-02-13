using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class IceNeedles : SpellRapidFire
    {

        [Header("Ice Needles")]
        public bool useOffset = true;
        public float randomOffsetRadius;

        protected override GameObject FireProjectile()
        {
            GameObject p = base.FireProjectile();
            if (useOffset)
            {
                float offsetMagnitude = Random.Range(0, randomOffsetRadius);
                float angle = Random.Range(0, 360) * Mathf.Deg2Rad;
                Vector3 offset = new Vector3(Mathf.Cos(angle) * offsetMagnitude, Mathf.Sin(offsetMagnitude) * offsetMagnitude, 0);
                p.transform.localPosition += (p.transform.right * offset.x) + (p.transform.up * offset.y); //this took a surprising amount of thinking to come up with... hope it works
            }
            return p;
        }
    }
}