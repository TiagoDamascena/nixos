import Widget from 'resource:///com/github/Aylur/ags/widget.js';

export default () => Widget.Box({
  class_names: ['bar-divider'],
  child: Widget.Box({
    class_names: ['bar-divider-line'],
  }),
});