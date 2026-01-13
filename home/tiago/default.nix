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
      rubik
      nerd-fonts.jetbrains-mono
      nixfmt
      nautilus
      zen-browser
    ];

    stateVersion = "25.11";
  };
}
