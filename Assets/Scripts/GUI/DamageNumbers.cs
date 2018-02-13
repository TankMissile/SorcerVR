using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DamageNumbers : MonoBehaviour
{
    [Tooltip("Text used to display the numbers.  If not set, will default to GetComponent's returned Text component.")]
    public Text display;

    [Header("Config")]
    [Tooltip("If checked, displays damage compiled over several hits.  If unchecked, only shows the most recent hit.")]
    public bool tallyNumbers = true;
    [Tooltip("Percentage between 0 and 1, how much of the fadeout duration does the tally count damage before resetting")]
    public float tallyMaxDuration = 0.9f;
    private float damageDisplayed = 0;

    [Tooltip("How long the display is active (in seconds)")]
    public float fadeDuration = 2.0f;
    [Tooltip("How much time left on timer (seconds) before alpha begins to fade")]
    public float alphaTimer = 0.1f;
    private float timeToFade = 0; //how long until the fade is completed

    [Tooltip("How large (% of start scale) the text is when fading begins")]
    public float maxTextScale = 1f;
    [Tooltip("How large (% of start scale) the text is when fading ends")]
    public float minTextScale = 0.5f;

    private Vector3 startScale; //stores the Editor's value of the text scale
    private bool isClear = false; //stores whether or not the text has already been cleared out

    private void Start()
    {
        if (!display)
        {
            display = gameObject.GetComponent<Text>();
        }
        
        alphaTimer = Mathf.Clamp(alphaTimer, 0, fadeDuration); //make sure the text doesn't start at some wonky alpha value
        startScale = new Vector3(transform.localScale.x, transform.localScale.y, transform.localScale.z);
        tallyMaxDuration = Mathf.Clamp(tallyMaxDuration, 0, 1); //make sure the tally duration is a valid percentage

        //make sure nothing is displayed
        display.text = "";
    }

    // Update is called once per frame
    void Update () {
		if(timeToFade > 0)
        {
            //update timer
            timeToFade -= Time.deltaTime;

            //update text color/alpha
            float a = Mathf.Clamp((timeToFade / alphaTimer), 0, 1); //calculate alpha
            display.color = new Color(display.color.r, display.color.g, display.color.b, a);

            //scale text
            float scaleModifier = ((timeToFade/fadeDuration) * (maxTextScale - minTextScale)) + minTextScale;
            display.transform.localScale = new Vector3(startScale.x * scaleModifier, startScale.y * scaleModifier, startScale.z * scaleModifier);

            //check if tally needs to be reset, and do so
            if (tallyNumbers && (timeToFade / fadeDuration) < tallyMaxDuration)
            {

            }
        }
        else if(!isClear)
        {
            damageDisplayed = 0;
            display.color = new Color(display.color.r, display.color.g, display.color.b, 0);
            isClear = true;
        }
	}

    public void Damage(float dmg)
    {
        //Calculate damage displayed
        if (tallyNumbers)
        {
            damageDisplayed += dmg;
        }
        else
        {
            damageDisplayed = dmg;
        }

        //Round the amount and update the text
        if(damageDisplayed < 10000) //less than ten thousand, display actual value
        {
            display.text = "" + damageDisplayed.ToString("0");
        }
        else if(damageDisplayed <= 100000) //less than a hundred thousand, round to thousands (two decimal places)
        {
            display.text = "" + ((float)damageDisplayed / 1000).ToString("0.00") + "K";
        }
        else if(damageDisplayed <= 1000000) //less than a million, round to thousands (one decimal place)
        {
            display.text = "" + ((float)damageDisplayed / 1000).ToString("0.0") + "K";
        }
        else if(damageDisplayed <= 1000000000) //less than a billion, round to millions
        {
            display.text = "" + ((float)damageDisplayed / 1000000).ToString("0.0") + "M";
        }
        else //more than a billion, round to billions
        {
            display.text = "" + ((float)damageDisplayed / 1000000000).ToString("0.0") + "B";
        }

        //Reset the fade timer
        timeToFade = fadeDuration;
        isClear = false;
    }
}
