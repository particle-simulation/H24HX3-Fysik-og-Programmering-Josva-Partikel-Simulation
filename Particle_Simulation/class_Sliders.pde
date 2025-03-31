class Slider {
  //atributes
  int hojde = 20;
  int laengde = 600;
  PVector pos ;
  PVector sliderPos ;
  //constructor
  Slider(int x, int y) {
    pos = new PVector(x,y);
    sliderPos = new PVector(random(600),y);
  }
  //Methods
  void drawSlider() {
    fill(125);
    rect(pos.x, pos.y, laengde, hojde);
    fill(255);
    rect(sliderPos.x,sliderPos.y,10,hojde);
  }
}
