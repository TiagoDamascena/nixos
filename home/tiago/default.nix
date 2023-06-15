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

  home.file.wallpapers = {
    source = ./wallpapers;
    target = "Images/wallpapers";
    recursive = true;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
