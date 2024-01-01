import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import BatteryService from 'resource:///com/github/Aylur/ags/service/battery.js';

const Battery = () => Widget.Box({
  child: Widget.Label({
    class_names: ['icon', 'battery-label'],
    justification: 'center',
    label: '',
    connections: [
      [BatteryService, Widget => {
        if (!BatteryService.available) return;

        const batteryIcons = ['', '', '', '', '', '', '', '', '', '', ''];
        const batteryIconsAc = ['', '', '', '', '', '', '', '', '', '', ''];

        const connected = BatteryService.changing || BatteryService.charged;
        const index = Math.floor(BatteryService.percent / 10);

        Widget.label = connected ? batteryIconsAc[index] : batteryIcons[index];
      }]
    ]
  })
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'battery'],
  child: Battery(),
  connections: [
    [BatteryService, Widget => {
      Widget.visible = BatteryService.available;
    }]
  ]
});