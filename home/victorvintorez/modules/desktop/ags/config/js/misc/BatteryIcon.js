import { Service, Widget } from '../imports.js'
const { Battery } = Service;
const { Icon } = Widget;

export default () => Icon({
    className: 'battery',
    binds: [['icon', Battery, 'iconName']],
    connections: [[Battery, stack => {
        const { charging, charged } = Battery;
        stack.shown = `${charging || charged}`;
        stack.toggleClassName('charging', Battery.charging);
        stack.toggleClassName('charged', Battery.charged);
        stack.toggleClassName('low', Battery.percent < 30);
    }]],
});
