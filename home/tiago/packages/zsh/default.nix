{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion = {
      enable = true;
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
        "vi-mode"
      ];
    };

    syntaxHighlighting = {
      enable = true;
    };

    sessionVariables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
    };

    shellAliases = {
      ssh = "TERM=xterm-256color ssh";
      lf = "joshuto";
    };

    initExtra = ''
      if [[ -n $DISPLAY ]]; then
        eval "$(starship init zsh)"
      fi
    '';

    profileExtra = ''
      export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh
      export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
    '';
  };
}