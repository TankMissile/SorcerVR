using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    /**
     * <summary>
     * SpellGuidedProjectile is a subclass of <seealso cref="SpellProperties"/>, which is used as a projectile being guided by a target object.
     * <para>Note: This refers to the projectile being guided by <seealso cref="SpellGuided"/>, but it can be used as a homing missile instead.  The spell's target object must be set before it will track anything, which must be done with <seealso cref="SpellGuidedProjectile.SetTargetObject"/>.</para>
     * </summary>
     */
    public class SpellGuidedProjectile : SpellProperties
    {
        [Tooltip("If set to true, maximum lifetime is enabled immediately.  If false, will only start lifetime when target object is destroyed.")]
        public bool startLifetimeImmediately = false;

        private GameObject targetObject; //what to follow

        // Update is called once per frame
        override protected void Update()
        {
            if (maxLifetime != 0 && currentLifetime >= maxLifetime) Release();

            if (!targetObject) //no target, just keep moving in a straight line
            {
                transform.position += transform.forward * (speed * Time.deltaTime);
                currentLifetime += Time.deltaTime;
            }
            else
            {
                if (startLifetimeImmediately) currentLifetime += Time.deltaTime;

                float distanceToTarget = (targetObject.transform.position - transform.position).magnitude;
                if (distanceToTarget >= speed * Time.deltaTime)
                {
                    transform.LookAt(targetObject.transform);
                    transform.position += transform.forward.normalized * speed * Time.deltaTime;
                }
                else
                {
                    transform.position = targetObject.transform.position;
                    transform.rotation = targetObject.transform.rotation;
                }
            }
        }

        public void SetTargetObject(GameObject target)
        {
            targetObject = target;
        }
    }
}
