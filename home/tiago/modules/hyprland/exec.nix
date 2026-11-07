{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            hl.exec_cmd("uwsm-app -- gnome-keyring-daemon -sd")
          end'')
      ];
    }
  ];
}
