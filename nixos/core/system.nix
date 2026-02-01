{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    neofetch
    vim
    zip
    unzip
  ];

  system.stateVersion = "25.11";
}
