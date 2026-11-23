# BIFEaphobia

## About this project
This is my interactive Halloween project made in Processing (Java). It is a spooky experience that uses a microphone to catch your voice and changes it in real time. 

When it is quiet, you just see a dark silhouette and falling rain. But if you talk into the mic, your voice gets distorted like a monster, lightning flashes, and the monster steps out of the dark!
The project consists of two interconnected stages: in the first part, i tested individual core mechanics (conditionals, loops, classes, and sound), while in the second, i combined them into a single interactive scene.

## Part One: Core Concepts
* **Lamp (If statements):** I used `if` statements to check mouse position and change color, size, position.
* **Bubble (Arrays & Loops):** I used an array and a `for` loop (Bubble Sort) to compare and sort numbers.
* **Bubbles (Classes & Constructor):** A class is a template. The constructor runs once when I click the mouse to set coordinates and random size, and a method moves the bubble up.
* **Sound (Images & Minim):** I loaded an image with `PImage` and used `Minim` to read the microphone volume.

## Part Two: Final Scene
I made sure to use all the required tools for this assignment:
* **Variables & IF statements:** To check the microphone volume and trigger lightning.
* **Arrays & Loops:** I used a `RainDrop[]` array and `for` loops to draw 150 rain drops.
* **Classes (OOP):** Created a `RainDrop` class for the rain physics (speed, position, reset).
* **Images (`PImage`):** Used `tint()` to make the monster completely black in the shadows, and colorful when you speak.
* **Math:** Used `random()` for the lightning strikes and `lerp()` for smooth size changes.
* **Minim Audio Library:** Used `LiveInput`, `BitCrush`, and `Delay` to distort the live voice.
* **Constructor in RainDrop:** The RainDrop constructor runs when the program starts and sets the initial coordinates (X, Y) and speed for all 150 raindrops.
* **Frame & No Hardcoding:** The border around the edges of the screen is drawn relative to the `width` and `height` values, and the main settings (such as speed and volume threshold) are defined as variables rather than hardcoded numbers.
* **How code interacts:** Minim reads audio from the microphone, an `if` statement checks the volume threshold, the `tint()` and `lerp()` functions gradually reveal and enlarge the monster, and a `for` loop moves raindrops across the image.

## How to run it
1. Install Processing.
2. Go to **Sketch -> Import Library -> Add Library...** and install the **Minim** library.
3. Open the sketch file. Make sure `monster.png` is inside the `data` folder.

## IMPORTANT WARNING!
**You MUST wear headphones before pressing Play!** 
If you use speakers, the microphone will catch the sound from the speakers and create a terrible, loud feedback loop. 

Just put on your headphones, press play, watch the screen, and say something into the mic!
