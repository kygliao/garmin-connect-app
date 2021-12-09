import Toybox.Lang;
import Toybox.WatchUi;

class GarminDeviceAppDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new GarminDeviceAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}