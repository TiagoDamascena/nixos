{ config, pkgs, ... }:

{
  home.username = "tiago";
  home.homeDirectory = "/home/tiago";

  programs.git = {
    enable = true;
    userName = "Tiago Damascena";
    userEmail = "tiagobdamascena@gmail.com";
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
