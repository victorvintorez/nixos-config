import OverviewButton from './buttons/OverviewButton.js';
import Workspaces from './buttons/Workspaces.js';
import FocusedClient from './buttons/FocusedClient.js';
import DateButton from './buttons/DateButton.js';
import NotificationIndicator from './buttons/NotificationIndicator.js';
//import SysTray from './buttons/SysTray.js';
import SystemIndicators from './buttons/SystemIndicators.js';
import PowerMenu from './buttons/PowerMenu.js';
import Separator from '../misc/Separator.js';
import ScreenRecord from './buttons/ScreenRecord.js';
import BatteryBar from './buttons/BatteryBar.js';
import SubMenu from './buttons/SubMenu.js';
import { SystemTray, Widget, Service, Variable } from '../imports.js';
const { Window, CenterBox, Box } = Widget;

const submenuItems = Variable(1);
SystemTray.connect('added', () => {
    submenuItems.setValue(SystemTray.items.length + 1);
});
SystemTray.connect('removed', () => {
    submenuItems.setValue(SystemTray.items.length + 1);
});

const SeparatorDot = (service, condition) => Separator({
    orientation: 'vertical',
    valign: 'center',
    connections: service && [[Service[service], dot => {
        dot.visible = condition(Service[service]);
    }]],
});

const Start = () => Box({
    className: 'start',
    children: [
        OverviewButton(),
        SeparatorDot(),
        Workspaces(),
        SeparatorDot(),
        FocusedClient(),
        Box({ hexpand: true }),
        NotificationIndicator(),
        SeparatorDot('Notifications', n => n.notifications.length > 0 || n.dnd),
    ],
});

const Center = () => Box({
    className: 'center',
    children: [
        DateButton(),
    ],
});

const End = () => Box({
    className: 'end',
    children: [
        SeparatorDot('Mpris', m => m.players.length > 0),
        Box({ hexpand: true }),

        SubMenu({
            items: submenuItems,
            children: [
                //SysTray(),
            ],
        }),
        SeparatorDot(),
        ScreenRecord(),
        SeparatorDot('Recorder', r => r.recording),
        SystemIndicators(),
        SeparatorDot('Battery', b => b.available),
        BatteryBar(),
        SeparatorDot(),
        PowerMenu(),
    ],
});

export default monitor => Window({
    name: `bar${monitor}`,
    exclusive: true,
    monitor,
    anchor: 'top left right',
    child: CenterBox({
        className: 'panel',
        startWidget: Start(),
        centerWidget: Center(),
        endWidget: End(),
    }),
});
