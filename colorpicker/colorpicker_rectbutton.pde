
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
  
  
 
  on(112, 195, toggle,1);
  on(412, 195, toggle,4);
  on(712, 195, toggle,7);
  on(112, 495, toggle,2);
  on(412, 495, toggle,5);
  on(712, 495, toggle,8);
  on(112, 795, toggle,3);
  on(412, 795, toggle,6);
  on(712, 795, toggle,9);

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


void on(int x, int y,int toggle, int num) {
  if (toggle == num) {
    textSize(75);
    fill(0);
    text("on",x,y);
  }
}

void mouseReleased() {

  //red buttons
  check(100, 150, 100, 50, lightred,1);
  check(100, 450, 100, 50, medred,2);
  check(100, 750, 100, 50, darkred,3);


  //green buttons
  check(400, 150, 100, 50, lightgreen,4);
  check(400, 450, 100, 50, medgreen,5);
  check(400, 750, 100, 50, darkgreen,6);

  //blue buttons
  check(700, 150, 100, 50, lightblue,7);
  check(700, 450, 100, 50, medblue,8);
  check(700, 750, 100, 50, darkblue,9);
}
