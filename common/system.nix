{
  config,
  pkgs,
  lib,
  ...
}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    kernelParams = [ "quiet" "udev.log_level=3" "splash" ];
    consoleLogLevel = 3;

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
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services = {
    gvfs.enable = true;

    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];

    xserver = {
      enable = true;
      
      displayManager.sddm = {
        enable = true;
        theme = "sugar-catppuccin";
        settings = {
          General = {
            DisplayServer = "wayland";
            InputMethod = "";
          };
          Wayland.CompositorCommand = "${pkgs.weston}/bin/weston --shell=fullscreen-shell.so";
        };
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
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      gnome-settings-daemon.enable = true;
    };
  };

  security = {
    pam.services = {
      sddm = {
        enableGnomeKeyring = true;
      };
      waylock = {};
    };
  };

  virtualisation = {
    docker.enable = true;
  };

  programs = {
    hyprland.enable = true;
    waybar.enable = true;
    light.enable = true;

    dconf.enable = true;
    seahorse.enable = true;
    zsh.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
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
      slack
      discord
      obsidian
      postman
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
    ];
    shell = pkgs.zsh;
  };
 
  system.stateVersion = "unstable";
}
