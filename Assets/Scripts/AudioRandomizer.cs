using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioRandomizer : MonoBehaviour {
    public bool changeOnLoop = false;
    public float timeToChange;
    public bool destroyAfterSound = false;

    public AudioClip[] options;


	// Use this for initialization
	void Start () {
        ChooseAudio();
    }

    void Update()
    {
        if (changeOnLoop) {
            timeToChange -= Time.deltaTime;

            if (timeToChange <= 0)
            {
                ChooseAudio();
            }
        }
    }

    void ChooseAudio()
    {
        AudioSource source = GetComponent<AudioSource>();

        if (options.Length > 0 && source)
        {
            source.clip = options[Random.Range(0, options.Length)];
            source.Play();
        }

        if (changeOnLoop)
        {
            timeToChange = source.clip.length;
        }

        if (destroyAfterSound) Destroy(gameObject, source.clip.length);
    }
}
