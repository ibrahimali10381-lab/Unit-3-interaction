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


//variables ============================================================
boolean toolBarOn = false;
color selected = #000000;
float strokeStrength = 1.0;
float sliderX = 250.0;
int start = 0;
boolean stop = false;
//setup ================================================================
void setup() {
  size(1000, 1000);
  background(255);
}


//Draw function ==============================================================
void draw() {
  tool_Bar_Open(470, 0, 75, 50);

}



//Mouse drawing ================================================================
void mouseDragged() {
  stroke(selected);
  strokeWeight(strokeStrength);
  line(pmouseX, pmouseY, mouseX, mouseY);
  if (toolBarOn == true) {
    SliderX();
  }
}



//Mouse clicking ====================================================================
void mouseReleased() {
  if (toolBarOn == false) {
    check_toolBar(470, 0, 75, 50);
    check_toolBar(470, 900, 75, 50);
  } else {
    checkCircle(50, 25, 30, red);
    checkCircle(100, 25, 30, blue);
    checkCircle(150, 25, 30, green);
    checkCircle(50, 70, 30, purple);
    checkCircle(100, 70, 30, cyan);
    checkCircle(150, 70, 30, yellow);
    checkCircle(200, 70, 30, black);
    checkCircle(200, 25, 30, white);
    SliderX();
  }
}



//Toolbar ===============================================================================================
void check_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z && toolBarOn == false) {
    toolBarOn = true;
    start = y;
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
    stroke(0);
    strokeWeight(1);
    fill(toolbar);
    rect(0, start +0, 1000, start +100);

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
    line(400, 50+start, 401, 50+start);

    stroke(selected);
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
  tactileCircle(x, start+y, r);
  fill(chosen);
  circle(x, start+y, r*2);
}

//Rectangle Buttons ==========================================================================================

void rectButton(int x, int y, int w, int z, color chosen) {
  tactileRect(x, start+y, w, z);
  fill(chosen);
  rect(x, start+y, w, z);
}

void tactileRect(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y+start && mouseY < y+z+start) {
    stroke(0);
  } else {
    stroke(255);
  }
}

//Slider ================================================================================================

void SliderX() {
  if (mouseX>250 && mouseX<350 && mouseY <80+start && mouseY >30+start) {
    sliderX = mouseX;
  }
  strokeStrength = map(sliderX, 250, 350, 1, 20);
}

void drawnSliderX(int x, int y, int w) {
  line(x, y+start, x+w, y+start);
  fill(255);
  circle(sliderX, y+start, 30);
}
