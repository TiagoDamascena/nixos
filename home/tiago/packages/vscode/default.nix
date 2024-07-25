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
      vscodevim.vim
    ];

    userSettings = {
      "breadcrumbs.enabled" = false;
      "editor" = {
        "cursorSurroundingLines" = 999;
        "defaultFormatter" = "esbenp.prettier-vscode";
        "detectIndentation" = true;
        "fontFamily" = "JetBrainsMono Nerd Font";
        "fontLigatures" = true;
        "lineNumbers" = "relative";
        "linkedEditing" = true;
        "minimap" = {
          "enabled" = false;
        };
        "renderLineHighlight" = "gutter";
        "rulers" = [80 120];
        "semanticHighlighting.enabled" = false;
        "tabSize" = 2;
      };
      "explorer.compactFolders" = false;
      "extensions" = {
        "autoUpdate" = false;
        "autoCheckUpdates" = false;
        "ignoreRecommendations" = true;
        "experimental.affinity" = {
          "vscodevim.vim" = 1;
        };
      };
      "files.trimTrailingWhitespace" = true;
      "symbols.hidesExplorerArrows" = true;
      "tailwindCSS.experimental.classRegex" = [[
        "tv\\((([^()]*|\\([^()]*\\))*)\\)"
        "[\"'`]([^\"'`]*).*?[\"'`]"
      ]];
      "update" = {
        "mode" = "none";
        "showReleaseNotes" = false;
      };
      "vim" = {
        "overrideCopy" = true;
        "useSystemClipboard" = true;
        "useCtrlKeys" = false;
        "hlsearch" = true;
        "leader" = "<Space>";
        "normalModeKeyBindingsNonRecursive" = [
          {
            "before" = ["<leader>" "w"];
            "commands" = ["workbench.action.files.save"];
          } {
            "before" = ["<leader>" "q"];
            "commands" = ["workbench.action.closeActiveEditor"];
          } {
            "before" = ["<leader>" "h"];
            "commands" = ["workbench.action.focusLeftGroup"];
          } {
            "before" = ["<leader>" "j"];
            "commands" = ["workbench.action.focusDownGroup"];
          } {
            "before" = ["<leader>" "k"];
            "commands" = ["workbench.action.focusUpGroup"];
          } {
            "before" = ["<leader>" "l"];
            "commands" = ["workbench.action.focusRightGroup"];
          } {
            "before" = ["<leader>" "r"];
            "commands" =["workbench.action.openRecent"];
          } {
            "before" = ["<leader>" "p"];
            "commands" = ["workbench.action.quickOpen"];
          }
        ];
        "visualModeKeyBindings" = [
          {
            "before" = ["<"];
            "commands" = ["editor.action.outdentLines"];
          } {
            "before" = [">"];
            "commands" = ["editor.action.indentLines"];
          } {
            "before" = ["<leader>" "c"];
            "commands" = ["editor.action.commentLine"];
          }
        ];
      };
      "window.menuBarVisibility" = "toggle";
      "workbench" = {
        "colorTheme" = "Min Dark";
        "iconTheme" = "symbols";
        "editor.labelFormat" = "short";
      };
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
      } {
        "key" = "ctrl+n";
        "command" = "explorer.newFile";
        "when" = "explorerViewletFocus";
      } {
        "key" = "ctrl+shift+n";
        "command" = "explorer.newFolder";
        "when" = "explorerViewletFocus";
      } {
        "key" = "ctrl+shift+d";
        "command" = "deleteFile";
        "when" = "explorerViewletFocus && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly";
      }
    ];
  };
}
