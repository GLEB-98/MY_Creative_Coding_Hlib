// Функция сортировки пузырьком, которая возвращает целый массив
int[] BubbleSort(int[] array) {
  int temp = 0; 
  
  for (int i = 0; i < array.length; i++) {
    // Внутренний цикл ОБЯЗАТЕЛЬНО должен идти до array.length - 1
    for (int j = 0; j < array.length - 1; j++) { 
      
      // Сравниваем элементы строго с помощью индекса j
      if (array[j] > array[j + 1]) {
        // Меняем соседние элементы местами
        temp = array[j + 1];
        array[j + 1] = array[j];
        array[j] = temp;
      }
      
    }
  }
  
  return array; // Возвращаем результат
}
