import App from 'resource:///com/github/Aylur/ags/app.js';
import Bar from "./windows/Bar.js";
import PowerMenu from './windows/PowerMenu.js';
import VolumeMenu from './windows/VolumeMenu.js';

export default {
  style: App.configDir + '/style.css',
  windows: [
    Bar(0),
    PowerMenu(),
    VolumeMenu(),
  ]
}