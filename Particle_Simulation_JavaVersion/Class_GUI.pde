class GUI { //static GUI elements
  //Attributes
  int settingsWindowHeight = 800;
   int settingsWindowWidth = 990;
  Slider slider1 = new Slider(settingsWindowWidth/2-350,settingsWindowHeight,"Tyngdekraft");
  Slider slider2 = new Slider(settingsWindowWidth/2-350,settingsWindowHeight-175,"Partikler");
  //Constructor
  //Methods
  void drawGUI(){
    fill(45);
    rect(45,45,settingsWindowHeight,settingsWindowWidth);
    slider1.drawSlider();
    slider2.drawSlider();
  }
}
