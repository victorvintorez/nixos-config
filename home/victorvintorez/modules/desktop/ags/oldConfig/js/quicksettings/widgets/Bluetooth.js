import icons from '../../icons.js';
import Spinner from '../../misc/Spinner.js';
import { Menu, ArrowToggleButton } from '../ToggleButton.js';
import { Bluetooth, Widget } from '../../imports.js'
const { Icon, Label, Box } = Widget;

export const BluetoothToggle = () => ArrowToggleButton({
    name: 'bluetooth',
    icon: Icon({
        connections: [[Bluetooth, icon => {
            icon.icon = Bluetooth.enabled
                ? icons.bluetooth.enabled
                : icons.bluetooth.disabled;
        }]],
    }),
    label: Label({
        truncate: 'end',
        connections: [[Bluetooth, label => {
            if (!Bluetooth.enabled)
                return label.label = 'Disabled';

            if (Bluetooth.connectedDevices.length === 0)
                return label.label = 'Not Connected';

            if (Bluetooth.connectedDevices.length === 1)
                return label.label = Bluetooth.connectedDevices[0].alias;

            label.label = `${Bluetooth.connectedDevices.length} Connected`;
        }]],
    }),
    connection: [Bluetooth, () => Bluetooth.enabled],
    deactivate: () => Bluetooth.enabled = false,
    activate: () => Bluetooth.enabled = true,
});

export const BluetoothDevices = () => Menu({
    name: 'bluetooth',
    icon: Icon(icons.bluetooth.disabled),
    title: Label('Bluetooth'),
    content: Box({
        hexpand: true,
        vertical: true,
        connections: [[Bluetooth, box => {
            box.children = Bluetooth.devices.map(device => Box({
                children: [
                    Icon(device.iconName + '-symbolic'),
                    Label(device.name),
                    device.batteryPercentage > 0 && Label(`${device.batteryPercentage}%`),
                    Box({ hexpand: true }),
                    device.connecting ? Spinner() : Widget({
                        type: imports.gi.Gtk.Switch,
                        active: device.connected,
                        connections: [['notify::active', ({ active }) => {
                            device.setConnection(active);
                        }]],
                    }),
                ],
            }));
        }]],
    }),
});
