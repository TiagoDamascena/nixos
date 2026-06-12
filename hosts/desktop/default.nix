{
  imports = [
    ./hardware.nix
    ../../nixos/overlays
    ../../nixos/core
    ../../nixos/users/tiago
    ../../nixos/modules/system/plymouth.nix
    ../../nixos/modules/system/gtk.nix
    ../../nixos/modules/system/greetd.nix
    ../../nixos/modules/system/gvfs.nix
    ../../nixos/modules/system/hyprland.nix
    ../../nixos/modules/system/hyprlock.nix
    ../../nixos/modules/system/keyring.nix
    ../../nixos/modules/system/nix-ld.nix
    ../../nixos/modules/system/playerctl.nix
    ../../nixos/modules/system/ssh.nix
    ../../nixos/modules/shell/fish.nix
    ../../nixos/modules/system/docker.nix
  ];

  networking.hostName = "desktop";

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  services.xserver = {
    videoDrivers = ["nvidia"];
  };
}
