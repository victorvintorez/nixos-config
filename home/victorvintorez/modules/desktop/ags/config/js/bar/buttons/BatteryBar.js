import icons from '../../icons.js';
import FontIcon from '../../misc/FontIcon.js';
import options from '../../options.js';
import PanelButton from '../PanelButton.js';
import {Battery, Widget} from '../../imports.js';
const { Box, Stack, Icon, Revealer, Label } = Widget;

const Indicator = () => Stack({
    items: [
        ['false', Icon({ binds: [['icon', Battery, 'iconName']] })],
        ['true', FontIcon({ icon: icons.battery.charging })],
    ],
    connections: [[Battery, stack => {
        stack.shown = `${Battery.charging || Battery.charged}`;
    }]],
});

const PercentLabel = () => Revealer({
    transition: 'slide_right',
    revealChild: options.battaryBar.showPercentage,
    child: Label({
        connections: [[Battery, label => {
            label.label = `${Battery.percent}%`;
        }]],
    }),
});

const LevelBar = () => Widget({
    type: imports.gi.Gtk.LevelBar,
    valign: 'center',
    connections: [[Battery, levelbar => {
        levelbar.value = Battery.percent / 100;
    }]],
});

export default () => {
    const revealer = PercentLabel();

    return PanelButton({
        className: 'battery-bar',
        onClicked: () => revealer.revealChild = !revealer.revealChild,
        content: Box({
            binds: [['visible', Battery, 'available']],
            connections: [[Battery, w => {
                w.toggleClassName('charging', Battery.charging || Battery.charged);
                w.toggleClassName('medium', Battery.percent < options.battaryBar.medium);
                w.toggleClassName('low', Battery.percent < options.battaryBar.low);
            }]],
            children: [
                Indicator(),
                revealer,
                LevelBar(),
            ],
        }),
    });
};
