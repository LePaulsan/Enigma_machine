//this boolean keep you from over click
boolean check = true;

class Lamp {
  float x_loc, y_loc;
  char letter;


  Lamp (float tempX, float tempY, char tempL) {
    x_loc = tempX;
    y_loc = tempY;
    letter = tempL;
  }

  void drawLamp() {
    stroke(100);
    fill(255);
    circle(x_loc, y_loc, 35);

    textSize(20);
    fill(0);
    textAlign(CENTER);
    text(letter, x_loc, y_loc + 8);
  }

  void lightUp(char i) {
    if (i == letter) {
      stroke(255);
      fill(255, 255, 0, 150);
      circle(x_loc, y_loc, 30);
    }
  }
}
