void setup()
{
  size(500, 500);
}
int bulbCenterX = 250, bulbSize = 100, bulbCenterY = 250;
void draw()
{
  background(75);

  fill(125);
  strokeWeight(1);
  stroke(0);
  line(250, bulbCenterY-75, 250, 0);

  noStroke();

  ellipse(bulbCenterX, bulbCenterY-75, 50, 50);
  rect(bulbCenterX-25, bulbCenterY-75, 50, 50);

  if (mouseX  > bulbCenterX-bulbSize * 0.5
    && mouseX < bulbCenterX+bulbSize * 0.5

    && mouseY  > bulbCenterY-bulbSize * 0.5

    && mouseY < bulbCenterY+bulbSize * 0.5)
  {
    fill(250, 250, 0);
    bulbCenterY --;
    bulbSize = 120;
  } else {
    fill(125);
    bulbSize = 100;
    if (bulbCenterY < 250)
    {
      bulbCenterY++;
    }
  }
  ellipse(bulbCenterX, bulbCenterY, bulbSize, bulbSize);
  /*
 noFill();
   strokeWeight(3);
   stroke(0,255,0);
   rect(bulbCenterX-bulbSize * 0.5 ,bulbCenterY-bulbSize * 0.5,bulbSize,bulbSize);
   stroke(0);
   */
}
