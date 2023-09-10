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
      maattdd.gitless
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
    };

    keybindings = [
      {
        "key" = "ctrl+shift+c";
        "command" = "-workbench.action.terminal.openNativeConsole";
        "when" = "!terminalFocus";
      }
    ];
  };
}
