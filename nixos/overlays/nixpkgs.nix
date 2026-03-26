{ pkgs, zen-browser, vscode-extensions, claude-desktop, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    })
    vscode-extensions.overlays.default
    claude-desktop.overlays.default
  ];
}
