{ pkgs, ... }:

{
  imports = [
    ./dbeaver
    ./git
    ./gnome
    ./hyprland
    ./kanshi
    ./vscode
    ./zsh
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (callPackage (import ./segoe-fluent-icons-font/default.nix) {})
  ];
}
