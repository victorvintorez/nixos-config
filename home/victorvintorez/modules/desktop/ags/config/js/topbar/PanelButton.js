const { Button, Box } = ags.Widget;

const PanelButton = ({ className, content, ...rest }) => Button({
    className: `panel-button ${className}`,
    child: Box({ children: [content] }),
    ...rest
});

export default PanelButton;