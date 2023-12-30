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
      pkief.material-icon-theme
      bradlc.vscode-tailwindcss
    ];

    userSettings = {
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "workbench.iconTheme" = "material-icon-theme";
      "editor.detectIndentation" = true;
      "editor.tabSize" = 2;
      "extensions.autoUpdate" = false;
      "extensions.autoCheckUpdates" = false;
      "window.menuBarVisibility" = "toggle";
      "files.trimTrailingWhitespace" = true;
      "extensions.ignoreRecommendations" = true;
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
