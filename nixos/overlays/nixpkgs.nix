{ pkgs, vscode-extensions, llm-agents, ... }:

{
  nixpkgs.overlays = [
    vscode-extensions.overlays.default
    llm-agents.overlays.shared-nixpkgs
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
