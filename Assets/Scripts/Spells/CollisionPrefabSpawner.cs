using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollisionPrefabSpawner : MonoBehaviour {
    public GameObject[] toSpawn;
    public enum DestroyType {  NONE, SELF, PARENT, ROOT };
    public DestroyType destroy = DestroyType.SELF;
    public float destroyDelay = 0.1f;


    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("Collision!");
        for (int i = 0; i < toSpawn.Length; i++)
        {
            Instantiate(toSpawn[i], transform.position, transform.rotation);
        }
        switch (destroy)
        {
            case DestroyType.SELF:
                Debug.Log("Destroy Self!");
                Destroy(gameObject, destroyDelay);
                break;
            case DestroyType.PARENT:
                Debug.Log("Destroy Parent!");
                Destroy(transform.parent, destroyDelay);
                break;
            case DestroyType.ROOT:
                Debug.Log("Destroy Root!");
                Destroy(transform.root, destroyDelay);
                break;
            default:
                break;
        }
    }
}
