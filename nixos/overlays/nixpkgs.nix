{ pkgs, vscode-extensions, llm-agents, plane, ... }:

{
  nixpkgs.overlays = [
    vscode-extensions.overlays.default
    llm-agents.overlays.shared-nixpkgs
    plane.overlays.default
    (final: prev: {
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
