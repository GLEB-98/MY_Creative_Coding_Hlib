import ddf.minim.*;
import ddf.minim.ugens.*; // Audio effects library
import ddf.minim.spi.*;   // System library for AudioStream

Minim minim;
AudioInput in;
AudioOutput out;

LiveInput liveIn;
BitCrush crushEffect;
Delay delayEffect;

PImage monsterImg;

// Microphone sensitivity threshold
float soundThreshold = 0.009; 

// Variables for smooth appearance of the COLOR layer over the rain
float currentReveal = 0; 
float currentSize = 250;

// Lightning brightness variable
float lightningFlash = 0;

RainDrop[] drops = new RainDrop[150];

void setup() {
  size(600, 600);

  minim = new Minim(this);
  
  // 1. Microphone input
  in = minim.getLineIn(); //Minim.MONO, 512
  
  // 2. Headphone output
  out = minim.getLineOut();
  
  // 3. Capture live sound for effects
  AudioStream stream = minim.getInputStream(Minim.MONO, out.bufferSize(), out.sampleRate(), out.getFormat().getSampleSizeInBits());
  liveIn = new LiveInput(stream);
  
  // 4. Distortion effect (4-bit sound makes the voice creepy)
  crushEffect = new BitCrush(4, out.sampleRate());
  
  // 5. Echo effect (0.4 sec delay, 0.5 decay)
  delayEffect = new Delay(0.4, 0.5, true, true);
  
  // 6. Connect audio route: Live Mic -> Distortion -> Echo -> Headphones
  liveIn.patch(crushEffect).patch(delayEffect).patch(out);

  // Load monster image
  monsterImg = loadImage("monster.png");

  // Create rain drops
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new RainDrop();
  }
}

void draw() {
  // Read current microphone volume
  float volume = in.mix.level();
  
  // ==========================================
  // LIGHTNING EFFECT
  // ==========================================
  // Lightning strikes randomly (0.3% chance per frame) OR if you scream really loud
  if (random(100) < 0.3 || volume > soundThreshold * 5) {
    lightningFlash = 255; // Max brightness
  }
  
  // Fade out the lightning very quickly
  lightningFlash = lerp(lightningFlash, 0, 0.15); 
  
  // Draw background with lightning flash added to the dark colors
  background(25 + lightningFlash, 25 + lightningFlash, 35 + lightningFlash);

  // TARGET VALUES FOR SILENCE
  float targetReveal = 0; // 0 means the front color layer is invisible
  float targetSize = 250;

  // If you speak louder than the threshold
  if (volume > soundThreshold) {
    targetReveal = 255; // Color monster becomes 100% visible
    targetSize = map(volume, soundThreshold, 0.4, 300, 600);
  }

  // Smooth transition (lerp)
  currentReveal = lerp(currentReveal, targetReveal, 0.05); 
  currentSize = lerp(currentSize, targetSize, 0.1); 

  // ==========================================
  // LAYER 1: BLACK SILHOUETTE (Drawn BEHIND the rain)
  // ==========================================
  tint(0, 255); // Completely black color
  imageMode(CENTER);
  if (monsterImg != null) {
    image(monsterImg, width / 2, height / 2, currentSize, currentSize);
  }

  // ==========================================
  // LAYER 2: RAIN (Falls on top of the silhouette)
  // ==========================================
  for (int i = 0; i < drops.length; i++) {
    drops[i].update();
    drops[i].render();
  }

  // ==========================================
  // LAYER 3: COLOR MONSTER (Steps OUT of the rain to the front)
  // ==========================================
  if (currentReveal > 2) {
    tint(255, currentReveal); 
    if (monsterImg != null) {
      image(monsterImg, width / 2, height / 2, currentSize, currentSize);
    }
  }
  
  // Reset color filters so they don't affect the border
  noTint(); 

  // Draw frame on top of everything
  drawBorder();
}

void drawBorder() {
  fill(30);
  noStroke();
  rect(0, 0, width, 20);            
  rect(0, height - 20, width, 20);  
  rect(0, 0, 20, height);           
  rect(width - 20, 0, 20, height);  
}

class RainDrop {
  float x, y, speed, len;

  RainDrop() {
    x = random(width);
    y = random(-500, height);
    speed = random(8, 15);
    len = random(10, 30);
  }

  void update() {
    y += speed; 
    if (y > height) {
      y = random(-100, -20);
      x = random(width);
    }
  }

  void render() {
    // Rain color (makes it slightly brighter during lightning)
    stroke(150 + lightningFlash/2, 200 + lightningFlash/2, 255, 100); 
    strokeWeight(2);
    line(x, y, x, y + len);
  }
}

void stop() {
  // Clear audio routes on exit
  liveIn.unpatch(crushEffect);
  crushEffect.unpatch(delayEffect);
  delayEffect.unpatch(out);
  in.close();
  out.close();
  minim.stop();
  super.stop();
}
