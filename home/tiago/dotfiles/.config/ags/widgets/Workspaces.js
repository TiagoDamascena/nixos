import Gdk from 'gi://Gdk';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js'
import { range } from '../common/utils.js';

const workspaces = 9;
const dispatch = id => () => execAsync(`try_swap_workspace ${id}`);

const display = Gdk.Display.get_default();

const Workspace = (monitor, id) => Widget.EventBox({
  setup: box => box.id = id,
  child: Widget.Button({
    class_name: 'workspace',
    onClicked: dispatch(id),
    child: Widget.Label({
      label: `${id}`,
      class_name: 'indicator',
      vpack: 'center',
    }),
  }).hook(Hyprland, btn => {
    btn.toggleClassName('active', Hyprland.monitors.find(m => m.id === monitor)?.activeWorkspace?.id === id);
    btn.toggleClassName('occupied', Hyprland.getWorkspace(id)?.windows > 0);
  }),
  onHover: box => {
    box.window.set_cursor(Gdk.Cursor.new_from_name(display, 'pointer'));
  },
  onHoverLost: box => {
    box.window.set_cursor(null);
  },
});

const Workspaces = (monitor) => Widget.Box({
  children: range(workspaces).map(i => Workspace(monitor, i)),
});

export default (monitor) => Widget.Box({
  class_name: 'workspaces',
  child: Workspaces(monitor),
});