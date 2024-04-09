import Widget from 'resource:///com/github/Aylur/ags/widget.js';

const Corner = place => Widget.Box({
  class_name: `corner ${place}`,
});

const places = ['top-left', 'top-right', 'bottom-left', 'bottom-right'];

export default monitor => places.map(place => Widget.Window({
  name: `corner-${place}-${monitor}`,
  exclusivity: 'ignore',
  layer: 'overlay',
  monitor,
  class_name: 'corner',
  anchor: [place.includes('top') ? 'top' : 'bottom', place.includes('right') ? 'right' : 'left'],
  child: Corner(place),
}));