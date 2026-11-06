import ddf.minim.*;

Minim minim;
AudioInput in;

String lastState = ""; 

void setup() {
  size(400, 400); 
  
  minim = new Minim(this);
  in = minim.getLineIn(); //Turning on the microphone
}

void draw() {
  background(30); //
  
  float vol = in.mix.level();
  String currentState = "";
  
  // Checking the volume level
  if (vol < 0.02) {
    currentState = "Silence...";
  } else if (vol < 0.15) {
    currentState = "bad (Volume: " + vol + ")";
  } else {
    currentState = "good (Volume: " + vol + ")";
  }
  
  // information
  if (!currentState.equals(lastState)) {
    println(currentState);
    lastState = currentState; 
  }
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
