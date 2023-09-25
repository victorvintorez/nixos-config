import TopBar from './js/topbar/TopBar'
import { forMonitors } from './js/utils/monitor'

const css = ags.App.configDir + '/css/style.css';

export default {
    style: css,
    windows: [
        forMonitors(TopBar)
    ].flat(2)
}