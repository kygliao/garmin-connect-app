import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Sensor;
using Toybox.ActivityRecording;

class GarminDeviceAppApp extends Application.AppBase {
    var mLogger = null;

    // Callbacks
    var heartBeatIntervals = [];

    function heartBeatIntervalsCallback(sensorData) as Void {
        if (sensorData has :heartRateData && sensorData.heartRateData != null) {
            heartBeatIntervals = sensorData.heartRateData.heartBeatIntervals;
            System.println(heartBeatIntervals);
        }
    }

    function initialize() {
        AppBase.initialize();

        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method(:onSensor));

        // Listeners
        var options = {
            :period => 1,               // 1 second sample time
            :accelerometer => {
                :enabled => false,       // Enable the accelerometer
                :sampleRate => 25       // 25 samples
            },
            :heartBeatIntervals => {
                :enabled => true
            }
        };

        Sensor.registerSensorDataListener(method(:heartBeatIntervalsCallback), options);
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        // Set up a fit session to record the data

        // mSession.
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }


    function onSensor(sensorInfo) {
        System.println("Heart Rate: " + sensorInfo.heartRate);
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new GarminDeviceAppView(), new GarminDeviceAppDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as GarminDeviceAppApp {
    return Application.getApp() as GarminDeviceAppApp;
}