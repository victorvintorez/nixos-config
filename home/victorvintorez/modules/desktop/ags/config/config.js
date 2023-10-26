import { watchAndCompileSass, compileTypescript } from './js/utils.js';

compileTypescript();
watchAndCompileSass();

import windows from './js/main.js';

export default {
    maxStreamVolume: 1.00,
    cacheNotificationActions: true,
    windows: windows
}