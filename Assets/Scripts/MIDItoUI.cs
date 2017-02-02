using UnityEngine;
using UnityEngine.UI; 
using MidiJack;
using VJUI;

public class MIDItoUI : MonoBehaviour {
	public int knobNumber;
	public Knob slider;

	void Awake () {
	}

	void Start () {
		
	}


	void Update () {
		var s = MidiMaster.GetKnob(knobNumber);
		slider.value = s*slider.maxValue;
	}
}
