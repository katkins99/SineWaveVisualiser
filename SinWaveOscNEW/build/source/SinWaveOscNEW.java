import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SinWaveOscNEW extends PApplet {


float amp = 0;
float amp2;
float ampMult;
float freq = 0;
float pan = 0;
int xspace = 16;
int w;
float theta = 0.0f;
float repeat = 500;
float incX;
float[] yval;
waveDraw wd = new waveDraw();
keyHandler kh = new keyHandler();
SinOsc sine = new SinOsc(this);
SawOsc saw = new SawOsc(this);

public void setup() {

  
  frameRate(60);
  w = width+40;
  incX = (TWO_PI / repeat) * xspace;
  yval= new float[w/xspace];
}
public void draw() {
  background(0);
  sine.play(freq,amp);
  wd.calc();
  wd.render();
  kh.ampChange();
  kh.freqChange();
  kh.playStopSine();
  kh.playStopSaw();
  println(freq);
  println(amp);
}
class keyHandler {

  keyHandler() {
    return;
  }

  public void playStopSine() {
    if (keyPressed) {
      if (key == 'k' || key == 'K' ) {
        sine.play(freq, amp);
      }
      if (key == 'l' || key == 'L') {
        sine.stop();
      }
    }
  }

  public void playStopSaw() { 
    if (keyPressed) {
      if (key == 'i' || key == 'I' ) {
        saw.play(freq, amp);
      }
      if (key == 'O' || key == 'O') {
        saw.stop();
      }
    }
  }


  public void ampChange() {
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        amp = amp + 0.01f;
        delay(10);
        if (amp >= 1) {
          amp = 1;
        }
      }
      if (key == 'a' || key == 'A') {
        amp = amp - 0.01f;
        delay(10);
        if (amp <= 0) {
          amp = 0;
        }
      }
    }
  }

  public void keyReleased() {
    if (key == 'q' || key == 'Q') {
      amp = amp;
    }
    if (key == 'a' || key == 'A') {
      amp = amp ;
    }
  }

  public void freqChange() {
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        freq = freq + 10;
      }
      if (key == 's' || key == 'S') {
        freq = freq - 10;
      }
    }
  }
}
class waveDraw {

  waveDraw() {
  }

  public void calc() {
    amp2 = amp*100;
    theta += freq/10;
    float x = theta;
    for (int i = 0; i < yval.length; i++) {
      yval[i] = sin(x)*amp2;
      x+=incX;
    }
  }

  public void render() {

    fill(255);
    for (int x = 0; x < yval.length; x++) {
      rect(x*xspace, height/2+yval[x], 16, 16);
      line(x*xspace, height/2+yval[x],x*xspace, 0);
    }
  }
}
  public void settings() {  size(1280, 720, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SinWaveOscNEW" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
