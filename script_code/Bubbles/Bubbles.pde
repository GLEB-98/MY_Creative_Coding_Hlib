int bubbleCount = 1000;
Bubble[] bubbles = new Bubble[bubbleCount];

void setup() {
  size(500, 750); // Making a window
  
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble((int)random(0, width), (int)random(0, height), (int)random(2, 50));
  }
}

void draw() {
  background(0, 125, 125); // paint the background a turquoise water color
  
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
  }
}
