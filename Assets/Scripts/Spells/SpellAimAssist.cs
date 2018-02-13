using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Spells
{
    public class SpellAimAssist : SpellProperties
    {
        [Header("Aim Assist Properties")]
        [Tooltip("Targets to be shot at.  Increase array size to allow more simultaneous targets.")]
        public GameObject[] targets = new GameObject[1];
        protected List<GameObject> inAimCone = new List<GameObject>();

        // Update is called once per frame
        override protected void Update()
        {
            base.Update();

            //sort by distance from user, to make target selection easier
            inAimCone.Sort((x, y) => (x.transform.position - transform.position).magnitude.CompareTo((y.transform.position - transform.position).magnitude));
            Debug.Log("Aim Cone Colliders:" + inAimCone.ToString());
        }

        protected void OnTriggerEnter(Collider other)
        {
            if (other.gameObject.layer != 10) return;

            if (!inAimCone.Contains(other.gameObject))
            {
                inAimCone.Add(other.gameObject);
            }
        }

        protected void OnTriggerExit(Collider other)
        {
            if (inAimCone.Contains(other.gameObject))
            {
                inAimCone.Remove(other.gameObject);
            }
        }
    }
}