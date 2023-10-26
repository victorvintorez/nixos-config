import { Widget } from '../imports.js'
const { Button, Box } = Widget;

export default ({ className, content, ...rest }) => Button({
    className: `panel-button ${className}`,
    child: Box({ children: [content] }),
    ...rest,
});
