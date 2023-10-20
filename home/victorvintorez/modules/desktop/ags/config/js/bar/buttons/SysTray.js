import PanelButton from '../PanelButton.js';
import { SystemTray, Widget } from '../../imports.js';

const SysTrayItem = item => PanelButton({
    content: Widget.Icon({ binds: [['icon', item, 'icon']] }),
    binds: [['tooltipMarkup', item, 'tooltip-markup']],
    // setup: btn => {
    //     const id = item.menu.connect('popped-up', menu => {
    //         btn.toggleClassName('active');
    //         menu.connect('notify::visible', menu => {
    //             btn.toggleClassName('active', menu.visible);
    //         });
    //         menu.disconnect(id);
    //     });
    // },
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
});

const systray = Widget.Box({
    connections: [[SystemTray, box => {
        box.children = SystemTray.items.map(item => SysTrayItem(item));
    }]],
});

export default systray;