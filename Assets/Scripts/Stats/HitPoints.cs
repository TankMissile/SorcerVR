using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Spells;

public class HitPoints : MonoBehaviour {
    public float maxHp = 100, hp = 100;
    public enum TargetType {  PLAYER1, PLAYER2, ENEMY }
    public TargetType type = TargetType.ENEMY; //which attacks damage this health bar

    [Header("GUI")]
    public Image healthBar;
    public DamageNumbers damageNumbers;

	// Use this for initialization
	void Start () {
        hp = maxHp;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnCollisionEnter(Collision col)
    {
        //Debug.Log("Should take damage from " + col.gameObject.name);
        if (col.gameObject.tag == "target_all")
        {
            Damage(GetDamageFromCollision(col));
        }
        else
        {
            switch (type)
            {
                case TargetType.ENEMY:
                    if (col.gameObject.tag == "target_enemy")
                    {
                        Damage(GetDamageFromCollision(col));
                    }
                    break;
                case TargetType.PLAYER1:
                    if (col.gameObject.tag == "target_player1")
                    {
                        Damage(GetDamageFromCollision(col));
                    }
                    break;
                case TargetType.PLAYER2:
                    if (col.gameObject.tag == "target_player2")
                    {
                        Damage(GetDamageFromCollision(col));
                    }
                    break;
                default:

                    break;
            }
        }
    }

    private float GetDamageFromCollision(Collision col)
    {
        SpellProperties sp = col.gameObject.GetComponent(typeof(SpellProperties)) as SpellProperties;
        //Debug.Log("Should take " + sp.getDamage() + " damage.");
        if (sp) return sp.GetDamage();
        else return 0;
    }

    public void Damage(float damage, bool showDamageNumbers = true)
    {
        hp -= damage;
        if (healthBar)
        {
            healthBar.fillAmount = (hp / maxHp);
        }

        if(showDamageNumbers) SetDamageNumbers(damage);
    }

    private void SetDamageNumbers(float dmg)
    {
        if (!damageNumbers) return;

        damageNumbers.Damage(dmg);
    }
}
