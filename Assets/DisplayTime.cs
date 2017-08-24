using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using System.Globalization;




public class DisplayTime : MonoBehaviour {
    private Text textClock;
    // Use this for initialization
    private DateTime DateVar;
    private int[] addValue;

    public float[] randValues;

    public float RandValueOnTimer;
    public float RandValueOnYears;

    private DateTime newDates;
    private int newYear;
    void Start () {
        textClock = GetComponent<Text>();
        DateVar = DateTime.Now;
        addValue = new int[2];
        randValues = new float[2];
        newDates = DateVar;
        newYear = DateVar.Year;

    }

    private float FramePeriod = 0.0f;
	
	// Update is called once per frame
	void Update () {
        DateTime localDate = DateTime.Now;
        String localCulture = "en-GB";
        var culture = new CultureInfo(localCulture);
        //textClock.text = localDate.ToString(culture);


        //string hourVar = DateTime.Now.Date.ToString();
        for (int i = 0; i < randValues.Length; i++)
        {
           
        }

        addValue[0] += (int)UnityEngine.Random.Range(0, RandValueOnTimer);

        addValue[1]  += (int)UnityEngine.Random.Range(0, RandValueOnYears);

        newDates = DateTime.Now.AddSeconds(addValue[0]);

        if (FramePeriod > 0.1f)
        {
            //Do Stuff
            newYear += (int)RandValueOnYears;
            FramePeriod = 0.0f;
        }
        FramePeriod += UnityEngine.Time.deltaTime;
        


        string dateVar = newDates.Day.ToString("00");
        string monthVar = newDates.Month.ToString("00");
        string yearVar = newYear.ToString();
        string hourVar = newDates.Hour.ToString("00");
        string minteVar = newDates.Minute.ToString("00");
        string secVar = newDates.Second.ToString("00");
        string milsecVar = DateTime.Now.Millisecond.ToString("000");


        textClock.text = dateVar+"/"+monthVar+"/"+yearVar+" "+hourVar+":"+ minteVar+":"+ secVar + "."+ milsecVar;


    }

}
