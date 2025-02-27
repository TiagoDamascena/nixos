{ pkgs, ... }:

{
  imports = [
    ./ags
    ./anyrun
    ./dbeaver
    ./git
    ./gnome
    ./hyprland
    ./kanshi
    ./obsidian
    ./slack
    ./vscode
    ./zsh
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (callPackage (import ./segoe-fluent-icons-font/default.nix) {})
  ];
}
