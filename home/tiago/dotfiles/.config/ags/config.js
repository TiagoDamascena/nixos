import App from 'resource:///com/github/Aylur/ags/app.js';
import Bar from "./windows/Bar.js";
import PowerMenu from './windows/PowerMenu.js';
import VolumeMenu from './windows/VolumeMenu.js';
import { forMonitors } from './common/utils.js';

export default {
  style: App.configDir + '/style.css',
  windows: [
    forMonitors(Bar),
    PowerMenu(),
    VolumeMenu(),
  ]
}