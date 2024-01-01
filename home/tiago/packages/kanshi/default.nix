{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kanshi
  ];

  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    systemdTarget = "";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
          }
        ];
        exec = [
          "hyprpaper"
        ];
      };
      docked = {
        outputs = [
          {
            criteria = "eDP-1";
          }
          {
            criteria = "HDMI-A-1";
          }
        ];
        exec = [
          "hyprpaper"
        ];
      };
    };
  };
}
