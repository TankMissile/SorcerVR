using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class manaLogic : MonoBehaviour {
	//Time it takes for mana to overcharge once mana is at 100%
	public float overChargeCD;
	//Remaining cooldown time
	public float coolDown;
	//Time it takes for mana to recharge once it goes below 100%
	public float manaDownCD;
	//Regeneration per second
	public float regenRate; 
	//mana Usage rate
	public float drainRate;

    public bool inUse;

	//Charge to give to the mana after coolDown finishes
	//This prevents user from destroying mana immediately after coolDown
	public float manaUpCharge;


	public float manaValue;
	// Use this for initialization
	void Start () {
        inUse = false;
	}
	
	// Update is called once per frame
	void Update () {
		//if mana active, then decrease mana
		if (coolDown > 0) {
			coolDown = coolDown - Time.deltaTime;
            //Force mana down on Cooldown
			if (coolDown < 0) {
				coolDown = 0;
				manaValue = manaUpCharge;
			}
			return;
		}
		if (inUse) {
			manaValue = manaValue - drainRate * Time.deltaTime;
			if (manaValue <= 0) {
				coolDown = coolDown + manaDownCD;
			}
		} else {
			//if mana inactive, recharge, then if over 100% overcharge
			manaValue = manaValue + regenRate * Time.deltaTime;
			if (manaValue >= 100) {
				manaValue = 100;
			}
		}

	}
}
