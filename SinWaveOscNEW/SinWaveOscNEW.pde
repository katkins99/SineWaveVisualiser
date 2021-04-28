import processing.sound.*;
float amp = 0;
float amp2;
float ampMult;
float freq = 0;
float pan = 0;
int xspace = 1;
int w;
int n;
float theta = 0.0;
float repeat = 1000;
float incX;
float[] yval;
int[] wwf = {65, 125, 185, 255, 310, 380, 440, 500, 560 };

waveDraw wd = new waveDraw();
keyHandler kh = new keyHandler();
SinOsc sine = new SinOsc(this);
SawOsc saw = new SawOsc(this);

void setup() {

  size(1280, 720, P2D);
  frameRate(60);
  w = width+40;
  incX = (TWO_PI / repeat) * xspace;
  yval= new float[w/xspace];
}
void draw() {
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
