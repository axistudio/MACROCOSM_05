using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotation4Timeline : MonoBehaviour {
    public float TLRotatinoSppedX = 0.0f;
    public float TLRotatinoSppedY = 0.0f;
    // Use this for initialization
    private Vector3 pos;

    void Awake()
    {
        pos = new Vector3(0, 0, 0);
    }


    void Update()
    {
        pos.y = TLRotatinoSppedY * Time.deltaTime;
        pos.x = TLRotatinoSppedX * Time.deltaTime;
        transform.Rotate(pos);
    }
}
