{ osConfig, ... }:

{
  wayland.windowManager.hyprland.settings.monitor = osConfig.settings.hyprland.monitors;
}