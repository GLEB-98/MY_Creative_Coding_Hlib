import ddf.minim.*;

Minim minim;
AudioInput in;
PImage monsterImg;

RainDrop[] drops = new RainDrop[100]; 
String lastState = ""; 

// Variable for smooth size transition
float monsterSize = 200; 

void setup() {
  size(600, 600);
  
  minim = new Minim(this);
  in = minim.getLineIn(); 
  
  monsterImg = loadImage("monster.png");
  
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new RainDrop();
  }
}

void draw() {
  float vol = in.mix.level();

  // 1. CONSOLE 
  String currentState = "";
  
  if (vol < 0.02) {
    currentState = "Silence...";
  } else if (vol < 0.15) {
    currentState = "Weak sound (Volume: " + vol + ")";
  } else {
    currentState = "Loud sound! (Volume: " + vol + ")";
  }
  
  if (!currentState.equals(lastState)) {
    println(currentState);
    lastState = currentState;
  }
  

  // 2. BACKGROUND 
  if (vol > 0.15 || random(100) < 1) {
    background(200, 200, 255); 
  } else {
    background(30); 
  }
  

  // 3. SMOOTH MONSTER REACTION (Drawn BEHIND the rain)
  imageMode(CENTER);
  
  float targetSize = 200; // Default target size (in silence)
  
  if (vol > 0.02) { 
    targetSize = 300 + (vol * 1000); // Target size when sound is detected
    tint(255); 
  } else {
    tint(50); 
  }
  
  // The lerp function makes the transition smooth
  monsterSize = lerp(monsterSize, targetSize, 0.1);
  image(monsterImg, width / 2, height / 2, monsterSize, monsterSize);
  
  // 4. RAIN (Drawn IN FRONT of the monster)
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}


// Class for the rain
class RainDrop {
  float x;
  float y;
  float speed;

  RainDrop() {
    x = random(width);
    y = random(-500, 0);
    speed = random(5, 10);
  }

  void fall() {
    y = y + speed; 
    if (y > height) {
      y = random(-200, 0); 
      x = random(width);
    }
  }

  void show() {
    stroke(150, 150, 255); 
    strokeWeight(2);
    line(x, y, x, y + 15);
  }
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
