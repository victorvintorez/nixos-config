import Theme from '../services/theme/theme.js';
import { Widget } from '../imports.js'
const { Box } = Widget;

export default ({ className, ...props }) => Box({
    ...props,
    className: `wallpaper ${className}`,
    connections: [[Theme, box => {
        box.setStyle(`
            background-image: url('${Theme.getSetting('wallpaper')}');
            background-size: cover;
        `);
    }]],
});
