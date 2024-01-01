import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import GLib from 'gi://GLib';

export default () => Widget.Label({
  class_name: 'clock',
  connections: [
    [1000, widget => widget.label = GLib.DateTime.new_now_local().format('%A, %d de %B %H:%M')]
  ]
});
