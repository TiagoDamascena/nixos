{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "v0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "v0.9.0";
          sha256 = "164n90h1q1sn7wwz5r3mj0m2mpalsgh9c3584cqab9kbwwmd83i9";
        };
      }
    ];

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