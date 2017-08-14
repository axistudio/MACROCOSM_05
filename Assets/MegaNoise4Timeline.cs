using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MegaNoise4Timeline : MonoBehaviour {

    private MegaNoise megaNoise;
    public Vector3 megaStrengthInTimeline;
    public float freqInTimeline;
    public float scaleInTimeline;
    // Use this for initialization
    void Start()
    {
        megaStrengthInTimeline = new Vector3(0, 0, 0);
        freqInTimeline = 0.25f;
        megaNoise = GetComponent<MegaNoise>();
    }

    // Update is called once per frame
    void Update()
    {
        megaNoise.Strength = megaStrengthInTimeline;
        megaNoise.Scale = 1.0f - scaleInTimeline;
        megaNoise.Freq = freqInTimeline;
    }
}
