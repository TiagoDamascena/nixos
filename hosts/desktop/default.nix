{
  imports = [
    ./hardware.nix
    ../../nixos/core
    ../../nixos/users/tiago
    ../../nixos/modules/system/plymouth.nix
    ../../nixos/modules/system/gtk.nix
    ../../nixos/modules/system/greetd.nix
    ../../nixos/modules/system/hyprland.nix
    ../../nixos/modules/system/hyprlock.nix
    ../../nixos/modules/system/keyring.nix
    ../../nixos/modules/shell/fish.nix
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
    xkb = {
      layout = "us";
      variant = "";
    };

    videoDrivers = ["nvidia"];
  };
}
