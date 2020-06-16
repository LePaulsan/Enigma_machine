class Plug {
  PVector plug;
  
  Plug(float tempX, float tempY) {
    plug = new PVector(tempX, tempY);
  }
  void drawPlug() {
    stroke(0);
    fill(100);
    rectMode(CENTER);
    rect(plug.x, plug.y, 30, 50, 4*PI);
  }

  boolean hover() {
    return dist(plug.x, plug.y, mouseX, mouseY) < 20;

  }

  void  pickUp() {
    plug = new PVector(mouseX, mouseY);
  }

  boolean snapIn(Socket s) {
    if (dist(plug.x, plug.y, s.socket.x, s.socket.y) < 20) {
      plug = s.socket.copy();
      return true;
    }
    return false;
  }
}
