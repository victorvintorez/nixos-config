import { Widget } from '../imports.js'
const { Label } = Widget;
import GLib from 'gi://GLib';

export default ({
    format = '%H:%M:%S %B %e. %A',
    interval = 1000,
    ...props
} = {}) => Label({
    className: 'clock',
    ...props,
    connections: [[interval, label =>
        label.label = GLib.DateTime.new_now_local().format(format),
    ]],
});
