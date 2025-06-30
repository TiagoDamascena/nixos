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
      ls = "eza -la";
      cat = "bat";
      grep = "batgrep";
      man = "batman";
    };

    initContent = ''
      if [[ -n $DISPLAY ]]; then
        eval "$(starship init zsh)"
      fi
    '';
  };
}