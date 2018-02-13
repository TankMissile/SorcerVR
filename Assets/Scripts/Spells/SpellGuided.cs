using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    /**
     * <summary>
     * SpellGuided is a subclass of <seealso cref="SpellProperties"/> used for spells that can be guided by the caster after it has been fired.  They can either automatically move forward or be entirely controlled in 3D space by the caster.
     * <para>Note: This does not refer to the projectile being guided by this spell.  For the projectile, see <seealso cref="SpellGuidedProjectile"/>.</para>
     * </summary>
     */
    public class SpellGuided : SpellProperties
    {
        [Header("Guided Spell Properties")]
        [Tooltip("If checked, the spell's distance from the player can be controlled with the thumbstick.  If unchecked, the spell will always travel away from the player (at the rate set by distancePerSecond)")]
        public bool takeStickInput = false;
        [Tooltip("Projectile that is fired and guided")]
        public GameObject projectile;
        private GameObject activeProjectile;
        [Tooltip("Used to guide the projectile")]
        public GameObject targetPoint;
        private GameObject activeTarget; //instantiated version of targetPoint

        private float distanceToTarget = 2f; //how far forward to set the position of the target point from transform.position
        [Tooltip("How fast (units per second) to move the target point if the stick is pushed 100%")]
        public float distancePerSecond;

        public void Reset()
        {
            isHeld = true;
        }

        // Use this for initialization
        override protected void Start()
        {
            activeTarget = Instantiate(targetPoint, transform.position, transform.rotation);
            activeProjectile = Instantiate(projectile, transform.position, transform.rotation);
            activeProjectile.GetComponent<SpellGuidedProjectile>().SetTargetObject(activeTarget);
        }

        // Update is called once per frame
        override protected void Update()
        {
            if (!activeProjectile) //end spell if projectile was destroyed
            {
                Release();
                return;
            }

            if (takeStickInput)
            {
                distanceToTarget += stickInput.y * distancePerSecond * Time.deltaTime;
            }
            else
            {
                distanceToTarget += distancePerSecond * Time.deltaTime;
            }

            activeTarget.transform.position = transform.position + (transform.forward * distanceToTarget);
            activeTarget.transform.rotation = transform.rotation;
        }

        override
        public void Release()
        {
            Destroy(activeTarget);
            base.Release();
        }
    }
}
