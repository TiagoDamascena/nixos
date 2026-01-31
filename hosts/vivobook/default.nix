{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../nixos/overlays
    ../../nixos/core
    ../../nixos/users/tiago
    ../../nixos/modules/system/plymouth.nix
    ../../nixos/modules/system/wifi.nix
    ../../nixos/modules/system/gtk.nix
    ../../nixos/modules/system/greetd.nix
    ../../nixos/modules/system/gvfs.nix
    ../../nixos/modules/system/hyprland.nix
    ../../nixos/modules/system/hyprlock.nix
    ../../nixos/modules/system/keyring.nix
    ../../nixos/modules/system/playerctl.nix
    ../../nixos/modules/system/docker.nix
    ../../nixos/modules/shell/fish.nix
  ];

  networking.hostName = "vivobook";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  hardware.enableAllFirmware = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver = {
    xkb = {
      layout = "br";
      variant = "abnt2";
    };
  };
}
