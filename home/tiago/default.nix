{ config, pkgs, ... }:

{
  home.username = "tiago";
  home.homeDirectory = "/home/tiago";

  imports = [
    ./packages/zsh
  ];

  programs.git = {
    enable = true;
    userName = "Tiago Damascena";
    userEmail = "tiagobdamascena@gmail.com";
  };

  home.file = builtins.mapAttrs (name: path: {
    source = ./dotfiles/${name};
    target = name;
    recursive = true;
  }) (builtins.readDir ./dotfiles);

  home.file.wallpapers = {
    source = ./wallpapers;
    target = "Images/wallpapers";
    recursive = true;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
