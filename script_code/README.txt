# BIFEaphobia

## About this project
This is my interactive Halloween project made in Processing (Java). It is a spooky experience that uses a microphone to catch your voice and changes it in real time. 

When it is quiet, you just see a dark silhouette and falling rain. But if you talk into the mic, your voice gets distorted like a monster, lightning flashes, and the monster steps out of the dark!

## Technical requirements included
I made sure to use all the required tools for this assignment:
* **Variables & IF statements:** To check the microphone volume and trigger lightning.
* **Arrays & Loops:** I used a `RainDrop[]` array and `for` loops to draw 150 rain drops.
* **Classes (OOP):** Created a `RainDrop` class for the rain physics (speed, position, reset).
* **Images (`PImage`):** Used `tint()` to make the monster completely black in the shadows, and colorful when you speak.
* **Math:** Used `random()` for the lightning strikes and `lerp()` for smooth size changes.
* **Minim Audio Library:** Used `LiveInput`, `BitCrush`, and `Delay` to distort the live voice.

## How to run it
1. Install Processing.
2. Go to **Sketch -> Import Library -> Add Library...** and install the **Minim** library.
3. Open the sketch file. Make sure `monster.png` is inside the `data` folder.

## IMPORTANT WARNING!
**You MUST wear headphones before pressing Play!** 
If you use speakers, the microphone will catch the sound from the speakers and create a terrible, loud feedback loop. 

Just put on your headphones, press play, watch the screen, and say something into the mic!