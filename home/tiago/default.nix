{ pkgs, ... }:

{
  imports = [
    ./assets
    ./modules
  ];

  home = {
    username = "tiago";
    homeDirectory = "/home/tiago";

    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    packages = with pkgs; [
      nautilus
    ];

    stateVersion = "25.11";
  };
}
