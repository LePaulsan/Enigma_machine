//this boolean keep you from over click
boolean check = true;

class Lamp {
  PVector location;
  char letter;


  Lamp (float tempX, float tempY, char tempL) {
    location = new PVector(tempX, tempY);
    letter = tempL;
  }

  void drawLamp() {
    noStroke();
    fill(255);
    circle(location.x, location.y, 35);

    textSize(20);
    fill(0);
    textAlign(CENTER);
    text(letter, location.x, location.y + 8);
  }
  // accept input, true if input is the right lamp number
  boolean checkInput(char input) {
    return input == letter;
  }

  // light up lamp
  void lightUp() {
    noStroke();
    fill(255, 255, 0, 150);
    circle(location.x, location.y, 40);
  }
}
