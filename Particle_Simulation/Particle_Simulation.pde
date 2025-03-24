import g4p_controls.GCScheme;
import g4p_controls.G4P;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}


void draw() {
  background(50);
  
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
