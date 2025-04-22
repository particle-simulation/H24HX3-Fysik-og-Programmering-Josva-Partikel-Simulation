class Slider {
  String sliderName; // Label for the slider
  int hojde = 50; // Height of the slider
  int laengde = 600; // Length of the slider
  PVector pos; // position of the slider
  PVector sliderPos; // Position of the slider knob
  int loose = 10;  // Controls how smoothly the slider knob moves (higher = smoother)
  boolean over = false; // True if mouse is over the slider
  boolean locked = false; // True if slider is currently being dragged
  float newspos; // Target position for the slider knob

  // Constructor
  Slider(int x, int y, String sliderN) {
    pos = new PVector(x, y); // Set slider position
    sliderName = sliderN; // Store the name
    sliderPos = new PVector(pos.x + random(laengde), y); // Random starting position of slider
    newspos = sliderPos.x; // Set starting position
  }

  // Draws the slider UI
  void drawSlider() {
    fill(255);
    text(sliderName + ": " + getValue(), pos.x, pos.y - 10); // Show name + current value
    fill(125);
    rect(pos.x, pos.y, laengde, hojde); // Draw the background bar
    fill(over || locked ? color(0) : color(255)); // Change knob color when hovered or locked
    rect(sliderPos.x, sliderPos.y, 30, hojde); // Draw the slider knob
  }

  // Smoothly moves the slider knob and handles interaction
  void update() {
    over = overEvent(); // Check if mouse is over

    if (firstMousePress && over) {
      locked = true; 
    }
    if (!mousePressed) {
      locked = false; 
    }

    if (locked) {
      newspos = constrain(mouseX - 15, pos.x, pos.x + laengde - 30); // Set knob pos
    }

    if (abs(newspos - sliderPos.x) > 1) {
      sliderPos.x += (newspos - sliderPos.x) / loose; // Smooth interpolation to target. 
    }
  }

  // Maps the knob position to an integer value between 0–11
  int getValue() {
    return int(map(sliderPos.x, pos.x, pos.x + laengde - 30, 0, 11));
  }

  // Detects if mouse is within slider bounds
  boolean overEvent() {
    return mouseX > pos.x && mouseX < pos.x + laengde &&
      mouseY > pos.y && mouseY < pos.y + hojde;
  }
}
