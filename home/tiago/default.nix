{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles
    ./packages
  ];

  home = {
    username = "tiago";
    homeDirectory = "/home/tiago";

    sessionVariables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    music = null;
    publicShare = null;
    templates = null;
  };

  home.file.wallpapers = {
    source = ./wallpapers;
    target = "Pictures/Wallpapers";
    recursive = true;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
