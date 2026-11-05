int[] score = {250, 410, 658, 325, 412, 523, 587, 236, 547};

void setup() {
  // Вызываем функцию сортировки и перезаписываем массив
  score = BubbleSort(score);
  
  // Выводим отсортированный массив в консоль
  for (int i = 0; i < score.length; i++) {
    println(score[i]);
  }
}
