using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class manaGUI : MonoBehaviour {
	public Text manaText;
	private float manaValue;
	private float manaCD;
	public Image manaBar;
	public Image manaBarOverCharge;
	public GameObject mana;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		manaValue = mana.GetComponent<manaLogic>().manaValue;
		manaCD = mana.GetComponent<manaLogic>().coolDown;
//		if (manaValue > 100) {
	//		manaBarOverCharge.fillAmount = (manaValue - 100f) / 20f;
		//	manaBar.fillAmount = 1;
			//Debug.Log ((manaValue - 100f) / 20f);
		//} else {
			//manaText.text = manaValue.ToString ("F1") + "%";
			manaBar.fillAmount = manaValue / 100f;
			manaBarOverCharge.fillAmount = 0;
		//}
		if (manaCD > 0) {
			manaText.text = manaCD.ToString("F0") + "s";
		} else {
			manaText.text = "";
		}

	}
}
