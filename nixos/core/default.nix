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

      # Each entry becomes an `hl.monitor({ ... })` call in the Hyprland Lua config.
      hyprland.monitors = lib.mkOption {
        type = with lib.types; listOf (attrsOf (oneOf [ str int float bool ]));
        default = [
          {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = "auto";
          }
        ];
      };
    };
  };
}
