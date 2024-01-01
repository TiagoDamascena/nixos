import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';

const SysTrayItem = item => Widget.Button({
  class_name: 'system-tray-item',
  child: Widget.Icon({
    size: 20,
    binds: [['icon', item, 'icon']]
  }),
  binds: [['tooltip-markup', item, 'tooltip-markup']],
  onPrimaryClick: (_, event) => item.activate(event),
  onSecondaryClick: (_, event) => item.openMenu(event),
});

export default () => Widget.Box({
  class_name: 'system-tray',
  binds: [['children', SystemTray, 'items', i => i.map(SysTrayItem)]],
});
