class PlugPair {
  Plug plug0;
  Plug plug1;
  int[] hand = {-1};

  char[] connect = {' ', ' '};

  PlugPair(float tempX0, float tempY0) { 
    plug0 = new Plug(tempX0, tempY0);
    plug1 = new Plug(tempX0, tempY0);
  }

  void drawPlugPair() {
    stroke(0);
    line(plug0.plug.x, plug0.plug.y, plug1.plug.x, plug1.plug.y);
    plug0.drawPlug();
    plug1.drawPlug();
  }

  boolean checkHover() {
    hand[0] = -1;

    if (plug0.hover() && hand[0] != 1) {
      hand[0] = 0;
      return true;
    } else if (plug1.hover() && hand[0] != 0) {
      hand[0] = 1;
      return true;
    } else {
      return false;
    }
  }

  void pickUpPlug() {
    if (hand[0] == 0) {
      plug0.pickUp();
    }
    if (hand[0] == 1) {
      plug1.pickUp();
    }
  }

  void snapIns(Socket s) {
    if (plug0.snapIn(s)) {
      connect[0] = s.text;
    }
    if (plug1.snapIn(s)) {
      connect[1] = s.text;
    }
  }
}
