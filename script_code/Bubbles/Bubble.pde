float pressure = 9.85; // global variable (simulating water pressure)

class Bubble {
  PVector pos;
  int size;
  float speed = 0;

  // Empty constructor (for cases where a bubble is created without parameters)
  Bubble() {
  }

  //Primary constructor with parameters
  Bubble(int x, int y, int size) {
    pos = new PVector(x, y);
    this.size = size;
    // Speed ​​depends on pressure and size (larger size = higher speed)
    speed = (pressure * size) * 0.005f; 
  }

  void update() {
    pos.y -= speed; // A bubble floats upward
    
    // If the bubble has flown off past the top edge of the screen
    if (pos.y + (size / 2) < 0) {
      pos.y = height + (size / 2);      // We move it back down
      pos.x = random(0, width);         // Assign a new random horizontal position
      size = (int)random(2, 40);        // Assign a new random size
      speed = (pressure * size) * 0.005f; // Recalculating speed for the new size
    }
  }

  void render() {
    noFill();         // The inside of the small bottle is transparent.
    stroke(255);      // White outline
    ellipse(pos.x, pos.y, size, size); // Drawing a circle
  }
}
