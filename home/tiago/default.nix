{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles
    ./packages
  ];

  home = {
    username = "tiago";
    homeDirectory = "/home/tiago";
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
