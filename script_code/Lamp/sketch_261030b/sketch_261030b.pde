// Параметры позиции и размера лампы
int bulbCenterX = 250;
int bulbCenterY = 250;
int bulbSize = 100;

// Переменные для поэтапного масштабирования ореола света (Scale change)
float innerGlow = 100; // Внутренний ореол (стартует от размера колбы)
float outerGlow = 100; // Внешний широкий ореол

void setup() {
  size(500, 500);
}

void draw() {
  background(40);

  // 1. Провод лампы
  stroke(0);
  strokeWeight(2);
  line(bulbCenterX, bulbCenterY - 75, bulbCenterX, 0);

  // 2. Цоколь лампы
  noStroke();
  fill(100);
  ellipse(bulbCenterX, bulbCenterY - 75, 50, 30);
  rect(bulbCenterX - 20, bulbCenterY - 75, 40, 30);

  // 3. Проверка столкновения курсора мыши с лампой (Collision detection)
  boolean isHovered = (mouseX > bulbCenterX - bulbSize * 0.5
                    && mouseX < bulbCenterX + bulbSize * 0.5
                    && mouseY > bulbCenterY - bulbSize * 0.5
                    && mouseY < bulbCenterY + bulbSize * 0.5);

  if (isHovered) {
    // 1-я реакция: Смещение позиции (Position change) — лампа подтягивается вверх
    if (bulbCenterY > 230) {
      bulbCenterY--;
    }

    // 2-я реакция: Поэтапное масштабирование света (Scale change)
    // Этап А: Сначала разгорается внутренний ореол
    if (innerGlow < 170) {
      innerGlow += 3;
    }
    // Этап Б: Внешний ореол подключается, когда внутренний уже разгорелся выше 130
    if (innerGlow > 130 && outerGlow < 250) {
      outerGlow += 4;
    }
  } else {
    // Возврат лампы на исходную высоту
    if (bulbCenterY < 250) {
      bulbCenterY++;
    }

    // Затухание света в обратном порядке:
    // Сначала быстро исчезает внешняя волна
    if (outerGlow > 100) {
      outerGlow -= 4;
    }
    // Затем гаснет внутренний свет
    if (outerGlow < 150 && innerGlow > 100) {
      innerGlow -= 8;
    }
  }

  // 4. Отрисовка слоев рассеянного света (от дальнего широкого к внутреннему)
  if (outerGlow > 105) {
    fill(255, 255, 180, 25); // Мягкий полупрозрачный внешний ореол
    ellipse(bulbCenterX, bulbCenterY, outerGlow, outerGlow);
  }

  if (innerGlow > 105) {
    fill(255, 255, 120, 50); // Более плотный внутренний свет
    ellipse(bulbCenterX, bulbCenterY, innerGlow, innerGlow);
  }

  // 5. Отрисовка колбы лампы: 3-я реакция — смена цвета (Colour change)
  if (isHovered) {
    fill(255, 245, 140); // Ярко-желтый цвет включенной лампы
  } else {
    fill(120);            // Серый цвет выключенной лампы
  }
  ellipse(bulbCenterX, bulbCenterY, bulbSize, bulbSize);
}
