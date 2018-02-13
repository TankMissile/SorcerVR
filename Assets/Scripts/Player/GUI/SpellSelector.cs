using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/**
 * <summary>
 * This script is used for the in-game graphical spell selector - it does not control what spells are selected, only returns the slot number that was chosen.  
 * <para>It does, however, control what spell icons are shown in the selector.  For this, use <see cref="SetSpellIcon"/></para>
 * </summary>
 */
public class SpellSelector : MonoBehaviour {
    public enum Selection { NORTH, NORTHEAST, EAST, SOUTHEAST, SOUTH, SOUTHWEST, WEST, NORTHWEST }
    public enum SlotCount { FOUR, EIGHT };
    public SlotCount numSlots = SlotCount.FOUR;
    public GameObject cursor;
    private Selection selection;
    [Tooltip("Spell anchors, starting at NORTH and rotating clockwise")]
    public GameObject[] spellAnchors = new GameObject[8];
    public float iconZoomedScale = 1.2f;

    public void UpdateDirection(Vector2 d)
    {
        float angle = Vector2.Angle(Vector2.up, d);
        if (d.x < 0) angle *= -1;
        cursor.transform.localRotation = Quaternion.AngleAxis(angle, Vector3.up);
        
        selection = GetSelection();
        ScaleSpellIcons(selection);
    }

    public void SetSpellIcon(Selection s, GameObject newIcon)
    {
        if (spellAnchors[(int)s]) {
            if (spellAnchors[(int)s].transform.childCount > 0) Destroy(spellAnchors[(int)s].transform.GetChild(0).gameObject);
            Instantiate(newIcon, spellAnchors[(int)s].transform);
        }
    }

    private void ScaleSpellIcons(Selection s)
    {
        //Reset all to (1,1,1) and scale the correct Icon
        for(int i = 0; i < spellAnchors.Length; i++)
        {
            if(i != (int)s) spellAnchors[i].transform.localScale = Vector3.one;
            else spellAnchors[i].transform.localScale = new Vector3(iconZoomedScale, iconZoomedScale, iconZoomedScale);
        }
    }

    //I might be able to simplify this
    public Selection GetSelection()
    {
        float angle = cursor.transform.localRotation.eulerAngles.y;

        angle = angle % 360;
        switch (numSlots) {
            case SlotCount.FOUR:
                if (angle < 45 || angle >= 315) //up
                {
                    return Selection.NORTH;
                }
                else if (angle >= 45 && angle < 135) //right
                {
                    return Selection.EAST;
                }
                else if (angle >= 135 && angle < 225) //down
                {
                    return Selection.SOUTH;
                }
                else //left
                {
                    return Selection.WEST;
                }
            case SlotCount.EIGHT:
                if (angle < 22.5 || angle >= 337.5) //up
                {
                    return Selection.NORTH;
                }
                else if (angle >= 22.5 && angle < 67.5) //up-right
                {
                    return Selection.NORTHEAST;
                }
                else if (angle >= 67.5 && angle < 112.5) //right
                {
                    return Selection.EAST;
                }
                else if(angle >= 112.5 && angle < 157.5) //down-right
                {
                    return Selection.SOUTHEAST;
                }
                else if (angle >= 157.5 && angle < 202.5) //down
                {
                    return Selection.SOUTH;
                }
                else if (angle >= 202.5 && angle < 247.5) //down-left
                {
                    return Selection.SOUTHWEST;
                }
                else if(angle >= 247.5 && angle < 292.5)  //left
                {
                    return Selection.WEST;
                }
                else //up-left
                {
                    return Selection.NORTHWEST;
                }
            default:
                //this shouldn't happen.
                Debug.LogError("REAL BIG ISSUE IN SPELL SELECTOR.CS");
                return Selection.NORTH;
        }
    }
}
