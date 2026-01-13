{ config, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      splash = false;

      wallpaper = [
        {
          monitor = "";
          path = "${config.home.homeDirectory}/.config/wallpaper";
          fit_mode = "cover";
        }
      ];
    };
  };
}