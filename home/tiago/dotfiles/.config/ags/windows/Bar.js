import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Clock from '../widgets/Clock.js';
import Workspaces from '../widgets/Workspaces.js';
import SysTray from '../widgets/SysTray.js';
import Volume from '../widgets/Volume.js';
import Battery from '../widgets/Battery.js';
import System from '../widgets/System.js';
import Network from '../widgets/Network.js';
import Notifications from '../widgets/Notifications.js';
import BarDivider from '../widgets/BarDivider.js';

const Start = (monitor) => Widget.Box({
  spacing: 10,
  children: [
    System(),
    BarDivider(),
    Workspaces(monitor),
  ],
});

const Center = (monitor) => Widget.Box({
  children: [
    Clock(),
  ],
});

const End = (monitor) => Widget.Box({
  hpack: 'end',
  spacing: 10,
  children: [
    SysTray(),
    Volume(),
    Network(),
    Battery(),
    Notifications(),
  ],
});

const Bar = (monitor) => Widget.Box({
  class_name: 'panel',
  child: Widget.CenterBox({
    hexpand: true,
    start_widget: Start(monitor),
    center_widget: Center(monitor),
    end_widget: End(monitor),
  }),
});

export default monitor => Widget.Window({
  name: `bar-${monitor}`,
  class_name: 'bar',
  exclusivity: 'exclusive',
  layer: 'top',
  monitor: monitor,
  anchor: ['top', 'left', 'right'],
  margins: [10, 10, 0],
  child: Bar(monitor),
});