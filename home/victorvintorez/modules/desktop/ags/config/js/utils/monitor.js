export const forMonitors = (widget, primary = null) => {
    const ws = ags.Service.Hyprland.HyprctlGet('monitors');
    if(!primary || typeof primary !== 'number')
        return ws.map(mon => widget(mon.id))
    return widget(primary)
}