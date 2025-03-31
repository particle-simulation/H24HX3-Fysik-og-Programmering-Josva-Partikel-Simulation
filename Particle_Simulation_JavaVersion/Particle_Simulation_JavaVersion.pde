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
}
  
void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
