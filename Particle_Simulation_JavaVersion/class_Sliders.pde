class Slider {
  String sliderName;
  int hojde = 50;
  int laengde = 600;
  PVector pos;
  PVector sliderPos;
  int loose = 10;  // Controls how smoothly the slider moves
  boolean over = false;
  boolean locked = false;
  float newspos;

  // Constructor
  Slider(int x, int y, String sliderN) {
    pos = new PVector(x, y);
    sliderName = sliderN;
    sliderPos = new PVector(pos.x + random(laengde), y);
    newspos = sliderPos.x;
  }

  // Draws the slider UI
  void drawSlider() {
    fill(255);
    text(sliderName + ": " + getValue(), pos.x, pos.y - 10);  // Show name + value
    fill(125);
    rect(pos.x, pos.y, laengde, hojde); // Background bar
    fill(over || locked ? color(0) : color(255)); // Change color if interacting
    rect(sliderPos.x, sliderPos.y, 30, hojde); // Slider knob
  }

  // Update function to smoothly transition the slider when moved
  void update() {
    over = overEvent();

    if (firstMousePress && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }

    if (locked) {
      newspos = constrain(mouseX - 15, pos.x, pos.x + laengde - 30);
    }

    if (abs(newspos - sliderPos.x) > 1) {
      sliderPos.x += (newspos - sliderPos.x) / loose;
    }
  }

  // Convert slider position to a value between 0-100
  int getValue() {
    return int(map(sliderPos.x, pos.x, pos.x + laengde - 30, 0, 101));
  }

  // Check if mouse is over the slider
  boolean overEvent() {
    return mouseX > pos.x && mouseX < pos.x + laengde &&
      mouseY > pos.y && mouseY < pos.y + hojde;
  }
}
