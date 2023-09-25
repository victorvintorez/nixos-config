import PanelButton from "../PanelButton.js";
import opts from '../../utils/options.js';

const { Hyprland } = ags.Service;
const { lookUpIcon } = ags.Utils;
const { Box, Label, Icon } = ags.Widget;

const ClientLabel = () => Label({
    connections: [[Hyprland, label => {
        let name = Hyprland.active.client.title;
        opts.substitutes.ClientLabel.forEach(([from, to]) => {
            if(name === from)
                name = to;
        });
        label.label = name;
    }]],
});

const ClientIcon = () => Icon({
    connections: [[Hyprland, icon => {
        let classIcon = `${Hyprland.active.client.class}-symbolic`;
        let titleIcon = `${Hyprland.active.client.title}-symbolic`;
        opts.substitutes.ClientIcon.forEach(([from, to]) => {
            if(classIcon === from)
                classIcon = to;
            if(titleIcon === from)
                titleIcon = to;
        });
        const hasClassIcon = lookUpIcon(classIcon);
        const hasTitleIcon = lookUpIcon(titleIcon);
        if(hasClassIcon)
            icon.icon = classIcon;
        if(hasTitleIcon)
            icon.icon = titleIcon;
        icon.visible = hasTitleIcon || hasClassIcon;
    }]],
});

const FocusedWindow = () => PanelButton({
    className: 'topbar-modules-focusedwindow',
    content: Box({
        children: [
            ClientIcon(),
            ClientLabel(),
        ],
    }),
});

export default FocusedWindow;