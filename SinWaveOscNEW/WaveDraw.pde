class waveDraw {

  waveDraw() {
  }

  void calc() {
    //Re-written to show the sine wave emmiting from the oscilator.Originally from daniel shiffmans sinewave visualiser. (https://processing.org/examples/sinewave.html) 
    amp2 = amp*100;
    theta += freq/10;
    float x = theta;
    for (int i = 0; i < yval.length; i++) {
      yval[i] = sin(x)*amp2;
      x+=incX;
    }
  }

  void render() {

    fill(255);
    for (int x = 0; x < yval.length; x++) {
      fill(255);
      stroke(255);
      strokeWeight(10);
      //ellipse(x*xspace, height/2+yval[x], 16, 16); //Daniel shiffmans ellipse sinewave visualiser. (https://processing.org/examples/sinewave.html)
      // I altered Daniels work by using values set by the user from the sine wave oscilator. This means the sine wave shown on screen is the same as what is being played.
      line(x*xspace,height/2+yval[x] ,x*xspace,height); // My version using lines.
      //line(x*xspace,height/2+yval[x] ,x*xspace,height/2-yval[x]); // concept using lines which mirror each other from top to bottom.
    }
  }
}
