{ pkgs, ... }:

{
  imports = [
    ./zsh
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (callPackage (import ./segoe-fluent-icons-font/default.nix) {})
  ];
}
