{
  pkgs,
  osConfig,
  ...
}:

{
  home.packages = with pkgs; [
    kanshi
  ];

  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    systemdTarget = "graphical-session.target";

    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
          }
        ];
        profile.exec = [
          "systemctl --user restart hyprpaper.service"
          "systemctl --user restart ags.service"
        ];
      }
      {
        profile.name = "home";
        profile.outputs = [
          {
            criteria = "LG Electronics 25UM58G 0x01010101";
            position = "1920,0";
            mode = "2560x1080@60Hz";
          }
          {
            criteria = "eDP-1";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
        ];
        profile.exec = [
          "systemctl --user restart hyprpaper.service"
          "systemctl --user restart ags.service"
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
          "systemctl --user restart hyprpaper.service"
          "systemctl --user restart ags.service"
        ];
      }
    ];
  };
}
