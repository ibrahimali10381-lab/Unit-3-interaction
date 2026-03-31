
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
  tactile(150,150,50);
  fill(lightred);
  circle(150, 150, 100);


  tactile(150,450,50);
  fill(medred);
  circle(150, 450, 100);

  tactile(150,750,50);
  fill(darkred);
  circle(150, 750, 100);

  //green buttons

  tactile(450,150,50);
  fill(lightgreen);
  circle(450, 150, 100);

  tactile(450,450,50);
  fill(medgreen);
  circle(450, 450, 100);

  tactile(450, 750,50);
  fill(darkgreen);
  circle(450, 750, 100);

  //blue buttons
  
  tactile(750,150,50);
  fill(lightblue);
  circle(750, 150, 100);

  tactile(750,450,50);
  fill(medblue);
  circle(750, 450, 100);

  tactile(750,750,50);
  fill(darkblue);
  circle(750, 750, 100);
}

void tactile(int x, int y , int r){
    if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(outline);
  }
}


void mouseReleased() {

  //red buttons
  if (dist(150, 150, mouseX, mouseY) < 50) {
    selected = lightred;
  }
  if (dist(150, 450, mouseX, mouseY) < 50) {
    selected = medred;
  }
  if (dist(150, 750, mouseX, mouseY) < 50) {
    selected = darkred;
  }

  //green buttons
  if (dist(450, 150, mouseX, mouseY) < 50) {
    selected = lightgreen;
  }
  if (dist(450, 450, mouseX, mouseY) < 50) {
    selected = medgreen;
  }
  if (dist(450, 750, mouseX, mouseY) < 50) {
    selected = darkgreen;
  }

  //blue buttons
  if (dist(750, 150, mouseX, mouseY) < 50) {
    selected = lightblue;
  }
  if (dist(750, 450, mouseX, mouseY) < 50) {
    selected = medblue;
  }
  if (dist(750, 750, mouseX, mouseY) < 50) {
    selected = darkblue;
  }
}
