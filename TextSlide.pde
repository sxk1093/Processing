
void slideDesc(String description){
  background(backgroundColour);
  PFont font;
  font = createFont("Poppins-Black.otf", 128);
  //textFont(font, 36);
  textAlign(CENTER, CENTER);
  fill(textColor);
  text(description, width/2, height/2);
}

void textDesc(String description, float x, float y){
  PFont font;
  font = createFont("Poppins-Black.otf", 128);
  //textFont(font, 28);
  textAlign(CENTER, TOP);
  fill(textColor);
  text(description, x, y);
}
