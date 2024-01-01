import Gdk from 'gi://Gdk';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import NotificationService from 'resource:///com/github/Aylur/ags/service/notifications.js';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js'

const display = Gdk.Display.get_default();

const Notifications = () => Widget.Box({
  child: Widget.EventBox({
    onPrimaryClick: () => {
      execAsync('swaync-client -t -sw');
    },
    onHover: box => {
      box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    },
    onHoverLost: box => {
      box.window.set_cursor(null);
    },
    child: Widget.Label({
      class_names: ['icon', 'notifications-label'],

      justification: 'center',
      binds: [['label', NotificationService, 'dnd', dnd => dnd ? '' : '']]
    }),
  }),
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'notifications'],
  child: Notifications(),
});