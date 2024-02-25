{
  pkgs,
  vscode-marketplace,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = true;
    extensions = with vscode-marketplace; [
      antiantisepticeye.vscode-color-picker
      eamodio.gitlens
      github.copilot
      github.copilot-chat
      gruntfuggly.todo-tree
      jnoortheen.nix-ide
      mhutchie.git-graph
      miguelsolorio.min-theme
      miguelsolorio.symbols
      bradlc.vscode-tailwindcss
    ];

    userSettings = {
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "editor.detectIndentation" = true;
      "extensions.autoUpdate" = false;
      "extensions.autoCheckUpdates" = false;
      "extensions.ignoreRecommendations" = true;
      "window.menuBarVisibility" = "toggle";
      "symbols.hidesExplorerArrows" = false;
      "workbench.colorTheme" = "Min Dark";
      "workbench.iconTheme" = "symbols";
      "workbench.editor.labelFormat" = "short";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = true;
      "ditor.minimap.enabled" = false;
      "editor.rulers" = [80 120];
      "editor.renderLineHighlight" = "gutter";
      "editor.semanticHighlighting.enabled" = false;
      "editor.tabSize" = 2;
      "breadcrumbs.enabled" = false;
      "explorer.compactFolders" = false;
      "files.trimTrailingWhitespace" = true;
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

  xdg.desktopEntries = {
    code = {
      name = "Visual Studio Code";
      genericName = "Text Editor";
      icon = "vscode";
      exec = "code %F --ozone-platform=x11";
      terminal = false;
      categories = [
        "Utility"
        "TextEditor"
        "Development"
        "IDE"
      ];
      mimeType = [
        "text/plain"
        "inode/directory"
      ];
    };
  };
}
