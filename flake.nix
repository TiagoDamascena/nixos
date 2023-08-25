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

    hyprland-contrib = {
      url = "github:TiagoDamascena/hyprwm-contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sddm-sugar-catppuccin = {
      url = "github:TiagoDamascena/sddm-sugar-catppuccin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    vscode-extensions,
    hyprland-contrib,
    sddm-sugar-catppuccin,
    ...
  }@inputs: let 
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = system;

	      modules = [
          ./system.nix
          ./hardware/vivobook.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.tiago = import ./home/tiago;
            home-manager.extraSpecialArgs = {
              vscode-marketplace = vscode-extensions.extensions.${system}.vscode-marketplace;
            };
          }
        ];

        specialArgs = {
          grimblast = hyprland-contrib.packages.${system}.grimblast;
          hyprswap = hyprland-contrib.packages.${system}.try_swap_workspace;
          scratchpad = hyprland-contrib.packages.${system}.scratchpad;
          sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${system}.default;
        };
      };
    };
  };
}
