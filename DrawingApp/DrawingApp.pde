//palette ==============================================
color toolbar = #616B86;
color grey = #96979B;
color red = #FF0000;
color blue = #0000FF;
color green = #00FF00;
color purple = #FF00FF;
color cyan = #00FFFF;
color yellow = #FFFF00;
color white = #FFFFFF;
color black = #000000;

PImage shocked, pepe, save, clear, load, icon;

//variables ============================================================
boolean toolBarOn = false;
boolean canvasExpanded = false;
color selected = #000000;
float strokeStrength = 1.0;
float sizeX = 50.0;
float sizeY = 50.0;
float sliderX = 250.0;
int start = 0;
boolean stop = false;
boolean shockedOn = false;
boolean pepeOn = false;

//setup ================================================================
void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  background(255);

  shocked = loadImage("meme.png");
  pepe = loadImage("pepe.png");
  save = loadImage("R.png");
  clear = loadImage("trahs.png");
  load = loadImage("load.png");
  icon = loadImage("logo.png");

  surface.setTitle("Drawing App");
  if (icon != null) surface.setIcon(icon);
}

//Draw function ==============================================================
void draw() {
  tool_Bar_Open(width/2 - 37, 0, 75, 50);

  if (stop == true) {
    background(255);
    stop = false;
  }
}

//Mouse drawing ================================================================
void mouseDragged() {
  if (start == 0 && mouseY > 100) {
    drawLogic();
  } else if (start == 900 && mouseY < 900) {
    drawLogic();
  }

  if (toolBarOn == true) {
    SliderX(55);
  }
}

void drawLogic() {
  if (!shockedOn && !pepeOn) {
    stroke(selected);
    strokeWeight(strokeStrength);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else if (shockedOn) {
    image(shocked, mouseX, mouseY, sizeX, sizeY);
  } else if (pepeOn) {
    image(pepe, mouseX, mouseY, sizeX, sizeY);
  }
}

//Mouse clicking ====================================================================
void mouseReleased() {
  int centerX = width/2 - 37;

  if (!toolBarOn) {
    check_toolBar(centerX, 0, 75, 50);
    check_toolBar(centerX, 900, 75, 50);
    check_canvas(0, 475, 50, 75);
    check_canvas(width - 50, 475, 50, 75);
  } else {
    pushMatrix();
    // This moves the "0" coordinate of the buttons to stay centered in the bar
    translate(width/2 - 500, start);

    checkCircle(50, 25, 30, red);
    checkCircle(100, 25, 30, blue);
    checkCircle(150, 25, 30, green);
    checkCircle(50, 70, 30, purple);
    checkCircle(100, 70, 30, cyan);
    checkCircle(150, 70, 30, yellow);
    checkCircle(200, 70, 30, black);
    checkCircle(200, 25, 30, white);

    SliderX(55);
    sackBoy(450, 20, 65, 60);
    pepe(550, 20, 65, 60);

    // Dynamic hit detection for New, Load, Save
    float adj = width/2 - 500;
    if (mouseX > 700+adj && mouseX < 750+adj && mouseY > start && mouseY < 75+start) background(255);
    if (mouseX > 800+adj && mouseX < 850+adj && mouseY > start && mouseY < 75+start) selectInput("Load", "openImage");
    if (mouseX > 900+adj && mouseX < 950+adj && mouseY > start && mouseY < 75+start) selectOutput("Save", "saveImage");

    popMatrix();

    if ((start == 0 && mouseY > 100) || (start == 900 && mouseY < 900)) {
      drawLogic();
    }
  }
}

//Toolbar Logic ===============================================================================================
void check_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + z && !toolBarOn) {
    toolBarOn = true;
    start = y;
    stop = true;
  }
}

void tactile_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + z && !toolBarOn) {
    fill(grey);
    rect(x, y, w, z);
  } else if (!toolBarOn) {
    stroke(255);
    fill(grey);
    rect(x, y, w, z);

    // Only show side buttons if we haven't expanded yet
    if (!canvasExpanded) {
      canvasButton(0);
      canvasButton(width - 50);
    }
  }

  if (!toolBarOn) {
    fill(255);
    triangle(width/2 - 20, 10, width/2, 40, width/2 + 20, 10);
    triangle(width/2 - 20, 940, width/2, 910, width/2 + 20, 940);
  }
}

