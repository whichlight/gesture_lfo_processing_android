This is a one dimensional gesture recorder written in processing.  A longer
description can be found here
http://whichlight.com/blog/innovative-user-interfaces-for-the-android-using-processing/
which includes a browser based demo.  

I wrote this as an interface to produce looped patterns from a recorded gesture.
When you touch the screen record begins and when you let go recording stops, and
then loops.  

The values of the loop can be hooked into anything that can take a parameter
from 0 to 255, so visualizations, LEDs, or sounds for example.  The range of
values can be changed, I just used 0 to 255 because I wrote this app to control
PWM on the Arduino.  