class Particle { //Ref. ChatGPT
  // Position of the particle in 2D space
  PVector position;
  
  // Velocity of the particle, representing its speed and direction
  PVector velocity;
  
  // Acceleration of the particle, representing the change in velocity
  PVector acceleration;
  
  // Radius of the particle, used for rendering and collision detection
  float radius = 10;

  // Constructor to initialize the particle with a specific position
  Particle(float x, float y) {
    position = new PVector(x, y); // Set the initial position of the particle
    // Initialize velocity with random values for a more dynamic effect
    velocity = new PVector(random(-1, 1), random(-2, 0)); 
    acceleration = new PVector(0, 0); // Start with no acceleration
  }

  // Apply a force to the particle, affecting its acceleration
  void applyForce(PVector force) {
    acceleration.add(force); // Add the force to the current acceleration
  }

  // Update the particle's position and velocity based on its acceleration
  void update() {
    velocity.add(acceleration); // Update velocity based on acceleration
    position.add(velocity); // Update position based on velocity
    acceleration.mult(0); // Reset acceleration for the next frame
  }

  // Check if the particle has hit the edges of the window and apply damping
 void checkEdges(float damping) {
  // Horizontal edges
  if (position.x < radius) {
    position.x = radius;
    velocity.x *= -damping;
  } else if (position.x > simW - radius) {
    position.x = simW - radius;
    velocity.x *= -damping;
  }

  // Vertical edges
  if (position.y < radius) {
    position.y = radius;
    velocity.y *= -damping;
  } else if (position.y > simH - radius) {
    position.y = simH - radius;
    velocity.y *= -damping;
  }
}


  // Render the particle on the screen
  void display() {
    fill(100, 150, 255); // Set the fill color for the particle
    stroke(50); // Set the stroke color for the outline
    // Draw the particle as a circle at its position
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
