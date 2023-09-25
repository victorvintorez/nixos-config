const options = {
    prefferedMpris: 'spotify',
    workspaces: 6,
    battery: {
        showPercentage: true,
        low: 20,
        medium: 50
    },
    substitutes: {
        ClientTitle: [
            ['codium-url-handler', 'VSCode'],
            ['kitty', 'Terminal'],
            ['firefox', 'Firefox'],
            ['', 'Desktop'],
        ],
        ClientIcon: [
            ['-symbolic', 'preferences-desktop-display-symbolic'],
        ],
    }
}

export default options;