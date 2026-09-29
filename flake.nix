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

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    buzz = {
      url = "github:mulatta/buzz.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    struntuz-greet = {
      url = "github:tiagodamascena/struntuz-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    struntuz-topbar = {
      url = "github:tiagodamascena/struntuz-topbar";
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
          inputs.struntuz-greet.nixosModules.default
          inputs.projects.nixosModules.default
        ];
      };

      vivobook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./hosts/vivobook
          inputs.struntuz-greet.nixosModules.default
          inputs.projects.nixosModules.default
        ];
      };
    };
  };
}
