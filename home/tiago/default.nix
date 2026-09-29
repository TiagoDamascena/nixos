{ pkgs, ... }:

{
  imports = [
    ./assets
    ./modules
  ];

  home = {
    username = "tiago";
    homeDirectory = "/home/tiago";

    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    packages = with pkgs; [
      # Fonts
      rubik
      inter-nerdfont
      nerd-fonts.jetbrains-mono
      # CLI tools
      gnumake
      nixfmt
      lazydocker
      lazygit
      kubectl
      kubeseal
      pavucontrol
      wl-clipboard
      brightnessctl
      claude-code
      bubblewrap
      github-cli
      # Basic applications
      nautilus
      loupe
      showtime
      papers
      gnome-calculator
      gnome-calendar
      gnome-system-monitor
      # User applications
      zen-browser
      google-chrome
      spotify
      discord
      bitwarden-desktop
      onlyoffice-desktopeditors
      vscode
      llm-agents.claude-desktop
      dbeaver-bin
      bruno
      postman
      obsidian
      drawio
      vlc
      gimp
      localsend
      github-desktop
      # Screenshot tools
      grim
      slurp
      satty
      # Buzz
      claude-agent-acp
      buzz-desktop
    ];

    stateVersion = "26.11";
  };
}
