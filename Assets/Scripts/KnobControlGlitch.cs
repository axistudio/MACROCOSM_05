using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Kino;

public class KnobControlGlitch : MonoBehaviour {
	private AnalogGlitch anlogGlitch;
	private float sliderValue;
	private float sliderValue02;
	private float sliderValue03;
	// Use this for initialization
	void Awake () {
		anlogGlitch = GetComponent<AnalogGlitch>();

	}
	void Start () {
		sliderValue = 0.0f;
		sliderValue02 = 0.0f;
		sliderValue03 = 0.0f;
	}
	public void changeVertcial (float v){
		sliderValue = v;

	}

	public void changeHonrizatal (float h){
		sliderValue02 = h;
	}

	public void changeColorShift (float c){
		sliderValue03 = c;
	}
	// Update is called once per frame
	void Update () {
		anlogGlitch.verticalJump = sliderValue;
		anlogGlitch.horizontalShake = sliderValue02;
		anlogGlitch.colorDrift = sliderValue03;

	}
}
