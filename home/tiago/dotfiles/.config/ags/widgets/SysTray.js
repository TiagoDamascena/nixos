import Gdk from 'gi://Gdk';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';

const display = Gdk.Display.get_default();

const SysTrayItem = item => Widget.Box({
  class_name: 'system-tray-item',
  child: Widget.Button({
    child: Widget.Icon({
      size: 20,
      binds: [['icon', item, 'icon']]
    }),
    binds: [['tooltip-markup', item, 'tooltip-markup']],
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
    onHover: button => {
      button.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    },
    onHoverLost: button => {
      button.window.set_cursor(null);
    },
  }),
});

export default () => Widget.Box({
  class_name: 'system-tray',
  spacing: 10,
  binds: [['children', SystemTray, 'items', i => i.map(SysTrayItem)]],
});
