GUI gui; //declare GUI

void setup() {
  fullScreen();
  frameRate(60);
  //orientation(LANDSCAPE);
  gui=new GUI(); //initiate GUI class
  

}


void draw() {
  background(0);
  gui.drawGUI(); //draws GUI class on screen
}
