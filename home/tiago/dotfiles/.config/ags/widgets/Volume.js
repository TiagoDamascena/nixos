import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import AudioService from 'resource:///com/github/Aylur/ags/service/audio.js';

const display = Gdk.Display.get_default();

const Volume = () => Widget.Box({
  child: Widget.EventBox({
    onPrimaryClick: () => {
      App.toggleWindow('volume-menu');
    },
    onHover: box => {
      box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
    },
    onHoverLost: box => {
      box.window.set_cursor(null);
    },
    child: Widget.Overlay({
      child: Widget.Label({
        class_names: ['icon', 'overlay', 'volume-label'],
        justification: 'center',
        label: '',
      }),
      overlays: [
        Widget.Label({
          class_names: ['icon', 'volume-label'],
          connections: [[AudioService, Widget => {
            if (!AudioService.speaker) return;

            const icons = [
              { threshold: 0, icon: '' },
              { threshold: 25, icon: '' },
              { threshold: 50, icon: '' },
              { threshold: 75, icon: '' },
              { threshold: 100, icon: '' },
            ];

            const volume = AudioService.speaker.stream.isMuted ? 0 : AudioService.speaker.volume * 100;
            Widget.label = icons.find(icon => volume <= icon.threshold).icon;
          }]],
        }),
      ]
    }),
  }),
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'volume'],
  child: Volume(),
  connections: [
    [AudioService, Widget => {
      Widget.visible = !!AudioService.speaker;

      if (!AudioService.speaker) return;

      Widget.toggleClassName('muted', AudioService.speaker.stream.isMuted || AudioService.speaker.volume === 0);
    }]
  ]
});