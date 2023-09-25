import icons from '../../utils/icons.js';
import PanelButton from '../PanelButton.js';

const { Icon } = ags.Widget;

const PowerMenu = () => PanelButton({
    className: 'topbar-powermenu',
    content: Icon(icons.powermenu.shutdown),
    onClicked: () => ags.App.openWindow('powermenu'),
});

export default PowerMenu;