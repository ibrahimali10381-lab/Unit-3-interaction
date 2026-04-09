//pallette ==============================================
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
PImage shocked;
PImage save;

//variables ============================================================
boolean toolBarOn = false;
color selected = #000000;
float strokeStrength = 1.0;
float sizeX = 50.0;
float sizeY = 50.0;
float sliderX = 250.0;
int start = 0;
boolean stop = false;
boolean shockedOn = false;

//setup ================================================================
void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  background(255);
  shocked = loadImage("meme.png");
  save = loadImage("R.png");
  
}


//Draw function ==============================================================
void draw() {
  tool_Bar_Open(470, 0, 75, 50);
  if (stop == true) {
    background(255);
    stop = false;
  }
}



//Mouse drawing ================================================================
void mouseDragged() {
  //line drawing
  if (shockedOn == false) {
    stroke(selected);
    strokeWeight(strokeStrength);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  //Stamp draw
  else {
    image(shocked, mouseX, mouseY, sizeX, sizeY);
  }
  if (toolBarOn == true) {
    SliderX(55);
  }
}



//Mouse clicking ====================================================================
void mouseReleased() {
  pushMatrix();
  translate(0, start);
  //Toolbar toggle
  if (toolBarOn == false) {
    check_toolBar(470, 0, 75, 50);
    check_toolBar(470, 900, 75, 50);
  } else {

    //color buttons
    checkCircle(50, 25, 30, red);
    checkCircle(100, 25, 30, blue);
    checkCircle(150, 25, 30, green);
    checkCircle(50, 70, 30, purple);
    checkCircle(100, 70, 30, cyan);
    checkCircle(150, 70, 30, yellow);
    checkCircle(200, 70, 30, black);
    checkCircle(200, 25, 30, white);


    //Slider and Stamp
    SliderX(55);
    sackBoy(450, 20, 65, 60);


    //New, load, save
    if (mouseX> 700 && mouseX<750 && mouseY > 0+start && mouseY <75+start) {
      background(white);
    }
    if (mouseX> 800 && mouseX<850 && mouseY > 0+start && mouseY <75+start) {
      selectInput("Choose a file to load", "openImage");
    }
    if (mouseX> 900 && mouseX<950 && mouseY > 0+start && mouseY <75+start) {
      selectOutput("Choose a name for the file", "saveImage");
    }
  }
  popMatrix();
}



//Toolbar ===============================================================================================
void check_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z && toolBarOn == false) {
    toolBarOn = true;
    start = y;
    stop = true;
  }
}


void tactile_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z && toolBarOn == false) {
    fill(grey);
    rect(x, y, w, z);
  } else if (toolBarOn ==false) {
    stroke(255);
    fill(grey);
    rect(x, y, w, z);
    stroke(0);
  }
}


void tool_Bar_Open(int x, int y, int w, int z) {
  tactile_toolBar(x, y, w, z);
  tactile_toolBar(x, y+900, w, z);

  if (toolBarOn ==true) {
    //Toolbar setup
    pushMatrix();
    translate(0, start);
    stroke(0);
    strokeWeight(1);
    fill(toolbar);
    rect(0, 0, 999, 100);

    //Color buttons
    circleButton(50, 25, 15, red);
    circleButton(100, 25, 15, blue);
    circleButton(150, 25, 15, green);
    circleButton(200, 25, 15, white);
    circleButton(50, 70, 15, purple);
    circleButton(100, 70, 15, cyan);
    circleButton(150, 70, 15, yellow);
    circleButton(200, 70, 15, black);

    //Slider
    drawnSliderX(250, 50, 100);


    //Indicator
    stroke(selected);
    strokeWeight(strokeStrength+5);
    line(400, 50, 401, 50);

    //Stamper
    stroke(0);
    strokeWeight(1);
    rectButton(450, 20, 65, 60, yellow, 1);
    image(shocked, 455, 20, 60, 60);

    //New, Load, Save
    rect(700, 25, 50, 50);


    rect(800, 25, 50, 50);



    rectButton(900, 25, 50, 50, yellow, 4);
    image(save, 900, 25, 50, 50);


    stroke(selected);
    popMatrix();
  }
}



//Color buttons =======================================================================================

void tactileCircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(255);
  } else {
    stroke(0);
  }
}



void checkCircle(int x, int y, int r, color chosen) {
  if (dist(x, y+start, mouseX, mouseY) < r) {
    selected = chosen;
  }
}

void circleButton(int x, int y, int r, color chosen) {
  tactileCircle(x, y+start, r);
  fill(chosen);
  circle(x, y, r*2);
  stroke(0);
}

//Rectangle Buttons ==========================================================================================

void rectButton(int x, int y, int w, int z, color chosen, int num) {
  tactileRect(x, y, w, z, chosen, num);
  rect(x, y, w, z);
  fill(white);
}

void tactileRect(int x, int y, int w, int z, color chosen, int num) {
  if (mouseX > x && mouseX< x+w && mouseY >start+y && mouseY < start+y+z) {
    fill(chosen);
  } else if (shockedOn == true && num == 1) {
    fill(red);
  } else {
    fill(255);
  }
}

//Slider ================================================================================================

void SliderX(int y) {
  if (mouseX>250 && mouseX<350 && mouseY <y+25+start && mouseY >y-25+start) {
    sliderX = mouseX;
  }
  strokeStrength = map(sliderX, 250, 350, 1, 40);
  sizeX = map(sliderX, 250, 350, 20, 200);
  sizeY = map(sliderX, 250, 350, 20, 200);
}

void drawnSliderX(int x, int y, int w) {
  line(x, y, x+w, y);
  fill(255);
  circle(sliderX, y, 30);
}


//Stamp tool =====================================================================================

void sackBoy(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >start+y && mouseY < start+y+z) {
    shockedOn = !shockedOn;
  }
}

//Save button ======================================================================================

void saveImage(File f) {
  if (f != null && start == 0) {
    PImage canvas = get( 0, 101, width-0, height-101);
    canvas.save(f.getAbsolutePath());
  } else if (f != null && start == 900) {
    PImage canvas = get( 0, 0, width-0, height-101);
    canvas.save(f.getAbsolutePath());
  }
}


//Load button ========================================================================================


void openImage(File f) {
  if (f != null && start == 0) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 500, 500);
      n += 1;
    }
  } else if (f != null && start == 900) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 500, 500);
      n += 1;
    }
  }
}
