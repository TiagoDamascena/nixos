{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;

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
    '';
  };
}