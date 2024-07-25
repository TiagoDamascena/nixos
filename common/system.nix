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

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
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

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
        theme = "sugar-catppuccin";
      };

      libinput = {
        enable = true;
      };

    xserver = {
      enable = true;

      xkb = {
        layout = "br";
        variant = "abnt2";
      };
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
      hyprlock = {};
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
    alacritty
    rofi-wayland
    glib
    adwaita-icon-theme
    nautilus
    gnome-calculator
    gnome-calendar
    gnome-system-monitor
    gnome-disk-utility
    dconf-editor
    gnome.gnome-control-center
    eog
    polkit_gnome
  ];

  fonts.packages = with pkgs; [
    corefonts
    inter
    rubik
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        ];
      })
  ];

  users.users.tiago = {
    description = "Tiago Damascena";
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
      hypridle
      hyprpaper
      hyprpicker
      swww
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
      bruno
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
      onlyoffice-bin
      mpv
      evince
      gimp
      obs-studio
      beekeeper-studio
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "unstable";
}
