{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles
    ./packages
  ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.11";

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

    file.wallpapers = {
      source = ./wallpapers;
      target = "Pictures/Wallpapers";
      recursive = true;
    };
  };

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      music = null;
      publicShare = null;
      templates = null;
    };
  };
}
