
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
int toggle;


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
  button(100, 150, 100, 50, lightred,1);
  button(100, 450, 100, 50, medred,2);
  button(100, 750, 100, 50, darkred,3);

  //green buttons

  button(400, 150, 100, 50, lightgreen,4);
  button(400, 450, 100, 50, medgreen,5);
  button(400, 750, 100, 50, darkgreen,6);

  //blue buttons
  button(700, 150, 100, 50, lightblue,7);
  button(700, 450, 100, 50, medblue,8);
  button(700, 750, 100, 50, darkblue,9);




}

void button(int x, int y, int w, int z, color select, int num) {
  tactile(x, y, w, z);
  fill(select);
  rect(x, y, w, z);
  on(x+12,y+45,toggle, num);
}

void tactile(int x, int y, int w, int z) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z) {
    stroke(white);
  } else {
    stroke(outline);
  }
}

void check(int x, int y, int w, int z, color chosen, int num) {
  if (mouseX > x && mouseX< x+w && mouseY >y && mouseY < y+z) {
    selected = chosen;
    toggle = num;
  }
}


void on(int x, int y, int toggle, int num) {
  if (toggle == num) {
    textSize(75);
    fill(0);
    text("on", x, y);
  }
}

void mouseReleased() {

  //red buttons
  check(100, 150, 100, 50, lightred, 1);
  check(100, 450, 100, 50, medred, 2);
  check(100, 750, 100, 50, darkred, 3);


  //green buttons
  check(400, 150, 100, 50, lightgreen, 4);
  check(400, 450, 100, 50, medgreen, 5);
  check(400, 750, 100, 50, darkgreen, 6);

  //blue buttons
  check(700, 150, 100, 50, lightblue, 7);
  check(700, 450, 100, 50, medblue, 8);
  check(700, 750, 100, 50, darkblue, 9);
}
