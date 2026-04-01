color green = #588157;

float sliderX = 300;
float sliderY = 300;
float shade = map(sliderX, 200, 800, 0, 255);
float size = map(sliderY, 150, 750, 25, 75);


void setup() {
  size(900, 900);
  strokeWeight(5);
  stroke(green);
  fill(green);
  sliderX = 500;
  sliderY= 450;
}

void draw() {
  background(shade, 50-shade/10, 131-shade/10);
  line(200, 450, 800, 450);
  line(100, 150, 100, 750);
  circle(100, sliderY, 50);
  circle(sliderX, 450, size);
}

void mouseDragged() {
  SliderX();
  SliderY();
}

void mouseReleased() {
  SliderX();
  SliderY();
}

void SliderX() {
  if (mouseX>200 && mouseX<800 && mouseY <475 && mouseY >425) {
    sliderX = mouseX;
  }
  shade = map(sliderX, 200, 800, 0, 255);
}

void SliderY() {
  if (mouseY>150 && mouseY<750 && mouseX >75 && mouseX <125) {
    sliderY = mouseY;
  }
  size = map(sliderY, 150, 750, 25, 75);
}
