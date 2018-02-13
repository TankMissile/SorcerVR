using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingDummy : MonoBehaviour {
    public float moveSpeed = 10; //units per second

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.Rotate(transform.up * -25f * Time.deltaTime);
        transform.localPosition += transform.forward * moveSpeed * Time.deltaTime;
	}
}
