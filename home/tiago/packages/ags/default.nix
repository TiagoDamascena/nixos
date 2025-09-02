{
  pkgs,
  lib,
  osConfig,
  ...
}:

{
  systemd.user.services.ags = {
    Install.WantedBy = [ "graphical-session.target" ];

    Service = {
      ExecStart = "${pkgs.ags_1}/bin/ags";
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