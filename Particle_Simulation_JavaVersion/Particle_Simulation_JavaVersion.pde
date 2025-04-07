GUI gui; //declare GUI
int value = 0;
boolean firstMousePress = false;

void setup() {
  fullScreen();
  frameRate(60);
  //orientation(LANDSCAPE);
  gui=new GUI(); //initiate GUI class
  textSize(50);
}


void draw() {
  background(0);
  gui.drawGUI(); //draws GUI class on screen
  println("Slider1 Value: " + gui.slider1.getValue());
  println("Slider2 Value: " + gui.slider2.getValue());
  
}

void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
