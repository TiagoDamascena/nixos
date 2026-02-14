{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    projects = {
      url = "git+ssh://git@github.com/TiagoDamascena/nixos-projects.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hosts/desktop
        ];
      };

      vivobook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hosts/vivobook
          inputs.projects.nixosModules.default
        ];
      };
    };
  };
}
