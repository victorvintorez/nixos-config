import icons from '../../utils/icons';
import PanelButton from '../PanelButton';

const { Icon } = ags.Widget;

const PowerMenu = () => PanelButton({
    className: 'topbar-powermenu',
    content: Icon(icons.powermenu.shutdown),
    onClicked: () => ags.App.openWindow('powermenu'),
});

export default PowerMenu;