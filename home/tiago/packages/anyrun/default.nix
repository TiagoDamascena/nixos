{
  pkgs,
  lib,
  osConfig,
  anyrun-module,
  ...
}:

{
  imports = [ anyrun-module ];

  programs.anyrun = {
    enable = true;
  };
}