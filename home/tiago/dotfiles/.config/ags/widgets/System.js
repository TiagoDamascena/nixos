import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';

const display = Gdk.Display.get_default();

const System = () => Widget.EventBox({
  onPrimaryClick: () => {
    App.toggleWindow('system-menu');
  },
  onHover: box => {
    box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    box.parent.toggleClassName('active', true);
  },
  onHoverLost: box => {
    box.window.set_cursor(null);
    box.parent.toggleClassName('active', false);
  },
  child: Widget.Icon({
    icon: App.configDir + '/assets/img/nixos.svg',
    class_names: ['icon', 'system-label'],
  })
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'system'],
  child: System(),
});