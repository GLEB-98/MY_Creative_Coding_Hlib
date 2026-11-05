int[] score = {250, 410, 658, 325, 412, 523, 587, 236, 547};

void setup() {
 
  score = BubbleSort(score);
  
 
  for (int i = 0; i < score.length; i++) {
    println(score[i]);
  }
}
