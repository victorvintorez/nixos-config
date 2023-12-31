import icons from '../../icons.js';
import PowerMenu from '../../services/powermenu.js';
import Theme from '../../services/theme/theme.js';
import Avatar from '../../misc/Avatar.js';
import { uptime } from '../../variables.js';
import { Battery, Widget, Utils } from '../../imports.js'
const { Box, Label, Button, Icon, Overlay, ProgressBar } = Widget;


export const BatteryProgress = () => Box({
    className: 'battery-progress',
    vexpand: true,
    connections: [[Battery, w => {
        w.toggleClassName('half', Battery.percent < 46);
        w.toggleClassName('low', Battery.percent < 30);
    }]],
    children: [Overlay({
        vexpand: true,
        child: ProgressBar({
            hexpand: true,
            vexpand: true,
            connections: [[Battery, progress => {
                progress.fraction = Battery.percent / 100;
            }]],
        }),
        overlays: [Label({
            connections: [[Battery, l => {
                l.label = Battery.charging || Battery.charged
                    ? icons.battery.charging
                    : `${Battery.percent}%`;
            }]],
        })],
    })],
});

export default () => Box({
    className: 'header',
    children: [
        Avatar(),
        Box({
            className: 'system-box',
            vertical: true,
            hexpand: true,
            children: [
                Box({
                    children: [
                        Button({
                            valign: 'center',
                            onClicked: Theme.openSettings,
                            child: Icon(icons.settings),
                        }),
                        Label({
                            className: 'uptime',
                            hexpand: true,
                            valign: 'center',
                            connections: [[uptime, label => {
                                label.label = `uptime: ${uptime.value}`;
                            }]],
                        }),
                        Button({
                            valign: 'center',
                            onClicked: () => Utils.exec('gtklock'),
                            child: Icon(icons.lock),
                        }),
                        Button({
                            valign: 'center',
                            onClicked: () => PowerMenu.action('shutdown'),
                            child: Icon(icons.powermenu.shutdown),
                        }),
                    ],
                }),
                BatteryProgress(),
            ],
        }),
    ],
});
