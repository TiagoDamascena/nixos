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

    shellAliases = {
      ssh = "TERM=xterm-256color ssh";
      lf = "joshuto";
    };

    initContent = ''
      if [[ -n $DISPLAY ]]; then
        eval "$(starship init zsh)"
      fi
    '';
  };
}