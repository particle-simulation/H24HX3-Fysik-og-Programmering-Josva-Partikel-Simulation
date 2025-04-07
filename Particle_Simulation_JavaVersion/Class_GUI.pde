class GUI {
  int settingsWindowHeight = 800;
  int settingsWindowWidth = 990;
  int particleWindowHeight = 990;
  int particleWindowWidth = 990;
  Slider slider1 = new Slider(settingsWindowWidth / 2 - 350, settingsWindowHeight +100, "Tyngdekraft");
  Slider slider2 = new Slider(settingsWindowWidth / 2 - 350, settingsWindowHeight , "Partikler");

  void drawGUI() {
    fill(45);
    rect(45, 45, settingsWindowHeight, settingsWindowWidth);
    rect(855,45,particleWindowHeight,particleWindowWidth);
    slider1.update();
    slider2.update();
    slider1.drawSlider();
    slider2.drawSlider();
  }
}
