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
      nerd-fonts.jetbrains-mono
      # CLI tools
      gnumake
      nixfmt
      lazydocker
      lazygit
      kubectl
      kubeseal
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
      vscode
      spotify
      discord
      bitwarden-desktop
      onlyoffice-desktopeditors
      dbeaver-bin
      obsidian
    ];

    stateVersion = "25.11";
  };
}
