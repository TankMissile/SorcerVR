using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Spells;

public class PlayerHand : MonoBehaviour {
    public OVRInput.Controller controller = OVRInput.Controller.RTouch;
    public Transform projectionPoint = null; //where spells spawn and what rotation they inherit
    public Transform handEffectAnchor; //where hand effects originate from
    public float stickThreshold = 0.2f; //How much (%) the thumbstick must be tilted to be considered in use
    private enum ActionState { IDLE, SPELLREADY, CASTING, TELEPORTING, TELEPORTED, READYTOSELECTSPELL, SELECTINGSPELL, SELECTEDSPELL };
    private ActionState state = ActionState.IDLE;
    public GameObject arcLine; //used to draw the path of an arc

    //spells
    private GameObject currentSpell;
    private GameObject currentSpellHandEffect;
    private GameObject currentGroundEffect;

    [Tooltip("Equipped spells, starting at NORTH and rotating clockwise.  Uses SpellSelector.Selection")]
    public GameObject[] equippedSpells = new GameObject[8];
    private GameObject heldSpell;

    //teleport
    public GameObject teleportTargetArrow;
    private GameObject activeTeleportTarget;
    public float maxTeleportRange = 100.0f; //units

    //input checks
    private bool triggerHeld = false;
    private bool gripHeld = false;
    private bool stickActive = false;
    private Vector2 stickValue;
    private bool primaryButtonHeld = false;
    private bool secondaryButtonHeld = false;
    private bool menuButtonActive = false;

    //spell selector
    public SpellSelector spellSelector;
    public GameObject unknownIcon;

	// Use this for initialization
	void Start () {
        //Set projection Point
        if (!projectionPoint)
        {
            projectionPoint = this.transform;
        }

        //Set default equipped Spell
        for(int i = 0; i < 8; i++)
        {
            if(equippedSpells[i])
            {
                currentSpell = equippedSpells[i];
                break;
            }
        }

        //Set all the spell icons and disable spell selector graphic
        if (spellSelector)
        {
            for (int i = 0; i < 8; i++)
            {
                GameObject spell = equippedSpells[i];

                if (spell)
                {
                    SpellProperties sp = spell.GetComponent<SpellProperties>();
                    if (sp && sp.selectorIcon) spellSelector.SetSpellIcon((SpellSelector.Selection)i, spell.GetComponent<SpellProperties>().selectorIcon);
                    else spellSelector.SetSpellIcon((SpellSelector.Selection)i, unknownIcon);
                }
            }
            spellSelector.gameObject.SetActive(false);
        }

        if (arcLine)
        {
            arcLine.SetActive(false);
        }
	}
	
