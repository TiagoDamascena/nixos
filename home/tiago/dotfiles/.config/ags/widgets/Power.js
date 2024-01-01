import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';

const display = Gdk.Display.get_default();

const Power = () => Widget.Box({
  child: Widget.EventBox({
    onPrimaryClick: () => {
      App.toggleWindow('power-menu');
    },
    onHover: box => {
      box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    },
    onHoverLost: box => {
      box.window.set_cursor(null);
    },
    child: Widget.Label({
      label: '',
      class_names: ['icon', 'power-label'],
      justification: 'center',
    })
  }),
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'power'],
  child: Power(),
});