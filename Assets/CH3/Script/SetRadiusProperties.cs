using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]
public class SetRadiusProperties : MonoBehaviour {

    // Use this for initialization


    public Material radiusMaterial;
    public float    radius          = 1;
    public Color    color           = Color.white;


	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if(radiusMaterial!= null)
        {
            radiusMaterial.SetVector("_Center",     transform.position);
            radiusMaterial.SetFloat("_Radius",      radius);
            radiusMaterial.SetColor("_RadiusColor", color);
        }
	}
}
