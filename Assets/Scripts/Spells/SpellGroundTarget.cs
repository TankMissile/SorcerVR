using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class SpellGroundTarget : SpellProperties
    {
        [Header("Ground Target Properties")]
        [Tooltip("What to spawn at the target point, both for user visibility and to set as the target of the released projectile")]
        public GameObject targetPrefab;
        protected GameObject target;

        public enum OriginType { UNDERGROUND, UP, ABOVE_PLAYER, UNDER_PLAYER };
        [Tooltip("Where to spawn the projectile")]
        public OriginType origin = OriginType.ABOVE_PLAYER;
        [Tooltip("How far above the target point to spawn the projectile (doesn't apply to \"UNDERGROUND\" or \"UNDER_PLAYER\" origin types")]
        public float distanceOverHead = 200f;
        [Tooltip("Effect that is created at the origin point while the spell is charging (namely for overhead effects).  This will automatically be scaled along with this spell.")]
        public GameObject originEffect;
        private GameObject activeOriginEffect;

        public void Reset()
        {
            isHeld = true;
        }

        // Use this for initialization
        override protected void Start()
        {
            target = Instantiate(targetPrefab);
            if (originEffect)
            {
                activeOriginEffect = Instantiate(originEffect);
                MoveObjectToOrigin(activeOriginEffect);
            }
        }

        // Update is called once per frame
        override protected void Update()
        {
            base.Update();

            RaycastHit hit = new RaycastHit();
            if(ParabolicRaycast.Cast(transform.position, transform.forward, out hit))
            {
                target.transform.position = hit.point + Vector3.up * 0.1f;
            }

            if (activeOriginEffect)
            {
                MoveObjectToOrigin(activeOriginEffect);
                activeOriginEffect.transform.localScale = transform.localScale;
            }
        }

        private void MoveObjectToOrigin(GameObject o)
        {
            switch (origin)
            {
                case OriginType.ABOVE_PLAYER:
                    o.transform.position = transform.position + Vector3.up * distanceOverHead;
                    break;
                case OriginType.UP:
                    o.transform.position = target.transform.position + Vector3.up * distanceOverHead;
                    break;
                case OriginType.UNDERGROUND:
                    o.transform.position = target.transform.position;
                    break;
                default:
                    break;
            }
        }

        override public void Release()
        {
            GameObject projectile = Instantiate(releaseProjectile);
            float progress = Mathf.Clamp(currentLifetime / maxChargeTime, 0, 1);
            projectile.transform.localScale = Vector3.one * Mathf.Lerp(0.5f, fullChargeScale, progress);
            MoveObjectToOrigin(projectile);

            SpellProperties sp = projectile.GetComponent<SpellProperties>();
            if (sp)
            {
                sp.baseDamage = GetDamage();
            }

            if(activeOriginEffect) Destroy(activeOriginEffect);

            projectile.transform.LookAt(target.transform);

            Destroy(target);
            Destroy(gameObject);
        }
    }
}