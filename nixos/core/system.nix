{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    fastfetch
    vim
    zip
    unzip
  ];

  system.stateVersion = "25.11";
}
