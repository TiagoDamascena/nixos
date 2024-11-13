import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import AudioService from 'resource:///com/github/Aylur/ags/service/audio.js';

const display = Gdk.Display.get_default();
const active = Variable(false);

const Volume = () => Widget.EventBox({
  onPrimaryClick: () => {
    App.toggleWindow('volume-menu');
  },
  onHover: () => {
    active.value = true;
  },
  onHoverLost: () => {
    active.value = false;
  },
  child: Widget.Box({
    spacing: active.bind().transform(v => v ? 10 : 0),
    children: [
      Widget.Overlay({
        child: Widget.Label({
          class_names: ['icon', 'overlay', 'volume-label'],
          justification: 'center',
          label: '',
        }),
        overlays: [
          Widget.Label({
            class_names: ['icon', 'volume-label'],
          }).hook(AudioService, Widget => {
            if (!AudioService.speaker) return;

            const icons = [
              { threshold: 0, icon: '' },
              { threshold: 25, icon: '' },
              { threshold: 50, icon: '' },
              { threshold: 75, icon: '' },
              { threshold: 100, icon: '' },
            ];

            const volume = AudioService.speaker.stream && !AudioService.speaker.stream.isMuted ? AudioService.speaker.volume * 100 : 0;
            Widget.label = icons.find(icon => volume <= icon.threshold).icon;
          }),
        ]
      }),
      Widget.Revealer({
        reveal_child: active.bind(),
        transition: 'slide_right',
        transition_duration: 200,
        child: Widget.Label().hook(AudioService, Widget => {
          Widget.label = `${parseInt(AudioService?.speaker?.volume * 100)}%`;
        }),
      }),
    ],
  }),
}).hook(active, Widget => {
  Widget.parent.toggleClassName('active', active.value);
  Widget.window.set_cursor(active.value ? Gdk.Cursor.new_from_name(display, 'pointer') : null);
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'volume'],
  child: Volume(),
}).hook(AudioService, Widget => {
  Widget.visible = !!AudioService.speaker;

  if (!AudioService.speaker) return;

  Widget.toggleClassName('muted', AudioService?.speaker?.stream?.isMuted || AudioService?.speaker?.volume === 0);
});