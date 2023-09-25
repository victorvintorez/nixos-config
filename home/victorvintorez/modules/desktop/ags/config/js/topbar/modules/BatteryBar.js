import icons from '../../utils/icons.js';
import FontIcon from '../../utils/components/FontIcon.js';
import opts from '../../utils/options.js';
import PanelButton from '../PanelButton.js';

const { Battery } = ags.Service;
const { Widget, Box, Stack, Icon, Revealer, Label } = ags.Widget;

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
    revealChild: opts.battery.showPercentage,
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

const BatteryBar = () => {
    const revealer = PercentLabel();

    return PanelButton({
        className: 'topbar-modules-battterybar',
        onClicked: () => revealer.revealChild = !revealer.revealChild,
        content: Box({
            binds: [['visible', Battery, 'available']],
            connections: [[Battery, w => {
                w.toggleClassName('charging', Battery.charging || Battery.charged);
                w.toggleClassName('medium', Battery.percent < opts.battery.medium);
                w.toggleClassName('low', Battery.percent < opts.battery.low);
            }]],
            children: [
                Indicator(),
                revealer,
                LevelBar(),
            ]
        })
    })
}

export default BatteryBar;