

/*
Captures and remembers hand gestures in one dimension 
 loops them 
 
 val goes from 0 to 255
 */

//int width = 512;
//int height = 512;

//ui 

PFont font; 


//gesture vars
float[] gesture = new float[32768]; //reads from the buffer 
boolean g = false;
int gLength = 1;
int index = 0;



//value that is sent out to UI
float out = 0; 

//value sent out to BT
float motorVal = 0;

//center vector
PVector c;


/******************
 //// SETUP//// ////
 ******************/

void setup() {


  size(800, 400);



  font = loadFont("CourierNewPSMT-48.vlw");
  colorMode(HSB, 360, 100, 100);
  c = new PVector(width/2, height/2);

  for (int i=0; i<gesture.length;i++) {
    gesture[i]=0;
  }
}


/******************
 //// DRAW /////////
 ******************/
void draw() {

  update();
  drawBackground();

  displayGestureVal();
  drawGestureLine();
  motorVal = map(out, 0, height, 0, 255);
}

/******************
 //// FUNCTIONS ////
 ******************/

void drawBackground() {

  background(0, 0, map(out, 0, 255, 0, 100));
}

void drawGestureLine() {
  //first get the full gesture, draw whichever part you are on. 
  //currently on (gesture[index]);

  //go along length of gesture and draw it all
  float rad = 10;
  float interval = width/float(gLength);
  float maxGesture = max(gesture);
  float x, y;

  for (int i=0; i<gLength;i++) {

    x = i*interval;
    y = height-gesture[i];
    noStroke();
    fill(150, 100, 100);
    ellipse(x, y, rad, rad);
  }

  //mark where you are 

  x = index*interval;
  y = height-gesture[index];
  noStroke();
  fill(244, 100, 100);
  ellipse(x, y, rad, rad);
}

