{
  description = "NixOS de Tiago";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-contrib = {
      url = "github:TiagoDamascena/hyprwm-contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sddm-sugar-catppuccin = {
      url = "github:TiagoDamascena/sddm-sugar-catppuccin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eww-tray = {
      url = "github:ralismark/eww/tray-3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }@inputs: {
    nixosConfigurations = {
      vivobook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hosts/vivobook
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hosts/desktop
        ];
      };
    };
  };
}
