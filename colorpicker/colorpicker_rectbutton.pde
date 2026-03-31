
//pallettee
color lightred = #F72585;
color medred = #b5179e;
color darkred = #7209b7;
color lightgreen = #3adca3;
color medgreen = #3abca3;
color darkgreen = #419b9a;
color darkblue = #3f37c9;
color medblue = #4361ee;
color lightblue = #4895ef;
color outline = #001d3d;
color white = #FFFFFF;



//changing variables
color selected = #FFFFFF;

//setup
void setup() {
  size (900, 900);
  stroke(outline);
  strokeWeight(5);
}




//draw
void draw() {
  background(selected);

  //red buttons
  tactile(100, 150, 100, 50);
  fill(lightred);
  rect(100, 150, 100, 50);


  tactile(100, 450, 100, 50);
  fill(medred);
  rect(100, 450, 100, 50);

  tactile(100, 750, 100, 50);
  fill(darkred);
  rect(100, 750, 100, 50);

  //green buttons

  tactile(400, 150, 100, 50);
  fill(lightgreen);
  rect(400, 150, 100, 50);

  tactile(400, 450, 100, 50);
  fill(medgreen);
  rect(400, 450, 100, 50);

  tactile(400, 750, 100, 50);
  fill(darkgreen);
  rect(400, 750, 100, 50);

  //blue buttons

  tactile(700, 150, 100, 50);
  fill(lightblue);
  rect(700, 150, 100, 50);

  tactile(700, 450, 100, 50);
  fill(medblue);
  rect(700, 450, 100, 50);

  tactile(700, 750, 100, 50);
  fill(darkblue);
  rect(700, 750, 100, 50);
}

void tactile(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z) {
    stroke(white);
  } else {
    stroke(outline);
  }
}

void check(int x, int y, int w, int z, color chosen) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z) {
    selected = chosen;
  }
}

boolean toggle1(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z) {
    return true;
  }
  return false;
}

void on(int x, int y,boolean button) {
  if (button == true) {
    text("on", x, y, 100);
  }
}

void mouseReleased() {

  //red buttons
  check(100, 150, 100, 50, lightred);
  on(100, 150, toggle1(100, 150, 100, 50));

  check(100, 450, 100, 50, medred);
  toggle1(100, 450, 100, 50);
  on(100, 450,toggle1(100, 150, 100, 50));

  check(100, 750, 100, 50, darkred);
  toggle1(100, 750, 100, 50);
  on(100, 750,toggle1(100, 150, 100, 50));


  //green buttons
  check(400, 150, 100, 50, lightgreen);
  check(400, 450, 100, 50, medgreen);
  check(400, 750, 100, 50, darkgreen);

  //blue buttons
  check(700, 150, 100, 50, lightblue);
  check(700, 450, 100, 50, medblue);
  check(700, 750, 100, 50, darkblue);
}
