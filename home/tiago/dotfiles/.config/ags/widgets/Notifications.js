import Gdk from 'gi://Gdk';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import NotificationService from 'resource:///com/github/Aylur/ags/service/notifications.js';
import { exec } from 'resource:///com/github/Aylur/ags/utils.js'

const display = Gdk.Display.get_default();

const Notifications = () => Widget.Button({
  onClicked: () => {
    exec('swaync-client -op -sw');
  },
  onHover: box => {
    box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    box.parent.toggleClassName('active', true);
  },
  onHoverLost: box => {
    box.window.set_cursor(null);
    box.parent.toggleClassName('active', false);
  },
  child: Widget.Label({
    class_names: ['icon', 'notifications-label'],
    justification: 'center',
  }).bind(
    'label',
    NotificationService,
    'dnd',
    dnd => dnd ? '' : ''
  ),
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'notifications'],
  child: Notifications(),
});