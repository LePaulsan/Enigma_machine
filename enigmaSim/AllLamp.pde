class AllLamp {
  //declare the lamps
  char[] let = {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'};
  Lamp[] lamps = new Lamp[26];

  AllLamp() {
    // this part declare all the lamp and put it in an array
    for (int i = 0; i < 26; i++) {
      if (i < 10) {
        lamps[i] = new Lamp(60*i + 50, 110, let[i]);
      } else if (i >= 10 && i < 19 ) {
        lamps[i] = new Lamp(60*(i - 10 ) + 90, 180, let[i]);
      } else if (i >= 19) {
        lamps[i] = new Lamp(60*(i - 19) + 130, 250, let[i]);
      }
    }
  }

  // draw all the lamp on the screen
  void drawAllLamp () {
    for (int i=0; i<26; i++) {
      lamps[i].drawLamp();
    }
  }

  // this light up result's lamp 
  void lampFind (char result) {
    for (int i=0; i<26; i++) {
      if (lamps[i].checkInput(result)) {
        lamps[i].lightUp();
        break;
      }
    }
  }
}
