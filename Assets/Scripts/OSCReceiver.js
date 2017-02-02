
public var RemoteIP : String = "127.0.0.1"; //127.0.0.1 signifies a local host (if testing locally
public var SendToPort : int = 9000; //the port you will be sending from
public var ListenerPort : int = 8050; //the port you will be listening on
public var controller : Transform;

public var controller02 : Transform;

public var RotateSpeed = 0.0f;

//the tag of the object on stage that you want to manipulate

public var gameReceiver = "Light"; //the tag of the object on stage that you want to manipulate
public var gameReceiver02 = "Sphere_Jupter"; 

private var handler : Osc;

//VARIABLES YOU WANT TO BE ANIMATED
private var yRot : float = 0; //the rotation around the y axis
private var xRot : float = 0; //the rotation around the x axis

private var SphereyRot : float = 0; //the rotation around the y axis
private var SpherexRot : float = 0; //the rotation around the y axis

public function Start ()
{
	//Initializes on start up to listen for messages
	//make sure this game object has both UDPPackIO and OSC script attached

	var udp : UDPPacketIO = GetComponent("UDPPacketIO");
	udp.init(RemoteIP, SendToPort, ListenerPort);
	handler = GetComponent("Osc");
	handler.init(udp);
	handler.SetAllMessageHandler(AllMessageHandler);

}
Debug.Log("Running");


private var speed = 0.0f;
public function SetSpeed (speed)
{
     this.RotateSpeed = speed;
}

function Update () {
	var go = GameObject.Find(gameReceiver);
	go.transform.Rotate((xRot+RotateSpeed)*Time.deltaTime, yRot*Time.deltaTime, 0);

	var sphere01 = GameObject.Find(gameReceiver02);
	sphere01.transform.Rotate(SpherexRot*Time.deltaTime,SphereyRot*Time.deltaTime,0);
}  

//These functions are called when messages are received
//Access values via: oscMessage.Values[0], oscMessage.Values[1], etc

public function AllMessageHandler(oscMessage: OscMessage){


	var msgString = Osc.OscMessageToString(oscMessage); //the message and value combined
	var msgAddress = oscMessage.Address; //the message parameters
	var msgValue :float;
	msgValue = oscMessage.Values[0]; //the message value
	//Debug.Log(msgValue); //log the message and values coming from OSC

	//FUNCTIONS YOU WANT CALLED WHEN A SPECIFIC MESSAGE IS RECEIVED
	switch (msgAddress){
	    case "/LightRotationY":
	        Rotate(msgValue);
	        break;

	   	case "/LightRotationX":
	        RotateX(msgValue);
	        break;

	    case  "/RotationY":
	        SphereYRotate(msgValue);
	        break;

	    case  "/RotationX":
	        SphereXRotate(msgValue);
	        break;

//		default:
//			Rotate(msgValue);
//			break;
	}

}


//FUNCTIONS CALLED BY MATCHING A SPECIFIC MESSAGE IN THE ALLMESSAGEHANDLER FUNCTION
public function Rotate(msgValue) : void //rotate the cube around its axis
{
	yRot = msgValue;
}


public function RotateX(msgValue) : void //rotate the cube around its axis
{
	xRot = msgValue;
}


public function SphereYRotate(msgValue) : void //rotate the cube around its axis
{
	SphereyRot = msgValue;
}


public function SphereXRotate(msgValue) : void //rotate the cube around its axis
{
	SpherexRot = msgValue;
}