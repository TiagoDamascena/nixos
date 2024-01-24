{
  config,
  pkgs,
  lib,
  ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    kernelParams = [ "quiet" "udev.log_level=0" "splash" ];
    consoleLogLevel = 0;

    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };

  i18n.defaultLocale = "pt_BR.UTF-8";
  time.timeZone = "America/Sao_Paulo";

  console = {
    useXkbConfig = true;
  };

  services = {
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];

    xserver = {
      enable = true;

      displayManager.sddm = {
        enable = true;
        theme = "sugar-catppuccin";
        wayland.enable = true;
      };

      libinput = {
        enable = true;
      };

      layout = "br";
      xkbVariant = "abnt2";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    accounts-daemon.enable = true;
    udisks2.enable = true;

    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      gnome-settings-daemon.enable = true;
    };

    gvfs.enable = true;

    upower = {
      enable = true;
    };
  };

  security = {
    pam.services = {
      sddm = {
        enableGnomeKeyring = true;
      };
      waylock = {};
    };

    polkit.enable = true;
  };

  virtualisation = {
    docker.enable = true;
  };

  programs = {
    hyprland.enable = true;
    light.enable = true;

    dconf.enable = true;
    seahorse.enable = true;
    zsh.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  environment.systemPackages = with pkgs; [
    gcc
    zip
    unzip
    vim
    git
    jq
    socat
    pulseaudio
    eza
    bat
    ripgrep
    htop
    neofetch
    sddm-sugar-catppuccin
    waylock
    alacritty
    rofi-wayland
    glib
    gnome.adwaita-icon-theme
    gnome.nautilus
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.gnome-screenshot
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome.dconf-editor
    gnome.gnome-control-center
    gnome.eog
  ];

  fonts.packages = with pkgs; [
    corefonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        ];
      })
  ];

  users.users.tiago = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" ];
    packages = with pkgs; [
      zsh
      starship
      pamixer
      playerctl
      pavucontrol
      wl-clip-persist
      joshuto
      neovim
      eww
      hyprpaper
      (google-chrome.override {
        commandLineArgs = [
          "--enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization"
          "--force-dark-mode"
          "--use-vulkan"
        ];
      })
      firefox
      spotify
      whatsapp-for-linux
      discord
      insomnia
      drawio
      swaynotificationcenter
      libnotify
      avizo
      grimblast
      scratchpad
      try_swap_workspace
      docker-compose
      lazydocker
      gnumake
      mariadb
      awscli2
      kubectl
      kubeseal
      eksctl
      openvpn
      bitwarden
      onlyoffice-bin
      mpv
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "unstable";
}
