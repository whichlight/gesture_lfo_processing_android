void smoothArray(int len, int numAve) {
  //compute moving average with numAve values before and 
  //numAve values after
  //len is the length of the gesture 

  //for smaller gestures
  numAve%=len;

  float[] new_arr = new float[len];


  for (int i=0; i<len;i++) {
    //calc average
    float sum = gesture[i];
    for (int j=0; j<numAve;j++) {
      sum+=gesture[(i+j)%len];

      if ((i-j)<0) { 
        sum+=gesture[len-1+(i-j)];
      }
      else {
        sum+=gesture[(i-j)];
      }
    }

    new_arr[i]=sum/(2*numAve+1);
  } 

  for (int i=0; i<len;i++) {
    gesture[i]=new_arr[i];
  }
}

void update() {

  if (mousePressed==true) {
    if (!g) { 
      index = 0;
    }
    gesture[index]=getVal();
    out = gesture[index];
    g = true; 
    index++;
    if (gLength<index) {
      gLength++;
    }
  }


  if (mousePressed==false) {
    if (g) {
      gLength=index; 
      println(gLength);
      index=0;

      smoothArray(gLength, 5);
    }
    out = (gesture[index]);
    index++;
    index%=gLength;
    g=false;
  }
}

float getVal() {
  float val = height-mouseY;
  // println(val);
  return val;
}

void seeGestureVals() {
  for (int i=0;i<gLength;i++) {
    print(map(int(gesture[i]), 0, height, 0, 255));
    print(" ");
  } 
  println("");
}

