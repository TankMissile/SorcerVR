using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class SpellBeam : SpellProperties
    {
        [Header("Beam Prefabs")]
        [Tooltip("What to spawn at the origin of the beam")]
        public GameObject beamStartPrefab;
        [Tooltip("What to spawn at the end of the beam")]
        public GameObject beamEndPrefab;
        [Tooltip("What to spawn as the body of the beam")]
        public GameObject beamPrefab;
        
        protected GameObject beamStart;
        protected GameObject beamEnd;
        protected SpellProperties beamDamage;
        protected GameObject beam;
        protected LineRenderer line;

        [Header("Beam Variables")]
        [Tooltip("If checked, the beam will ignore enemies and continue until reaching max range or hitting a wall.  If unchecked, the beam will stop at the first enemy hit.")]
        public bool penetrateTargets = false;
        [Tooltip("How far from the raycast hit point to spawn beamEndPrefab (for visibility) and set the end point for the line renderer")]
        public float beamEndOffset = 1f;
        [Tooltip("How fast the texture scrolls along the beam")]
        public float textureScrollSpeed = 8f;
        [Tooltip("How much to scale the beam's texture")]
        public float textureLengthScale = 3;


        public void Reset()
        {
            isChanneled = true;
            isHeld = true;
        }

        override
        public void Release()
        {
            Destroy(beamStart);
            Destroy(beamEnd);
            Destroy(beam);
            Destroy(gameObject);
        }

        override protected void Start()
        {
            beamStart = Instantiate(beamStartPrefab, transform.position, transform.rotation);
            beamEnd = Instantiate(beamEndPrefab, transform.position, transform.rotation);
            beamEnd.tag = "target_enemy";
            beamDamage = beamEnd.GetComponent<SpellProperties>();
            beamDamage.baseDamage = this.baseDamage;
            beam = Instantiate(beamPrefab, transform.position, transform.rotation);
            line = beam.GetComponent<LineRenderer>();
        }

        override protected void Update()
        {
            if(isChargeable) beamDamage.baseDamage = this.baseDamage + ((chargeDamage - baseDamage) * Time.deltaTime);
            ShootBeamInDir(transform.position, transform.forward.normalized);
        }

        void ShootBeamInDir(Vector3 start, Vector3 dir)
        {
            int layerMask = 1 + (1 << 8) + (1 << 10); //hit Default, Terrain, and Enemy layers
            line.positionCount = 2;
            line.SetPosition(0, start);
            beamStart.transform.position = start;
            //Debug.Log("Laser should start at " + start.ToString());

            Vector3 end = Vector3.zero;
            RaycastHit hit;
            if (Physics.Raycast(start, dir, out hit, maxRange, layerMask ))
                end = hit.point - (dir.normalized * beamEndOffset);
            else
                end = transform.position + (dir * maxRange);
            //Debug.Log("Laser should end at " + transform.position + "+" + dir.ToString() + "*" + maxRange + " = " + end.ToString());

            beamEnd.transform.position = end;
            line.SetPosition(1, end);

            beamStart.transform.LookAt(beamEndPrefab.transform.position);
            beamEnd.transform.LookAt(beamStartPrefab.transform.position);

            float distance = Vector3.Distance(start, end);
            line.sharedMaterial.mainTextureScale = new Vector2(distance / textureLengthScale, 1);
            line.sharedMaterial.mainTextureOffset -= new Vector2(Time.deltaTime * textureScrollSpeed, 0);
        }
    }
}