{
  pkgs,
  lib,
  osConfig,
  ags-module,
  ...
}:

{
  imports = [ ags-module ];

  programs.ags = {
    enable = true;
    configDir = ../../dotfiles/.config/ags;
  };

  systemd.user.services.ags = {
    Install.WantedBy = [ "graphical-session.target" ];

    Service = {
      ExecStart = "${pkgs.ags}/bin/ags";
      Restart = "on-failure";
    };

    Unit = {
      Description = "AGS - A library built for GJS to allow defining GTK widgets in a declarative way.";
      Documentation = "https://github.com/Aylur/ags";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
  };
}