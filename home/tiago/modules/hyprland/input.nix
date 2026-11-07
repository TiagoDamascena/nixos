{ osConfig, ... }:

{
  wayland.windowManager.hyprland.settings.config.input = {
    kb_layout = osConfig.settings.keyboard.layout;
    kb_variant = osConfig.settings.keyboard.variant;

    touchpad = {
      natural_scroll = true;
    };
  };
}
