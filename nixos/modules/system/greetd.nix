{ lib, pkgs, ... }:

{
  services.greetd.enable = true;

  systemd.services.greetd.serviceConfig.Type = lib.mkForce "simple";

  programs.struntuz-greet = {
    enable = true;
    greeterOutput = "journal";
    publishAssets = true;
    cursorPackage = pkgs.bibata-cursors;

    settings = {
      sessionOutput = "journal";
      defaultSession = "hyprland-uwsm";
      language = "pt-BR";
      hideSessionSelector = true;

      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
      };
    };
  };
}
