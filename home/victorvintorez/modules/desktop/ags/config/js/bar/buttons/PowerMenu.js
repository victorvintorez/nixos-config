import icons from '../../icons.js';
import PanelButton from '../PanelButton.js';
import { App, Widget } from '../../imports.js'
const { Icon } = Widget;

export default () => PanelButton({
    className: 'powermenu',
    content: Icon(icons.powermenu.shutdown),
    onClicked: () => App.openWindow('powermenu'),
});
