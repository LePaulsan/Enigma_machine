AllLamp ls;

RotorBoard rs;

PlugBoard pb;

int[] hand = {-1};

// the program will break if you delete this
boolean checkOnce = false;

char result;
void setup() {
  size(640, 600);
  ls = new AllLamp();
  rs = new RotorBoard();
  pb = new PlugBoard();
  
  pb.updateConnect();
}


void draw () {
  background(200);

  pb.hoverCheck();
  pb.pickUp();


  //draw the lamp and rotor only
  ls.drawAllLamp();
  ls.lampFind(result);
  rs.displayRotor(); 

  // Plug board is the only connection left
  pb.drawSockets();
  pb.drawPlugs();
}

// ---------------------------------

void keyPressed() {
  
  // pass through the plug board
  char firstLap = pb.transfer(key);
  //get the key, encrypt it
  char secondLap = rs.encrypt(firstLap);
 
  // return through the plug board
  result = pb.transfer(secondLap);
  println(result);
  
  if (check) {
    rs.rollRotor();
    // this prevent you from over clicked 
    check = false;
  }
}

// this is here to keep the program from checking too many time
void keyReleased() {
  check = true;
}

void mousePressed() {
  // dont delete, the program will break
  checkOnce = false;
}

// update plug board and snap the plug in 
void mouseReleased() {
  if (!checkOnce) {
    pb.insertIn();
    pb.updateConnect();
    checkOnce = true;
  }
}
