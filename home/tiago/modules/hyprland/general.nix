{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "alacritty";
    "$fileManager" = "nautilus";
    "$menu" = "vicinae toggle";
    "$run" = "vicinae toggle";

    general = {
      resize_on_border = false;
      allow_tearing = false;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
    ];
  };
}