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
          "eww open bar0"
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
          "eww open bar0"
          "eww open bar1"
        ];
      };
    };
  };
}
