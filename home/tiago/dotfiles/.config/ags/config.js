import App from 'resource:///com/github/Aylur/ags/app.js';
import { forMonitors } from './common/utils.js';
import Bar from "./windows/Bar.js";
import PowerMenu from './windows/SystemMenu.js';
import VolumeMenu from './windows/VolumeMenu.js';
import Corners from './windows/Corners.js';

const windows = () => [
  forMonitors(Corners),
  forMonitors(Bar),
  PowerMenu(),
  VolumeMenu()
];

App.config(
  {
    style: App.configDir + '/style.css',
    windows: windows().flat(1)
  }
)