//pallette
color toolbar = #616B86;
color grey = #96979B;



//variables
boolean toolBarOn = false;
color selected = #000000;



//setup
void setup() {
  size(1000, 1000);
  background(255);
}


//Draw function
void draw() {
  tool_Bar_Open(470, 0, 75, 50);
}



//Mouse drawing
void mouseDragged() {
  stroke(selected);
  line(pmouseX, pmouseY, mouseX, mouseY);
}



//Mouse clicking
void mouseReleased() {
  if (toolBarOn == false) {
    check_toolBar(470, 0, 75, 50);
  }
  else{
    checkCircle();
  }
}



//Toolbar ===============================================================================================
void check_toolBar(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z && toolBarOn == false) {
    toolBarOn = true;
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
  if (toolBarOn ==true) {
    fill(toolbar);
    rect(0, 0, 1000, 100);
  }
}



//Color buttons =======================================================================================

void tactile(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(255);
  } else {
    stroke(0);
  }
}

void checkCircle(int x, int y, int r, color chosen) {
  if (dist(x, y, mouseX, mouseY) < r) {
    selected = chosen;
  }
}

void circleButton(int x,int y,int r, color chosen){
  tactile(x,y,r);
  fill(chosen);
  circle(x,y,r*2);
}
