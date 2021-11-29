/**
1. Abstract Art
2. Representation mathematical concepts
3. Interactive visualisations
**/
import processing.video.*;

int page = 0;

boolean nextSlide = false;
color backgroundColour = color(0, 0, 0);
color neutral = color(202, 202, 202);
color textColor = color(226, 234, 253);
color strokeColor = color(31,47,167);

color math1 = color(132, 172, 254);
color math2 = strokeColor;
color math3 = color(11, 100, 255);

Movie myMovie1;
Movie myMovie2;


int tentaclNum = 5;
int tentaclGroupsNum = 28;
Tentacles [] tentacles = new Tentacles[tentaclGroupsNum];
float x1, x2, y1, y2;
float angle1, angle2;
float scalar = 70;


float ghost = 100;



void setup () {
  size(1440, 848);
    
  colorMode(HSB, 360, 100, 100, 100);
  
  
  myMovie1 = new Movie(this, "Radiohead.mov");
  myMovie2 = new Movie(this, "Processing Art.mov");

  for (int i = 0; i < tentacles.length; i++) {
    tentacles [i] = new Tentacles(i*50 - width / 2, height/2, -1*PI/4, random(170,220));
  }
  
  noStroke();
  
}

void draw () {
  if (page == 1) {
    background(0);
    PImage img;
    img = loadImage("sunflower_processing.jpeg");
    img.resize(1440, 848);
    image(img, 0, 0, mouseX-50, 848);
    textAlign(CENTER, CENTER);
    textSize(108);
    text("PROCESSING",width/2, height/2);
    textSize(30);
    text("By Lauren Alie and Selma Kander", width/2, (height/2)+100);
  }
  if (page == 2) {
    image(myMovie1, width/2, height/2);
    imageMode(CENTER);
    myMovie1.play();
    
  }
  if (page == 3) {
    myMovie1.stop();
  }
  if (page == 4) {
    String description = "Processing is a set of Java libraries with an IDE \n\nFirst release was in 2001 \n\nIts aim is to teach programming \nfundamentals with a visual context \n\nIt's free to use and offers a variety of libraries";
    background(0, 0, 0);
    PFont font;
    font = createFont("Poppins-Black.otf", 128);
    //textFont(font, 56);
    textSize(56);
    fill(textColor);
    textAlign(LEFT, TOP);
    text(description, 50, 50);
    PImage logo;
    logo = loadImage("logo.jpg");
    image(logo, 1150, 400);
    
  }
  if (page == 5) {
    String description = "Processing helps visualise maths and code \nin an artistic framework \n\nIt's particularly useful for visual learners \n\nBetter for higher level students, requires some \nprogramming abilities";
    background(0, 0, 0);
    PFont font;
    font = createFont("Poppins-Black.otf", 128);
    //textFont(font, 50);
    fill(textColor);
    textSize(56);
    textAlign(LEFT, TOP);
    text(description, 50, 50);
  }
  if (page == 6) {
    slideDesc("Processing can be used to create art...");
  }
  if (page == 7){
    drawGrass();
  }
  if (page == 8){
    slideDesc("..and to represent mathematical concepts");
  }
  if (page == 9){
    cosAndSin();
  }
  if (page == 10){
    slideDesc("We can even interact with our creations!");
  }
  if (page == 11){
    startPainting();
  }
  if (page == 12){
    image(myMovie2, width/2, height/2);
    imageMode(CENTER);
    myMovie2.play();
    myMovie2.loop();
  }
}
  
void movieEvent(Movie m) {
  m.read();
  
}
   
//  drawGrass();
//  slideDesc("..and to represent mathematical concepts");
//  displayEye();
//  slideDesc("We can even interact with our creations!");
//  


//----------------------------------------------

class Tentacles {
  Tentacle [] tentacle = new Tentacle[tentaclNum];
  PVector location;
  float angle;
  float hue;

  Tentacles (float _x, float _y, float _angle, float _hue) {
    location = new PVector(_x, _y);
    angle = _angle;
    hue = _hue;

    for (int i = 0; i < tentacle.length; i++) {
      tentacle [i] = new Tentacle(_hue);
    }
  }

  void run () {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    for (int i = 0; i < tentacle.length; i++) {
      rotate(PI/10);
      tentacle[i].run();
    }
    popMatrix();
  }
}

//----------------------------------------------

class Tentacle {
  float theta, thetaRate;
  float wiggle;
  float size;
  float hue;


  Tentacle (float _hue) {
    thetaRate = (int)random(50, 200);
    size = (int)random(20, 45);
    hue = _hue;
  }

  void run () {
    theta += PI/thetaRate;

    display(-size, PI/20, 0, 0);
  }

  void display (float y, float amp, float thetaStart, float wiggle) {
    wiggle = .8*sin(theta+thetaStart);

    strokeWeight(abs(y)+abs(wiggle));
    stroke(hue - 70, 70, 100+y*2);
    line(0, 0, 0, y);

    if (y < 0) {
      pushMatrix();
      translate(0, y);
      //rotate(wiggle/50);
      rotate(wiggle/50);
      display(y+size/30, amp+1, thetaStart-0.1, wiggle);
      popMatrix();
    }
  }
}

void drawGrass() {
  noStroke();
  fill(210, 50, 85, ghost);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  for (int i = 0; i < tentacles.length; i++) {
    //rotate(PI/(tentaclGroupsNum/2));
    tentacles [i] .run();
  }
}
//-------

void cosAndSin() {
  background(backgroundColour);
  noStroke();
  rectMode(CENTER);
  

  float ang1 = radians(angle1);
  float ang2 = radians(angle2);

  x1 = width/2 + (scalar * cos(ang1));
  x2 = width/2 + (scalar * cos(ang2));
  
  y1 = height/2 + (scalar * sin(ang1));
  y2 = height/2 + (scalar * sin(ang2));
  
  fill(math3);
  rect(width*0.5, height*0.5, 140, 140);

  fill(math2);
  ellipse(x1, height*0.5 - 120, scalar, scalar);
  ellipse(x2, height*0.5 + 120, scalar, scalar);
  
  fill(math1);
  ellipse(width*0.5 - 120, y1, scalar, scalar);
  ellipse(width*0.5 + 120, y2, scalar, scalar);

  angle1 += 2;
  angle2 += 3;
  
  textDesc("Linear movement between sin() and cos()", width/2,  height/5);
  
}

// ----

void startPainting() {
  stroke(math3);
  strokeWeight(16);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

// ---

void keyPressed(){
  if (page < 15) {
    page++;
  }
  
}
