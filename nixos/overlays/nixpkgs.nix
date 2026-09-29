{ pkgs, zen-browser, buzz, vscode-extensions, llm-agents, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
      buzz-desktop = buzz.packages.${pkgs.stdenv.hostPlatform.system}.buzz-desktop;
    })
    vscode-extensions.overlays.default
    llm-agents.overlays.shared-nixpkgs
  ];
}
