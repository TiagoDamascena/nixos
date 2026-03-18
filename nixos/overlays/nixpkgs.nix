{ pkgs, zen-browser, vscode-extensions, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    })
    vscode-extensions.overlays.default
  ];
}
