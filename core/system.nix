{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    alacritty
    wofi
    nixfmt
  ];

  system.stateVersion = "25.11";
}
