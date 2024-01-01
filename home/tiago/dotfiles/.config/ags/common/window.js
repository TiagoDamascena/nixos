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
  popup: true,
  focusable: true,
  visible: visible,
  child: Widget.Box({
    class_name: 'container',
    child: Widget.Revealer({
      transition: 'slide_down',
      connections: [
        [App, (Widget, wname, visible) => {
          if (wname === name) Widget.reveal_child = visible;
        }]
      ],
      child: child
    }),
  }),
  ...rest
});
