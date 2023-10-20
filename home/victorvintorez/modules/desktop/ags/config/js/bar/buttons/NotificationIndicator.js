import HoverRevealer from '../../misc/HoverRevealer.js';
const { Label, Icon } = Widget;
import { Notifications, App } from '../../imports.js';

export default ({ direction = 'left' } = {}) => HoverRevealer({
    className: 'notifications panel-button',
    eventboxConnections: [
        [Notifications, box => {
            box.visible =
                Notifications.notifications.length > 0 || Notifications.dnd;
        }],
        ['button-press-event', () => App.openWindow('dashboard')],
    ],
    connections: [[Notifications, revealer => {
        const title = Notifications.notifications[0]?.summary;
        if (revealer._title === title)
            return;

        revealer._title = title;
        revealer.revealChild = true;
        Utils.timeout(3000, () => {
            revealer.revealChild = false;
        });
    }]],
    direction,
    indicator: Icon({
        connections: [[Notifications, icon => {
            icon.icon = Notifications.dnd
                ? 'notifications-disabled-symbolic'
                : 'preferences-system-notifications-symbolic';
        }]],
    }),
    child: Label({
        truncate: 'end',
        maxWidthChars: 40,
        connections: [[Notifications, label => {
            label.label = Notifications.notifications[0]?.summary || '';
        }]],
    }),
});
