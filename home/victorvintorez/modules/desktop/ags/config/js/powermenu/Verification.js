import PopupWindow from '../misc/PopupWindow.js';
import PowerMenu from '../services/powermenu.js';
const { Label, Box, Button } = ags.Widget;
import { App } from '../imports.js'

export default () => PopupWindow({
    name: 'verification',
    expand: true,
    content: Box({
        className: 'verification',
        vertical: true,
        children: [
            Label({
                className: 'title',
                connections: [[PowerMenu, label => {
                    label.label = PowerMenu.instance.title || '';
                }]],
            }),
            Box({
                className: 'buttons',
                vexpand: true,
                valign: 'end',
                homogeneous: true,
                children: [
                    Button({
                        child: Label('󰅖'),
                        onClicked: () => App.toggleWindow('verification'),
                    }),
                    Button({
                        child: Label('󰄬'),
                        onClicked: () => ags.Utils.exec(PowerMenu.instance.cmd),
                    }),
                ],
            }),
        ],
    }),
});
