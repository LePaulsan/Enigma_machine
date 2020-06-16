class Socket {
  PVector socket;
  char text;
  Socket(float tempX, float tempY, char tempT) {
    socket = new PVector(tempX, tempY);
    text = tempT;
  }
  
  void drawSocket() {
    stroke(0);
    noFill();
    ellipse(socket.x, socket.y + 10, 10, 10);
    ellipse(socket.x, socket.y - 10, 10, 10);
    
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(text, socket.x, socket.y - 40);
  }
}
