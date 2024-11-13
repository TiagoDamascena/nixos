import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';

export const PopupWindow = ({
  name,
  child,
  visible = false,
  ...rest
}) => Widget.Window({
  name: name,
  class_names: ['popup-window', name],
  keymode: 'on-demand',
  visible: visible,
  child: Widget.Box({
    class_name: 'container',
    child: Widget.Revealer({
      transition: 'slide_down',
      child: child
    }).hook(App, (Widget, wname, visible) => {
      if (wname === name) Widget.reveal_child = visible;
    }),
  }),
  ...rest
}).keybind("Escape", () => App.closeWindow(name));
