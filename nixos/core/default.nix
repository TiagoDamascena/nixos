{ lib, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./firewall.nix
    ./home-manager.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./system.nix
  ];

  options = {
    settings = {
      keyboard.layout = lib.mkOption {
        type = lib.types.str;
        default = "us";
      };

      keyboard.variant = lib.mkOption {
        type = lib.types.str;
        default = "";
      };

      hyprland.monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ", preferred, auto, auto" ];
      };
    };
  };
}
