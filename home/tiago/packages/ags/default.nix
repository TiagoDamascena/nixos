{
  pkgs,
  lib,
  osConfig,
  ags-module,
  ...
}:

{
  imports = [ ags-module ];

  programs.ags = {
    enable = true;
    configDir = ../../dotfiles/.config/ags;

    extraPackages = [ ];
  };
}