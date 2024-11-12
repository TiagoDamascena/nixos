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
  onClicked: action,
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

const SystemMenu = () => Widget.Box({
  vertical: true,
  children: [
    MenuOption({
      icon: '',
      text: 'Applications',
      action: () => {() => {}},
    }),
    MenuOption({
      icon: '',
      text: 'Sobre',
      action: () => {() => {}},
    }),
    MenuOption({
      icon: '',
      text: 'Lock screen',
      shortcut: '󰘳 󰘶 L',
      action: () => {
        App.closeWindow('system-menu');
        exec('loginctl lock-session');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Logout',
      shortcut: '󰘳 󰘶 Q',
      action: () => {
        App.closeWindow('system-menu');
        exec('systemctl --user stop "wayland-session@*.target"');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Sleep',
      shortcut: '󰘳 󰘶 S',
      action: () => {
        App.closeWindow('system-menu');
        exec('systemctl suspend');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Restart',
      action: () => {
        App.closeWindow('system-menu');
        exec('systemctl reboot');
      },
    }),
    MenuOption({
      icon: '',
      text: 'Shutdown',
      action: () => {
        App.closeWindow('system-menu');
        exec('systemctl poweroff');
      },
    }),
  ],
});

export default () => PopupWindow({
  name: 'system-menu',
  anchor: ['top', 'left'],
  margins: [0, 0, 0, 10],
  child: SystemMenu(),
});