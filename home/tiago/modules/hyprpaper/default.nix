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
          path = "${config.home.homeDirectory}/.wallpapers/waves.jpg";
          fit_mode = "cover";
        }
      ];
    };
  };
}