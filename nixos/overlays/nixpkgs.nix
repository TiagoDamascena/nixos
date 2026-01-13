{ pkgs, zen-browser, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    })
  ];
}
