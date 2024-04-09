{
  pkgs,
  vscode-marketplace,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with vscode-marketplace; [
      antiantisepticeye.vscode-color-picker
      bmewburn.vscode-intelephense-client
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
      eamodio.gitlens
      esbenp.prettier-vscode
      github.copilot
      github.copilot-chat
      gruntfuggly.todo-tree
      jnoortheen.nix-ide
      mhutchie.git-graph
      miguelsolorio.min-theme
      miguelsolorio.symbols
      simonsiefke.svg-preview
    ];

    userSettings = {
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "editor.detectIndentation" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "extensions.autoUpdate" = false;
      "extensions.autoCheckUpdates" = false;
      "extensions.ignoreRecommendations" = true;
      "window.menuBarVisibility" = "toggle";
      "symbols.hidesExplorerArrows" = true;
      "workbench.colorTheme" = "Min Dark";
      "workbench.iconTheme" = "symbols";
      "workbench.editor.labelFormat" = "short";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "editor.rulers" = [80 120];
      "editor.renderLineHighlight" = "gutter";
      "editor.semanticHighlighting.enabled" = false;
      "editor.tabSize" = 2;
      "breadcrumbs.enabled" = false;
      "explorer.compactFolders" = false;
      "files.trimTrailingWhitespace" = true;
      "tailwindCSS.experimental.classRegex" = [[
        "tv\\((([^()]*|\\([^()]*\\))*)\\)"
        "[\"'`]([^\"'`]*).*?[\"'`]"
      ]];
    };

    keybindings = [
      {
        "key" = "ctrl+shift+c";
        "command" = "-workbench.action.terminal.openNativeConsole";
        "when" = "!terminalFocus";
      } {
        "key" = "ctrl+shift+[BracketLeft]";
        "command" = "-workbench.action.terminal.toggleTerminal";
        "when" = "terminal.active";
      } {
        "key" = "ctrl+t";
        "command" = "workbench.action.terminal.toggleTerminal";
        "when" = "terminal.active";
      }
    ];
  };
}
