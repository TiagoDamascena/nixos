{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kanshi
  ];

  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    systemdTarget = "";

    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
          }
        ];
        profile.exec = [
          "hyprpaper"
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
          }
          {
            criteria = "HDMI-A-1";
          }
        ];
        profile.exec = [
          "hyprpaper"
        ];
      }
    ];
  };
}
