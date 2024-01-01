import Gdk from 'gi://Gdk';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { exec } from 'resource:///com/github/Aylur/ags/utils.js'
import { PopupWindow } from '../common/window.js';

const display = Gdk.Display.get_default();

const MenuOption = ({
  icon,
  text,
  shortcut = '',
  action,
}) => Widget.Button({
  class_name: 'option',
  onPrimaryClick: action,
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
        label: icon
      }),
      Widget.Label({
        class_name: 'label',
        label: text,
        hexpand: true,
        xalign: 0,
      }),
      Widget.Label({
        class_name: 'shortcut',
        label: shortcut,
      }),
    ],
  }),
});

const PowerMenu = () => Widget.Box({
  vertical: true,
  children: [
    MenuOption({
      icon: '',
      text: 'Lock screen',
      shortcut: '󰘳 󰘶 L',
      action: () => {
        App.closeWindow('power-menu');
        exec('waylock -fork-on-lock');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Logout',
      shortcut: '󰘳 󰘶 Q',
      action: () => {
        App.closeWindow('power-menu');
        exec('bash -c "loginctl kill-session $XDG_SESSION_ID"');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Sleep',
      shortcut: '󰘳 󰘶 S',
      action: () => {
        App.closeWindow('power-menu');
        exec('systemctl suspend');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Restart',
      action: () => {
        App.closeWindow('power-menu');
        exec('systemctl reboot');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Shutdown',
      action: () => {
        App.closeWindow('power-menu');
        exec('systemctl poweroff');
      },
    }),
  ],
});

export default () => PopupWindow({
  name: 'power-menu',
  anchor: ['top', 'right'],
  margins: [0, 10, 0, 0],
  child: PowerMenu(),
});