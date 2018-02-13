using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DummyHealthResetter : MonoBehaviour {
    public float timeBetweenResets = 10; //seconds
    public bool resetOnDeath = true;
    private float timeUntilReset;
    private HitPoints hp;

    private void Start()
    {
        timeUntilReset = timeBetweenResets;
        hp = GetComponent<HitPoints>();
        if (!hp) Debug.Log("HealthBar component not present on " + gameObject.name);
    }

    // Update is called once per frame
    void Update () {
        timeUntilReset -= Time.deltaTime;

        if(timeUntilReset <= 0)
        {
            ResetHealth();
        }

        if (resetOnDeath && hp.hp <= 0)
        {
            ResetHealth();
        }
	}

    private void ResetHealth()
    {
        timeUntilReset = timeBetweenResets;
        HitPoints hp = GetComponent<HitPoints>();
        hp.hp = hp.maxHp;
        hp.Damage(0, false);
    }
}
