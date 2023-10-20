import icons from '../../icons.js';
import { Menu, ArrowToggleButton } from '../ToggleButton.js';
import { Network, Widget } from '../../imports.js'
const { Icon, Label, Box, Button } = Widget;

export const NetworkToggle = () => ArrowToggleButton({
    name: 'network',
    icon: Icon({
        connections: [[Network, icon => {
            icon.icon = Network.wifi?.iconName || '';
        }]],
    }),
    label: Label({
        truncate: 'end',
        connections: [[Network, label => {
            label.label = Network.wifi?.ssid || 'Not Connected';
        }]],
    }),
    connection: [Network, () => Network.wifi?.enabled],
    deactivate: () => Network.wifi.enabled = false,
    activate: () => {
        Network.wifi.enabled = true;
        Network.wifi.scan();
    },
});

export const WifiSelection = () => Menu({
    name: 'network',
    icon: Icon({
        connections: [[Network, icon => {
            icon.icon = Network.wifi?.iconName;
        }]],
    }),
    title: Label('Wifi Selection'),
    content: Box({
        vertical: true,
        connections: [[Network, box => box.children =
            Network.wifi?.accessPoints.map(ap => Button({
                onClicked: `nmcli device wifi connect ${ap.bssid}`,
                child: Box({
                    children: [
                        Icon(ap.iconName),
                        Label(ap.ssid),
                        ap.active && Icon({
                            icon: icons.tick,
                            hexpand: true,
                            halign: 'end',
                        }),
                    ],
                }),
            })),
        ]],
    }),
});
