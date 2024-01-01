{ pkgs, ... }:

{
  imports = [
    ./ags
    ./dbeaver
    ./git
    ./gnome
    ./hyprland
    ./kanshi
    ./obsidian
    ./vscode
    ./zsh
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (callPackage (import ./segoe-fluent-icons-font/default.nix) {})
  ];
}
