import TopBar from './js/topbar/TopBar.js'
import { forMonitors } from './js/utils/monitor.js'

const css = ags.App.configDir + '/css/styles.css';

export default {
    style: css,
    windows: [
        forMonitors(TopBar)
    ].flat(2)
}