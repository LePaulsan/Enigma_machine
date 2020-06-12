char[][] reflector = {{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}, 
                      {'i','m','e','t','c','g','f','r','a','y','s','q','b','z','x','w','l','h','k','d','v','u','p','o','j','n'}};

class Rotor {
  int rotor_No;
  char[][] rotor;

  Rotor (int tempI, char[][] tempL) {
    rotor_No = tempI;
    rotor = tempL;
  }

  // This guy just roll up the number if the previous reached 26
  void roll (boolean preR) {
    if (preR) {
      if (rotor_No < 26) {
        rotor_No ++;
      } else {
        rotor_No = 1;
      }
    }
  }

  // this fucking function get the imput, encode it and spit out the result
  char receive_signal(char tempK) {
    // these js are place holder for many indexes to referace code 
    int j = 0;
    
    //i fucking hate this part of the code
    while (rotor[0][j] != tempK) {
      j++;
    }
    if (j + (rotor_No - 1) > 25) {
      j = j - 26 + (rotor_No - 1);
    } else {
      j = j + (rotor_No - 1);
    }
    tempK = rotor[1][j];


    j = 0;
    while (rotor[0][j] != tempK) {
      j++;
    }

    if (j < (rotor_No - 1)) {
      j = 26 + j - (rotor_No - 1);
    } else {
      j = j - (rotor_No - 1);
    }
    return rotor[0][j];
  }

  // this method did the same as the previous just opposite diretion
  char receive_returned_signal(char tempK) {
    int j = 0;

    while (rotor[0][j] != tempK) {
      j++;
    }

    if (j + (rotor_No - 1) > 25) {
      j = j - 26 + (rotor_No - 1);
    } else {
      j = j + (rotor_No - 1);
    }
    tempK = rotor[0][j];
    j = 0;
    while (rotor[1][j] != tempK) {
      j++;
    }
    if (j < (rotor_No - 1)) {
      j = 26 + j - (rotor_No - 1);
    } else {
      j = j - (rotor_No - 1);
    }
    return rotor[0][j];
  }

  // this function reflect the value back to the rotor
  char return_signal (char signal) {
    int j = 0;

    while (reflector[0][j] != signal ) {
      j++;
    }
    return reflector[1][j];
  }

  // this function display the rotor current nunber
  void display(int x, int y) {
    stroke(0);
    fill(200);
    rect(x, y, 26, 50);

    textSize(20);
    fill(0);
    textAlign(CENTER, CENTER);
    text(rotor_No, x + 13, y + 25);
  }

  // this method check if the previous wheal has turn over yet
  boolean checkRoll (Rotor tempR) {
    if (tempR.rotor_No == 26) {
      return true;
    } else {
      return false;
    }
  }
}
