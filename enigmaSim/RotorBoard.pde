class RotorBoard {
  // the 5 rotor config dont delete
  char[][] rotorI = {{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}, 
    {'p', 'e', 'z', 'u', 'o', 'h', 'x', 's', 'c', 'v', 'f', 'm', 't', 'b', 'g', 'l', 'r', 'i', 'n', 'q', 'j', 'w', 'a', 'y', 'd', 'k'}}; 

  char[][] rotorII = {{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}, 
    {'z', 'o', 'u', 'e', 's', 'y', 'd', 'k', 'f', 'w', 'p', 'c', 'i', 'q', 'x', 'h', 'm', 'v', 'b', 'l', 'g', 'n', 'j', 'r', 'a', 't'}};

  char[][] rotorIII = {{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}, 
    {'e', 'h', 'r', 'v', 'x', 'g', 'a', 'o', 'b', 'q', 'u', 's', 'i', 'm', 'z', 'f', 'l', 'y', 'n', 'w', 'k', 't', 'p', 'd', 'j', 'c'}};

  char[][] rotorIV = {{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}, 
    {'e', 's', 'o', 'v', 'p', 'z', 'j', 'a', 'y', 'q', 'u', 'i', 'r', 'h', 'x', 'l', 'n', 'f', 't', 'g', 'k', 'd', 'c', 'm', 'w', 'b'}};

  char[][] rotorV = {{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}, 
    {'v', 'z', 'b', 'r', 'g', 'i', 't', 'y', 'u', 'p', 's', 'd', 'n', 'h', 'l', 'x', 'a', 'w', 'm', 'j', 'q', 'o', 'f', 'e', 'c', 'k'}};

  //----------------Config here-------------------------------
  // these 3 number set the initial value of the 3 rotors
  int rotor0_init_Num = 1;
  int rotor1_init_Num = 1;
  int rotor2_init_Num = 1;

  // put in rotor order name [rotorI, rotorII, rotorIII, rotorIV, rotorV]
  char[][] first_slot = rotorI;
  char[][] second_slot = rotorII;
  char[][] third_slot = rotorIII;

  Rotor rotor0;
  Rotor rotor1;
  Rotor rotor2;
  
  RotorBoard() {
    rotor0 = new Rotor(rotor2_init_Num, third_slot);
    rotor1 = new Rotor(rotor1_init_Num, second_slot);
    rotor2 = new Rotor(rotor0_init_Num, first_slot);
  }

  // this encrypt the input
  char encrypt (char tempKey) {
    char temp0 = rotor0.receive_signal(tempKey);
    char temp1 = rotor1.receive_signal(temp0);
    char temp2 = rotor2.receive_signal(temp1);
    char temp3 = rotor0.return_signal(temp2);
    temp2 = rotor2.receive_returned_signal(temp3);
    temp1 = rotor1.receive_returned_signal(temp2);
    temp0 = rotor0.receive_returned_signal(temp1);
    return temp0;
  }
  
  /*this part move the rotor up when pressed a key and
    move the next rotor when the first roll over*/
  void rollRotor () {
    rotor2.roll(rotor2.checkRoll(rotor1));
    rotor1.roll(rotor1.checkRoll(rotor0));
    rotor0.roll(true);
  }
  
  //display the 3 rotor
  void displayRotor() {
    rotor0.display(340, 20);
    rotor1.display(280, 20);
    rotor2.display(220, 20);
  }
}
