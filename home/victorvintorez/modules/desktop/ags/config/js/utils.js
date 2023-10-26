import { Hyprland } from "../../oldConfig/js/imports"
import { App, Utils } from "./imports";


export const setMonitor = (widget, monitors) => {
    const monitors = Hyprland.monitors;
    if (typeof monitors === "number") return widget(monitors);
}

export const watchAndCompileSass = () => {
    const scss = App.configDir + '/scss/main.scss';
    const css = App.configDir + '/css/main.css';
    
    Utils.subprocess([
        'inotifywait',
        '--recursive',
        '--event', 'create,modify',
        '-m', App.configDir + '/scss',
    ], () => {
        exec(`sass ${scss} ${css}`);
        App.resetCss();
        App.applyCss();
    });
};

export const compileTypescript = () => {
    const ts = App.configDir + '/ts/main.ts';
    const js = App.configDir + '/js/main.js';

    exec(`cd ${App.configDir} && nix develop && bun install && tsc ${ts} --outfile ${js}`)
}