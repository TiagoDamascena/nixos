{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "25.11";
}
