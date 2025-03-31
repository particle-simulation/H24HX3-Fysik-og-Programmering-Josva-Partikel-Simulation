class Slider {
  //atributes
  String sliderName; 
  int hojde = 50;
  int laengde = 600;
  PVector pos ;
  PVector sliderPos ;
  int value = 0;
  boolean over;
  //constructor
  Slider(int x, int y, String sliderN) {//Position and name of slider
    pos = new PVector(x, y);//Position of slider
    sliderName = sliderN; //Name of slider
    sliderPos = new PVector(random(600), y); 
  }
  //Methods
  void drawSlider() {
    fill(255);
    text(sliderName, pos.x, pos.y-10);
    fill(125);
    rect(pos.x, pos.y, laengde, hojde);
    fill(255);
    rect(sliderPos.x, sliderPos.y, 30, hojde);
  }
   boolean overEvent() {
    if (mouseX > pos.x && mouseX < pos.x+laengde &&
      mouseY > pos.y && mouseY < pos.y+hojde) {
      return true;
    } else {
      return false;
    }
  }
}
