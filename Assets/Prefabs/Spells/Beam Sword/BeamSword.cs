using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class BeamSword : SpellMelee
    {
        [Header("Sound Properties")]
        public AudioSource source;
        public float minPitch = 0.6f;
        public float maxPitch = 0.75f;
        public float minVolume = 0.5f;
        public float maxVolume = 1f;

        public GameObject impactSound;

        // Update is called once per frame
        override protected void Update()
        {
            base.Update();

            if (source) {
                source.pitch = Mathf.Lerp(minPitch, maxPitch, currentSpeed/maxSpeedForDamage);
                source.volume = Mathf.Lerp(minVolume, maxVolume, currentSpeed / maxSpeedForDamage);
            }
        }

        override protected void OnTriggerEnter(Collider other)
        {
            if (other.gameObject.layer == 10 /*Enemy*/ && impactSound && !inContactWith.Contains(other.gameObject)){
                Instantiate(impactSound, other.ClosestPoint(transform.position), Quaternion.identity);
            }

            base.OnTriggerEnter(other);
        }
    }
}
