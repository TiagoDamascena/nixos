{ pkgs, zen-browser, buzz, vscode-extensions, llm-agents, ... }:

{
  nixpkgs.overlays = [
    vscode-extensions.overlays.default
    llm-agents.overlays.shared-nixpkgs
    (final: prev: {
      zen-browser = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
      buzz-desktop = buzz.packages.${pkgs.stdenv.hostPlatform.system}.buzz-desktop;
      claude-desktop = final.symlinkJoin {
        name = "claude-desktop";
        paths = [ final.llm-agents.claude-desktop.unwrapped ];
        nativeBuildInputs = [ final.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/claude-desktop --add-flags "--password-store=gnome-libsecret"
        '';
      };
    })
  ];
}