	// Update is called once per frame
	void Update () {
        //check input
        //Trigger
        triggerHeld = OVRInput.Get(OVRInput.Axis1D.PrimaryIndexTrigger, controller) >= 0.5f;

        //grip
        gripHeld = OVRInput.Get(OVRInput.Axis1D.PrimaryHandTrigger, controller) >= 0.5f;

        //thumbstick
        stickValue = OVRInput.Get(OVRInput.Axis2D.PrimaryThumbstick, controller);
        stickActive = stickValue.magnitude >= stickThreshold;

        //Primary button
        primaryButtonHeld = OVRInput.Get(OVRInput.Button.One, controller);

        //SecondaryButton
        secondaryButtonHeld = OVRInput.Get(OVRInput.Button.Two, controller);

        //Menu Button
        menuButtonActive = OVRInput.Get(OVRInput.Button.Start, controller);

        //State Machine
        switch (state)
        {
            case ActionState.IDLE:
                if (gripHeld)
                {
                    state = ActionState.SPELLREADY;
                    if (currentSpellHandEffect) currentSpellHandEffect.SetActive(true);
                    else CreateHandEffect();
                }
                else if (stickActive)
                {
                    state = ActionState.TELEPORTING;
                    arcLine.SetActive(true);
                }
                break;
            case ActionState.SPELLREADY:
                if (!gripHeld)
                {
                    state = ActionState.IDLE;
                    if(currentSpellHandEffect) currentSpellHandEffect.SetActive(false);
                    break;
                }
                if (triggerHeld)
                {
                    state = ActionState.CASTING;

                    SpellProperties sp = currentSpell.GetComponent(typeof(SpellProperties)) as SpellProperties;
                    if (sp)
                    {
                        if(sp.groundEffect) currentGroundEffect = Instantiate(sp.groundEffect, transform.root);

                        if (!sp.isHeld)
                        {
                            GameObject projectile = Instantiate(currentSpell, projectionPoint.position, projectionPoint.rotation);
                            //Short vibration goes here
                            projectile.tag = "target_enemy";
                        }
                        else
                        {
                            if (!heldSpell)
                            {
                                heldSpell = Instantiate(currentSpell, projectionPoint.position, projectionPoint.rotation);
                                //Persistent vibration goes here
                                heldSpell.tag = "target_enemy";
                            }
                        }
                    }
                    break;
                }
                if (secondaryButtonHeld)
                {
                    state = ActionState.READYTOSELECTSPELL;
                    spellSelector.gameObject.SetActive(true);
                }
                break;
            case ActionState.CASTING:
                //update charged/channeled spell
                if (heldSpell)
                {
                    heldSpell.transform.position = projectionPoint.position;
                    heldSpell.transform.rotation = projectionPoint.rotation;

                    if (stickActive)
                    {
                        Vector2 stickValue = OVRInput.Get(OVRInput.Axis2D.PrimaryThumbstick, controller);
                        //modify the stick value to represent the percentage between the threshold and maximum rather than between zero and the maximum
                        stickValue.x = (stickValue.x - stickThreshold) / (1 - stickThreshold);
                        stickValue.y = (stickValue.y - stickThreshold) / (1 - stickThreshold);
                        heldSpell.GetComponent<SpellProperties>().SetStickValue(stickValue);
                    }
                    else
                    {
                        heldSpell.GetComponent<SpellProperties>().SetStickValue(new Vector2(0, 0));
                    }
                }
                else if (currentGroundEffect) Destroy(currentGroundEffect);

                //check if spell ended
                if (!gripHeld || !triggerHeld)
                {
                    if (currentGroundEffect) Destroy(currentGroundEffect);

                    state = ActionState.SPELLREADY;
                    if (heldSpell)
                    {
                        SpellProperties chargeProp = heldSpell.GetComponent(typeof(SpellProperties)) as SpellProperties;
                        chargeProp.Release();
                        //Persistent vibration stops here, possibly play another short vibration here
                    }
                }

                break;
            case ActionState.READYTOSELECTSPELL: //only exists to allow the player to use the thumbstick without entering spell selection
                if (stickActive)
                {
                    state = ActionState.SELECTINGSPELL;
                }
                break;
            case ActionState.SELECTINGSPELL:
                if (triggerHeld)
                {
                    if (spellSelector)
                    {
                        SelectSpell(spellSelector.GetSelection());
                        state = ActionState.SELECTEDSPELL;
                    }
                    else Debug.LogError("No Spell Selector!");
                }
                if (!stickActive || !gripHeld || secondaryButtonHeld)
                {
                    state = ActionState.SELECTEDSPELL;
                }
                else
                {
                    if (spellSelector)
                    {
                        spellSelector.UpdateDirection(stickValue);
                    }
                }
                break;
            case ActionState.SELECTEDSPELL: //exists to allow player to let go of unwanted buttons before returning to spell ready position
                if(!triggerHeld && !secondaryButtonHeld)
                {
                    state = ActionState.SPELLREADY;
                    spellSelector.gameObject.SetActive(false);
                }
                break;
            case ActionState.TELEPORTING: //handle teleporting
                if (!stickActive)
                {
                    state = ActionState.IDLE;
                    if(arcLine) arcLine.SetActive(false);

                    //Get rid of the target reticle
                    Destroy(activeTeleportTarget);
                    activeTeleportTarget = null;
                    break;
                }
                if (triggerHeld)
                {
                    state = ActionState.TELEPORTED;
                    if (arcLine) arcLine.SetActive(false);
                    if (activeTeleportTarget)
                    {
                        //Move player to target location
                        transform.root.transform.position = activeTeleportTarget.transform.position;
                        transform.root.transform.rotation = activeTeleportTarget.transform.rotation;
                    }
                }


                //raytrace to ground
                RaycastHit hit;
                if (ParabolicRaycast.Cast(transform.position, transform.forward, out hit, arcLine))
                {
                    //check stick direction
                    Vector2 stickDirection = stickValue.normalized;
                    float stickAngle = Vector3.Angle(Vector3.forward, new Vector3(stickDirection.x, 0, stickDirection.y));
                    if (stickDirection.x < 0) stickAngle *= -1; //correct for mirrored left side of the control stick

                    //spawn target circle at location or move active teleport to that location & orient to controller
                    if (!activeTeleportTarget)
                    {
                        activeTeleportTarget = Instantiate(teleportTargetArrow, hit.point, new Quaternion(0, projectionPoint.rotation.y, 0, 1));
                    }
                    else
                    {
                        activeTeleportTarget.transform.position = hit.point;
                        activeTeleportTarget.transform.rotation = new Quaternion(0, projectionPoint.rotation.y, 0, 1);
                    }

                    //rotate by thumbstick angle
                    activeTeleportTarget.transform.Rotate(Vector3.up, stickAngle);
                }
                else
                {
                    Destroy(activeTeleportTarget);
                    activeTeleportTarget = null;
                }
                break;
            case ActionState.TELEPORTED: //just prevents you from uncontrollably spam-teleporting every frame while the trigger is held
                if (!triggerHeld || !stickActive) state = ActionState.TELEPORTING;
                break;
            default:
                Debug.LogError("IMPOSSIBLE STATE REACHED IN HAND.CS: " + state.ToString());
                break;
        }
	}

    private void SelectSpell(SpellSelector.Selection s)
    {
        currentSpell = equippedSpells[(int)s];
        CreateHandEffect();
    }

    //Creates the currently selected spell's hand effect, after deleting the old one if it exists.  Makes the new effect a child of this object's transform.
    private void CreateHandEffect()
    {
        if (currentSpellHandEffect)
        {
            Destroy(currentSpellHandEffect);
        }

        SpellProperties newSpell = currentSpell.GetComponent<SpellProperties>();
        if (newSpell && newSpell.handEffect)
        {
            currentSpellHandEffect = Instantiate(newSpell.handEffect, handEffectAnchor ? handEffectAnchor : transform);
        }
        else
        {
            Debug.LogWarning(currentSpell.name + " does not have a Hand Effect!");
        }
    }

    public Object getCurrentSpell()
    {
        return currentSpell;
    }
}
