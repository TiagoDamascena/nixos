{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../nixos/overlays
    ../../nixos/core
    ../../nixos/users/tiago
    ../../nixos/modules/system/upower.nix
    ../../nixos/modules/system/ssh.nix
    ../../nixos/modules/system/plymouth.nix
    ../../nixos/modules/system/wifi.nix
    ../../nixos/modules/system/bluetooth.nix
    ../../nixos/modules/system/gtk.nix
    ../../nixos/modules/system/greetd.nix
    ../../nixos/modules/system/gvfs.nix
    ../../nixos/modules/system/hyprland.nix
    ../../nixos/modules/system/hyprlock.nix
    ../../nixos/modules/system/keyring.nix
    ../../nixos/modules/system/nix-ld.nix
    ../../nixos/modules/system/power-management.nix
    ../../nixos/modules/system/playerctl.nix
    ../../nixos/modules/system/docker.nix
    ../../nixos/modules/shell/fish.nix
  ];

  networking.hostName = "vivobook";

  settings = {
    keyboard = {
      layout = "br";
      variant = "abnt2";
    };

    hyprland.monitors = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, preferred, auto, auto"
    ];
  };

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
}
