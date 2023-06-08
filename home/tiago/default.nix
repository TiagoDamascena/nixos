{ config, pkgs, ... }:

{
  home.username = "tiago";
  home.homeDirectory = "/home/tiago";

  imports = [
    ./dotfiles
    ./packages
  ];

  programs.git = {
    enable = true;
    userName = "Tiago Damascena";
    userEmail = "tiagobdamascena@gmail.com";
  };

  home.file.wallpapers = {
    source = ./wallpapers;
    target = "Images/wallpapers";
    recursive = true;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
