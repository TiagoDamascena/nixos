{
  config,
  pkgs,
  lib,
  ...
}:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      download-buffer-size = 524288000;
    };
  };

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
      gnome-settings-daemon
    ];

    displayManager = {
      defaultSession = "hyprland-uwsm";

      sddm = {
        enable = true;
        wayland = {
          enable = false;
          compositor = "weston";
        };
        theme = "sugar-catppuccin";
      };
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
    docker = {
      enable = true;
      enableNvidia = config.networking.hostName == "desktop";
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    hyprland.enable = true;
    uwsm = {
      enable = true;
      waylandCompositors.hyprland = {
        binPath = "/run/current-system/sw/bin/Hyprland";
        comment = "Hyprland session managed by uwsm";
        prettyName = "Hyprland";
      };
    };

    light.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    zsh.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;

      permittedInsecurePackages = [
        "qtwebengine-5.15.19"
      ];
    };
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      gcc
      zip
      unzip
      vim
      git
      jq
      socat
      pulseaudio
      htop
      neofetch
      sddm-sugar-catppuccin
      alacritty
      rofi
      glib
      adwaita-icon-theme
      nautilus
      gnome-calculator
      gnome-calendar
      gnome-system-monitor
      gnome-disk-utility
      baobab
      dconf-editor
      gnome-control-center
      eog
      polkit_gnome
      overskride
    ];
  };

  fonts.packages = with pkgs; [
    corefonts
    inter
    rubik
    nerd-fonts.jetbrains-mono
  ];

  users.groups.tiago = {
    gid = 1000;
  };

  users.users.tiago = {
    uid = 1000;
    group = "tiago";
    isNormalUser = true;
    description = "Tiago Damascena";
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
      hyprlock
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
      spotify
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
      lazygit
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
      gimp3
      obs-studio
      vlc
      zen-browser
      code-cursor
      whatsie
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.05";
}
