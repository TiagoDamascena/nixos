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
      gruntfuggly.todo-tree
      eamodio.gitlens
      mhutchie.git-graph
      pkief.material-icon-theme
      tabnine.tabnine-vscode
    ];

    userSettings = {
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "workbench.iconTheme" = "material-icon-theme";
      "editor.detectIndentation" = true;
      "editor.tabSize" = 2;
      "extensions.autoUpdate" = false;
      "extensions.autoCheckUpdates" = false;
      "tabnine.experimentalAutoImports" = false;
      "window.menuBarVisibility" = "toggle";
      "files.trimTrailingWhitespace" = true;
      "extensions.ignoreRecommendations" = true;
      "window.titleBarStyle" = "custom";
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
