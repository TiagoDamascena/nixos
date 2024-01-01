import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import AudioService from 'resource:///com/github/Aylur/ags/service/audio.js';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js'
import { PopupWindow } from "../common/window.js";

const display = Gdk.Display.get_default();

const SpeakerItem = speaker => Widget.Button({
  class_name: 'audio-device speaker',
  hexpand: true,
  onClicked: () => {
    AudioService.speaker = speaker;
  },
  onHover: button => {
    button.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
  },
  onHoverLost: button => {
    button.window.set_cursor(null);
  },
  child: Widget.Box({
      spacing: 10,
      children: [
          Widget.Label({
            class_name: 'icon',
            justification: 'center',
            label: '',
          }),
          Widget.Label({
            class_name: 'label',
            label: (speaker.description || '').split(' ').slice(0, 4).join(' ')
          }),
      ],
  }),
  connections: [[AudioService, btn => {
    btn.toggleClassName('active', AudioService.speaker.id === speaker.id);
  }, `speaker-changed`]],
});

const MicrophoneItem = microphone => Widget.Button({
  class_name: 'audio-device microphone',
  hexpand: true,
  onClicked: () => {
    AudioService.microphone = microphone;
  },
  onHover: button => {
    button.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
  },
  onHoverLost: button => {
    button.window.set_cursor(null);
  },
  child: Widget.Box({
      spacing: 10,
      children: [
          Widget.Label({
            class_name: 'icon',
            justification: 'center',
            label: '',
          }),
          Widget.Label({
            class_name: 'label',
            label: (microphone.description || '').split(' ').slice(0, 4).join(' ')
          }),
      ],
  }),
  connections: [[AudioService, btn => {
    btn.toggleClassName('active', AudioService.microphone.id === microphone.id);
  }, `microphone-changed`]],
});

const VolumeMenu = () => Widget.Box({
  vertical: true,
  spacing: 15,
  children: [
    Widget.Box({
      vertical: true,
      hexpand: true,
      spacing: 15,
      children: [
        Widget.Label({
          class_name: 'title',
          xalign: 0,
          label: 'Audio'
        }),
        Widget.Slider({
          class_name: 'slider',
          min: 0,
          max: 1,
          drawValue: false,
          onChange: ({ value }) => AudioService.speaker.volume = value,
          connections: [[AudioService, slider => {
              slider.value = AudioService.speaker.volume;
          }, `speaker-changed`]],
        }),
      ],
    }),
    Widget.Box({
      vertical: true,
      hexpand: true,
      spacing: 5,
      children: [
        Widget.Label({
          class_name: 'title',
          xalign: 0,
          label: 'Output'
        }),
        Widget.Box({
          vertical: true,
          hexpand: true,
          spacing: 5,
          binds: [['children', AudioService, 'speakers', s => s.map(SpeakerItem)]],
        })
      ],
    }),
    Widget.Box({
      vertical: true,
      hexpand: true,
      spacing: 5,
      children: [
        Widget.Label({
          class_name: 'title',
          xalign: 0,
          label: 'Input'
        }),
        Widget.Box({
          vertical: true,
          hexpand: true,
          spacing: 5,
          binds: [['children', AudioService, 'microphones', m => m.map(MicrophoneItem)]],
        })
      ],
    }),
    Widget.Box({
      hexpand: true,
      children: [
        Widget.EventBox({
          onPrimaryClick: () => {
            execAsync('pavucontrol');
            App.toggleWindow('volume-menu');
          },
          onHover: box => {
            box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
          },
          onHoverLost: box => {
            box.window.set_cursor(null);
          },
          child: Widget.Label({
            class_name: 'more',
            xalign: 0,
            label: 'More options',
          }),
        }),
      ],
    }),
  ],
});

export default () => PopupWindow({
  name: 'volume-menu',
  anchor: ['top', 'right'],
  margins: [0, 10, 0, 0],
  child: VolumeMenu(),
});