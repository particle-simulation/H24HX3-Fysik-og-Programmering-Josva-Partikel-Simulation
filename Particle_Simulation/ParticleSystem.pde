class ParticleSystem { //Ref. ChatGPT
  // Array to hold all the particles in the system
  Particle[] particles;

  // Total number of particles in the system
  int numParticles;

  // Vector representing the gravitational force applied to the particles
  PVector gravity;

  // Radius within which particles will interact with each other
  float interactionRadius = 30;

  // Strength of the repulsion force between particles
  float repulsionStrength = 0.5;

  // Damping factor to reduce the velocity of particles over time
  float damping = 0.7;

  // Constructor to initialize the particle system with a specified number of particles
  ParticleSystem(int count) {
    numParticles = count; // Set the number of particles
    gravity = new PVector(0, 0.2); // Initialize gravity vector
    particles = new Particle[numParticles]; // Create an array for particles
    reset(); // Initialize particle positions
  }

  // Update the state of the particle system
  void update() {
    for (int i = 0; i < numParticles; i++) {
      particles[i].applyForce(gravity);

      for (int j = 0; j < numParticles; j++) {
        if (i != j) {
          PVector dir = PVector.sub(particles[i].position, particles[j].position);
          float d = dir.mag();
          if (d < interactionRadius && d > 0) {
            dir.normalize();
            float force = repulsionStrength / d;
            particles[i].applyForce(dir.mult(force));
          }
        }
      }

      particles[i].update();
      particles[i].checkEdges(damping); // Check inside sim area
    }
  }

  void reset() {
    for (int i = 0; i < numParticles; i++) {
      particles[i] = new Particle(simW/2, simH/2); // local to simulation box
    }
  }


  // Display all particles in the system
  void display() {
    for (Particle p : particles) {
      p.display(); // Call the display method for each particle
    }
  }


  // Set a new gravity vector for the particle system
  void setGravity(PVector g) {
    gravity.set(g); // Update the gravity vector
  }
}
