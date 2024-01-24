import Gdk from 'gi://Gdk';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import BarDivider from './BarDivider.js';

const display = Gdk.Display.get_default();

const SysTrayItem = item => Widget.Box({
  class_name: 'system-tray-item',
  child: Widget.Button({
    child: Widget.Icon({
      size: 20,
    }).bind('icon', item, 'icon'),
    onPrimaryClick: (_, event) => item.openMenu(event),
    onClicked: (_, event) => item.openMenu(event),
    onHover: button => {
      button.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    },
    onHoverLost: button => {
      button.window.set_cursor(null);
    },
  }).bind('tooltip-markup', item, 'tooltip-markup'),
});

export default () => Widget.Box({
  class_name: 'system-tray',
  spacing: 10,
}).bind('children', SystemTray, 'items', i => {
  const items = i.map(SysTrayItem);

  if (items.length > 0) {
    items.push(BarDivider());
  }

  return items;
});
