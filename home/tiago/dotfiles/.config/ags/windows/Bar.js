import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Clock from '../widgets/Clock.js';
import Workspaces from '../widgets/Workspaces.js';
import SysTray from '../widgets/SysTray.js';
import Volume from '../widgets/Volume.js';
import Battery from '../widgets/Battery.js';
import Power from '../widgets/Power.js';
import Network from '../widgets/Network.js';
import Notifications from '../widgets/Notifications.js';

const Start = () => Widget.Box({
  children: [
    Workspaces(),
  ],
});

const Center = () => Widget.Box({
  children: [
    Clock(),
  ],
});

const End = () => Widget.Box({
  hpack: 'end',
  children: [
    SysTray(),
    Notifications(),
    Volume(),
    Network(),
    Battery(),
    Power(),
  ],
});

const Bar = () => Widget.Box({
  class_name: 'panel',
  child: Widget.CenterBox({
    hexpand: true,
    start_widget: Start(),
    center_widget: Center(),
    end_widget: End(),
  }),
});

export default monitor => Widget.Window({
  name: `bar-${monitor}`,
  class_name: 'bar',
  exclusivity: 'exclusive',
  monitor: monitor,
  anchor: ['top', 'left', 'right'],
  margins: [10, 10, 0],
  child: Bar(),
});