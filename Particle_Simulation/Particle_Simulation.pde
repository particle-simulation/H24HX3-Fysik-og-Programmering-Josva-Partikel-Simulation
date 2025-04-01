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
int value = 0;
boolean firstMousePress = false;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  gui=new GUI(); //initiate GUI class
  textSize(50);

  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}


void draw() {
  background(0);
  gui.drawGUI(); //draws GUI class on screen
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}

void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
