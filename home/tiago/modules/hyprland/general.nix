{
  wayland.windowManager.hyprland.settings = {
    # Rendered as Lua locals (`local mainMod = "SUPER"`), usable from binds.
    mainMod._var = "SUPER";
    terminal._var = "alacritty";
    fileManager._var = "nautilus";
    menu._var = "vicinae toggle";
    history._var = "vicinae vicinae://extensions/vicinae/clipboard/history";

    config = {
      general = {
        resize_on_border = false;
        allow_tearing = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        focus_on_activate = true;
      };
    };

    env = [
      { _args = [ "XDG_CURRENT_DESKTOP" "Hyprland" ]; }
      { _args = [ "XDG_SESSION_TYPE" "wayland" ]; }
      { _args = [ "XDG_SESSION_DESKTOP" "Hyprland" ]; }
    ];
  };
}
