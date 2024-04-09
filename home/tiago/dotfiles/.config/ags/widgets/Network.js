import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import NetworkService from 'resource:///com/github/Aylur/ags/service/network.js';

const active = Variable(false);

const Wired = () => Widget.Box({
  child: Widget.Label({
    label: '',
    class_names: ['icon', 'network-label'],
    justification: 'center',
  }).hook(NetworkService, Widget => {
    Widget.toggleClassName('disconnected', NetworkService.wired.internet === 'disconnected');
  }),
});

const Wifi = () => Widget.EventBox({
  onHover: () => {
    active.value = true;
  },
  onHoverLost: () => {
    active.value = false;
  },
  child: Widget.Box({
    spacing: active.bind().transform(v => v ? 10 : 0),
    children: [
      Widget.Overlay({
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
          }).hook(NetworkService, Widget => {
            const icons = [
              { threshold: 0, icon: ''},
              { threshold: 25, icon: ''},
              { threshold: 50, icon: ''},
              { threshold: 75, icon: ''},
              { threshold: 100, icon: ''},
            ];

            const strength = NetworkService.wifi.internet === 'connected' ? NetworkService.wifi.strength : 0;
            Widget.label = icons.find(icon => strength <= icon.threshold).icon;
          }),
        ],
      }),
      Widget.Revealer({
        reveal_child: active.bind(),
        transition: 'slide_right',
        transition_duration: 200,
        child: Widget.Label({
          label: 'No connection',
        }).hook(NetworkService, Widget => {
          if (NetworkService.wifi.state === 'disconnected' || NetworkService.wifi.state === 'unavailable') {
            Widget.Label = 'No connection';
          } else {
            Widget.label = NetworkService.wifi.ssid;
          }
        }),
      }),
    ],
  }),
}).hook(active, Widget => {
  Widget.parent.toggleClassName('active', active.value);
});

const Network = () => Widget.Box();

export default () => Widget.Box({
  class_names: ['bar-icon', 'network'],
  child: Network(),
}).hook(NetworkService, Widget => {
  if (NetworkService.primary === 'wifi' || (!NetworkService.primary && NetworkService.wifi)) {
    Widget.child = Wifi();
  } else {
    Widget.child = Wired();
  }
});