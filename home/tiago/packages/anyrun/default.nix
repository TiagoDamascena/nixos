{
  pkgs,
  lib,
  osConfig,
  ...
}:

{
  programs.anyrun = {
    enable = true;
    package = pkgs.anyrun;
  };
}