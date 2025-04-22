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
PVector gravityDirection = new PVector(0, 0); // direction of gravity from accelerometer
PVector gravity = new PVector(0, 0); // actual gravity force applied to particles
int simX = 855; // X position of simulation area
int simY = 45;  // Y position of simulation area
int simW = 990; // Width of simulation area
int simH = 990; // Height of simulation area

int value = 0;
boolean firstMousePress = false;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  gui=new GUI(); //initiate GUI class
  textSize(50);
  ps = new ParticleSystem(gui.slider2.getValue()); // Initial number of particles

  context = getActivity(); // get Android context
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE); // get sensor manager
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); // use accelerometer sensor
  listener = new AccelerometerListener(); // create new sensor event listener
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME); // register listener
}


void draw() {
  background(0);
  gui.drawGUI();  // draws the UI

  // Update gravity based on slider1 value (0–10G)
  float gravityMagnitude = gui.slider1.getValue() * 0.2; // scale G (adjust if needed)
  gravity.set(gravityDirection.copy().mult(gravityMagnitude)); // set gravity vector
  ps.setGravity(gravity); // apply gravity to particle system

  // Check if slider2 changed, recreate ParticleSystem
  int desiredParticles = gui.slider2.getValue();
  if (ps.numParticles != desiredParticles) {
    ps = new ParticleSystem(desiredParticles); // recreate system if count changed
  }

 
  pushMatrix(); // isolate transformations
  translate(simX, simY); // Shift origin to simulation area
  ps.update();
  ps.display(); //draw particles
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
