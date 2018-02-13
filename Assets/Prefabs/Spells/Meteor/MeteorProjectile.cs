using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeteorProjectile : MonoBehaviour {
    [Tooltip("Explosion particle system that should be emitted for each initial collision.")]
    public ParticleSystem ExplosionParticles;
    [Tooltip("Shrapnel system that should be emitted for each initial collision")]
    public ParticleSystem ShrapnelParticles;
    [Tooltip("Sounds to play on each initial collision")]
    public AudioClip[] ExplosionSounds;
    [Tooltip("Audio source for explosion sounds")]
    public AudioSource ExplosionSound;
    [Tooltip("The Spell properties")]
    public Spells.SpellProperties spellProperties;

    private List<GameObject> alreadyHit = new List<GameObject>();

    private void OnTriggerEnter(Collider other)
    {
        if (!alreadyHit.Contains(other.gameObject))
        {
            alreadyHit.Add(other.gameObject);
            HitPoints hp = other.GetComponent<HitPoints>();
            if (hp)
            {
                hp.Damage(spellProperties.GetDamage());
            }

            if (GetComponent<Collider>())
            {
                if (ExplosionParticles)
                {
                    ExplosionParticles.transform.position = GetComponent<Collider>().ClosestPoint(other.transform.position);
                    ExplosionParticles.Emit(Random.Range(10, 20));
                }
                if (ShrapnelParticles)
                {
                    ShrapnelParticles.transform.position = GetComponent<Collider>().ClosestPoint(other.transform.position);
                    ShrapnelParticles.Emit(Random.Range(10, 20));
                }
                if(ExplosionSounds.Length != 0 && ExplosionSound)
                {
                    ExplosionSound.PlayOneShot(ExplosionSounds[Random.Range(0, ExplosionSounds.Length)]);
                }
            }
        }
    }
}
