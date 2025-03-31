class Slider {
  //atributes
  String sliderName;
  int hojde = 50;
  int laengde = 600;
  PVector pos ;
  PVector sliderPos ;
  //constructor
  Slider(int x, int y,String sliderN) {
    pos = new PVector(x,y);
    sliderName = sliderN;
    sliderPos = new PVector(random(600),y);
  }
  //Methods
  void drawSlider() {
    fill(255);
    text(sliderName,pos.x,pos.y-10);
    fill(125);
    rect(pos.x, pos.y, laengde, hojde);
    fill(255);
    rect(sliderPos.x,sliderPos.y,30,hojde);
  }
}
