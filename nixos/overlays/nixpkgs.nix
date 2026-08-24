{ pkgs, zen-browser, vscode-extensions, llm-agents, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    })
    vscode-extensions.overlays.default
    llm-agents.overlays.shared-nixpkgs
  ];
}
