import TopBar from './js/bar/TopBar.js';
import Dashboard from './js/dashboard/Dashboard.js';
import Applauncher from './js/applauncher/Applauncher.js';
import PowerMenu from './js/powermenu/PowerMenu.js';
import Verification from './js/powermenu/Verification.js';
import Desktop from './js/desktop/Desktop.js';
import Notifications from './js/notifications/Notifications.js';
import QuickSettings from './js/quicksettings/QuickSettings.js';
import { scssWatcher, warnOnLowBattery, forMonitors } from './js/utils.js';
import options from './js/options.js';

warnOnLowBattery();
scssWatcher();

export default {
    maxStreamVolume: 1.05,
    cacheNotificationActions: true,
    closeWindowDelay: {
        'quicksettings': options.windowAnimationDuration,
        'dashboard': options.windowAnimationDuration,
    },
    windows: [
        forMonitors(TopBar),
        forMonitors(Desktop),
        forMonitors(Notifications),
        Applauncher(),
        Dashboard(),
        QuickSettings(),
        PowerMenu(),
        Verification(),
    ].flat(2),
};
