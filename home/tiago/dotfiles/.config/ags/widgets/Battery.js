import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import BatteryService from 'resource:///com/github/Aylur/ags/service/battery.js';

const active = Variable(false);

const Battery = () => Widget.EventBox({
  onHover: () => {
    active.value = true;
  },
  onHoverLost: () => {
    active.value = false;
  },
  child: Widget.Box({
    spacing: active.bind().transform(v => v ? 10 : 0),
    children: [
      Widget.Label({
        class_names: ['icon', 'battery-label'],
        justification: 'center',
        label: '',
      }).hook(BatteryService, Widget => {
        if (!BatteryService.available) return;

        const batteryIcons = ['', '', '', '', '', '', '', '', '', '', ''];
        const batteryIconsAc = ['', '', '', '', '', '', '', '', '', '', ''];

        const connected = BatteryService.changing || BatteryService.charged;
        const index = Math.floor(BatteryService.percent / 10);

        Widget.label = connected ? batteryIconsAc[index] : batteryIcons[index];
      }),
      Widget.Revealer({
        reveal_child: active.bind(),
        transition: 'slide_right',
        transition_duration: 200,
        child: Widget.Label().hook(BatteryService, Widget => {
          Widget.label = `${BatteryService.percent}%`;
        }),
      }),
    ]
  })
}).hook(active, Widget => {
  Widget.parent.toggleClassName('active', active.value);
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'battery'],
  child: Battery(),
}).hook(BatteryService, Widget => {
  Widget.visible = BatteryService.available;
});