import icons from '../../icons.js';
import { SimpleToggleButton } from '../ToggleButton.js';
import { Notifications, Widget } from '../../imports.js'
const { Icon } = Widget;

export default () => SimpleToggleButton({
    icon: Icon({
        connections: [[Notifications, icon => {
            icon.icon = Notifications.dnd
                ? icons.notifications.silent
                : icons.notifications.noisy;
        }]],
    }),
    toggle: () => Notifications.dnd = !Notifications.dnd,
    connection: [Notifications, () => Notifications.dnd],
});
