import PowerMenu from './modules/PowerMenu.js';
import BatteryBar from './modules/BatteryBar.js';
import FocusedWindow from './modules/FocusedWindow.js'

const { Window, CenterBox, Box } = ags.Widget;

const Start = () => Box({
    className: 'topbar-start',
    children: [
        PowerMenu(),
    ],
});

const Center = () => Box({
    className: 'topbar-center',
    children: [
        FocusedWindow(),
    ],
});

const End = () => Box({
    className: 'topbar-end',
    children: [
        BatteryBar(),
    ],
});

export default monitor => Window({
    name: `bar${monitor}`,
    exclusive: true,
    monitor,
    anchor: 'top left right',
    child: CenterBox({
        className: 'topbar-panel',
        startWidget: Start(),
        centerWidget: Center(),
        endWidget: End(),
    }),
})