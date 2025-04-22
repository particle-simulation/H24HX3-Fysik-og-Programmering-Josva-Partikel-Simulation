import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;
GUI gui; //declare GUI

ParticleSystem ps;
PVector gravityDirection = new PVector(0, 0);
PVector gravity = new PVector(0, 0);
int simX = 855;
int simY = 45;
int simW = 990;
int simH = 990;

int value = 0;
boolean firstMousePress = false;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  gui=new GUI(); //initiate GUI class
  textSize(50);
  ps = new ParticleSystem(gui.slider2.getValue()); // Initial number of particles

  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}


void draw() {
  background(0);
  gui.drawGUI();

  // Update gravity based on slider1 value (0–10G)
  float gravityMagnitude = gui.slider1.getValue() * 0.2; // scale G (adjust if needed)
  gravity.set(gravityDirection.copy().mult(gravityMagnitude));
  ps.setGravity(gravity);

  // Check if slider2 changed, recreate ParticleSystem
  int desiredParticles = gui.slider2.getValue();
  if (ps.numParticles != desiredParticles) {
    ps = new ParticleSystem(desiredParticles);
  }

  // Clip simulation drawing area
  pushMatrix();
  translate(simX, simY); // Shift origin to simulation area
  ps.update();
  ps.display();
  popMatrix();
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    // Android landscape: event.values[0] = left-right, [1] = up-down, [2] = Z
    gravityDirection.set(event.values[1], event.values[0]); // Invert X because phone is in landscape
    gravityDirection.normalize();
  }

  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}

void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
