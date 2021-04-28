class keyHandler {

  keyHandler() {
    return;
  }

  void playStopSine() {
    if (keyPressed) {
      if (key == 'k' || key == 'K' ) {
        sine.play(freq, amp);
      }
      if (key == 'l' || key == 'L') {
        sine.stop();
      }
    }
  }

  void playStopSaw() { 
    if (keyPressed) {
      if (key == 'i' || key == 'I' ) {
        saw.play(freq, amp);
      }
      if (key == 'O' || key == 'O') {
        saw.stop();
      }
    }
  }


  void ampChange() {
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        amp = amp + 0.01;
        delay(10);
        if (amp >= 1) {
          amp = 1;
        }
      }
      if (key == 'a' || key == 'A') {
        amp = amp - 0.01;
        delay(10);
        if (amp <= 0) {
          amp = 0;
        }
      }
    }
  }

  void keyReleased() {
    if (key == 'q' || key == 'Q') {
      amp = amp;
    }
    if (key == 'a' || key == 'A') {
      amp = amp ;
    }
  }

  void freqChange() {
    if (keyPressed) {
      if (key == 'w') {
        if (n>=8) {
          n = 8;
        } else {
          n++;
        }
        freq = wwf[n];
      }
      if (key == 's') {

        if (n<=0) {
          n = 0;
        } else {
          n--;
        }
        freq = wwf[n];
      }
    }
  }
}
