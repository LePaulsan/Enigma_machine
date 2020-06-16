class PlugBoard {
  String input = "abcdefghijklmnopqrstuvwxyz";

  // Declare plugs
  PlugPair[] plugPairs = new PlugPair[11];
  // Declar sockets
  Socket[] sockets = new Socket[26];

  char[][] config = new char[11][2];

  PlugBoard() {
    // Plug init
    for (int i = 0; i < 11; i++) {
      plugPairs[i] = new PlugPair(45*i + 45, 500);
    }

    // Socket init
    for (int i = 0; i < 26; i++) {
      if (i < 13) {
        sockets[i] = new Socket(i * 45 + 45, 350, input.charAt(i));
      } else {
        sockets[i] = new Socket((i - 13) * 45 + 45, 450, input.charAt(i));
      }
    }
  }

  // plug method
  void drawPlugs() {
    //background(200); 
    for (int i = 0; i < 11; i++) {
      plugPairs[i].drawPlugPair();
    }
  }

  void hoverCheck() {
    for (int i = 0; i < 11; i++) {
      if (plugPairs[i].checkHover()) {
        hand[0] = i; 
        break;
      }
      hand[0] = -1;
    }
  }

  void pickUp() {
    if (mousePressed) {
      if (hand[0] != -1) {
        plugPairs[hand[0]].pickUpPlug();
      }
    }
  }

  // socket method
  void drawSockets() {
    //background(200); 
    for (int i = 0; i < 26; i++) {
      sockets[i].drawSocket();
    }
  }

  void insertIn() {
    for (int i = 0; i < 26; i++) {
      if (hand[0] != -1) {
        plugPairs[hand[0]].snapIns(sockets[i]);
      }
    }
  }

  void updateConnect() {
    for (int i = 0; i < 11; i++) {
      config[i] = plugPairs[i].connect;
      println(config[i]);
    }
  }
  
  char transfer(char input) {
    for (int i = 0; i < 11; i++) {
      if (config[i][0] == input) {
        println("here");
        return config[i][1];
      } else if (config[i][1] == input) {
        println("here");
        return config[i][0];
      }
    }
    return input;
  }
}
