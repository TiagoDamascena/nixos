{
  description = "NixOS de Tiago";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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

            home-manager.users.tiago = import ./home/tiago.nix;
          }
        ];

        specialArgs.sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${system}.default;
      };
    };
  };
}
