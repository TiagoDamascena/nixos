import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import NetworkService from 'resource:///com/github/Aylur/ags/service/network.js';

const Wired = () => Widget.Label({
  label: '',
  class_names: ['icon', 'network-label'],
  justification: 'center',
});

const Wifi = () => Widget.Overlay({
  child: Widget.Label({
    class_names: ['icon', 'overlay', 'network-label'],
    justification: 'center',
    label: '',
  }),
  overlays: [
    Widget.Label({
      class_names: ['icon', 'network-label'],
      justification: 'center',
      label: '',
      connections: [
        [NetworkService, Widget => {
          const icons = [
            { threshold: 0, icon: ''},
            { threshold: 25, icon: ''},
            { threshold: 50, icon: ''},
            { threshold: 75, icon: ''},
            { threshold: 100, icon: ''},
          ];

          const strength = NetworkService.wifi.internet === 'connected' ? NetworkService.wifi.strength : 0;
          Widget.label = icons.find(icon => strength <= icon.threshold).icon;
        }]
      ],
    }),
  ],
});

const Network = () => Widget.Box({
  binds: [
    ['children', NetworkService, 'primary', primary => primary === 'wifi' ? [Wifi()] : [Wired()]],
  ],
});

export default () => Widget.Box({
  class_names: ['bar-icon', 'network'],
  child: Network(),
});