void tool_Bar_Open(int x, int y, int w, int z) {
  tactile_toolBar(x, y, w, z);
  tactile_toolBar(x, y + 900, w, z);

  if (toolBarOn) {
    pushMatrix();
    translate(width/2 - 500, start);

    stroke(0);
    strokeWeight(1);
    fill(toolbar);
    rect(-width, 0, width * 3, 100); // Bar spans across entire width

    circleButton(50, 25, 15, red);
    circleButton(100, 25, 15, blue);
    circleButton(150, 25, 15, green);
    circleButton(200, 25, 15, white);
    circleButton(50, 70, 15, purple);
    circleButton(100, 70, 15, cyan);
    circleButton(150, 70, 15, yellow);
    circleButton(200, 70, 15, black);

    drawnSliderX(250, 50, 100);

    stroke(selected);
    strokeWeight(strokeStrength + 5);
    line(400, 50, 401, 50);

    stroke(0);
    strokeWeight(1);
    rectButton(450, 20, 65, 60, yellow, 1);
    if (shocked != null) image(shocked, 485, 50, 60, 60);

    rectButton(550, 20, 65, 60, yellow, 5);
    if (pepe != null) image(pepe, 585, 52, 60, 60);

    rectButton(700, 25, 50, 50, yellow, 2);
    if (clear != null) image(clear, 725, 50, 50, 40);

    rectButton(800, 25, 50, 50, yellow, 3);
    if (load != null) image(load, 825, 50, 50, 40);

    rectButton(900, 25, 50, 50, yellow, 4);
    if (save != null) image(save, 925, 50, 50, 50);

    popMatrix();
  }
}

// Helpers =======================================================================================

void checkCircle(int x, int y, int r, color chosen) {
  float adjX = x + (width/2 - 500);
  if (dist(adjX, y + start, mouseX, mouseY) < r) {
    selected = chosen;
    pepeOn = false;
    shockedOn = false;
  }
}

void circleButton(int x, int y, int r, color chosen) {
  float adjX = x + (width/2 - 500);
  if (dist(adjX, y + start, mouseX, mouseY) < r) stroke(255);
  else stroke(0);
  fill(chosen);
  circle(x, y, r * 2);
}

void rectButton(int x, int y, int w, int z, color chosen, int num) {
  float adjX = x + (width/2 - 500);
  if (mouseX > adjX && mouseX < adjX + w && mouseY > start + y && mouseY < start + y + z) {
    fill(chosen);
  } else if ((shockedOn && num == 1) || (pepeOn && num == 5)) {
    fill(red);
  } else {
    fill(255);
  }
  rect(x, y, w, z);
}

void SliderX(int y) {
  float barStart = 250 + (width/2 - 500);
  if (mouseX > barStart && mouseX < barStart + 100 && mouseY < y + 25 + start && mouseY > y - 25 + start) {
    sliderX = mouseX - (width/2 - 500);
  }
  sliderX = constrain(sliderX, 250, 350);
  strokeStrength = map(sliderX, 250, 350, 1, 40);
  sizeX = map(sliderX, 250, 350, 20, 200);
  sizeY = map(sliderX, 250, 350, 20, 200);
}

void drawnSliderX(int x, int y, int w) {
  line(x, y, x + w, y);
  fill(255);
  circle(sliderX, y, 30);
}

void sackBoy(int x, int y, int w, int z) {
  float adjX = x + (width/2 - 500);
  if (mouseX > adjX && mouseX < adjX + w && mouseY > start + y && mouseY < start + y + z) {
    shockedOn = !shockedOn;
    pepeOn = false;
  }
}

void pepe(int x, int y, int w, int z) {
  float adjX = x + (width/2 - 500);
  if (mouseX > adjX && mouseX < adjX + w && mouseY > start + y && mouseY < start + y + z) {
    pepeOn = !pepeOn;
    shockedOn = false;
  }
}

// IO & Canvas ======================================================================================

void saveImage(File f) {
  if (f != null) {
    PImage canvas = (start == 0) ? get(0, 101, width, height - 101) : get(0, 0, width, height - 101);
    canvas.save(f.getAbsolutePath());
  }
}



void openImage(File f) {
  if (f != null && start == 0) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, width/2, 550);
      n += 1;
    }
  } else if (f != null && start == 900) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, width/2, -450);
      n += 1;
    }
  }
}

void canvasButton(int x) {
  fill(grey);
  rect(x, 475, 50, 75);
}

void check_canvas(int x, int y, int w, int z) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + z && !toolBarOn && !canvasExpanded) {
    if (x >= width - 50) {
      windowResize(width + 500, height);
      canvasExpanded = true;
    } else if (x == 0) {
      canvasLeft(500);
      canvasExpanded = true;
    }
  }
}

void canvasLeft(int x) {
  PImage currentCanvas = get();
  windowResize(width + x, height);
  background(255);
  imageMode(CORNER);
  image(currentCanvas, x, 0);
  imageMode(CENTER);
}
