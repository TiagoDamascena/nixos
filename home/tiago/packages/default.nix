{ pkgs, ... }:

{
  imports = [
    ./ags
    ./anyrun
    ./bat
    ./dbeaver
    ./eza
    ./fd
    ./fzf
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
