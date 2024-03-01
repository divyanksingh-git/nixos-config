{
  description = "System Configuration";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, nixpkgs-master, ... }:
  let
    system = "x86_64-linux";
    
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    pkgs-master = nixpkgs-master.legacyPackages.${system};
    
    pkgs = pkgs-unstable;
    lib = nixpkgs-unstable.lib;

  in {
    nixosConfigurations = {
      dovah = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hardware-configuration.nix
          ./graphics.nix
          ./boot.nix
          ./system.nix
          ./users.nix
          ./desktop-environment.nix
          ./development.nix
          ./games.nix
          ./applications.nix
          ./scripts.nix
          ./environment-variables.nix
          ./drives.nix
          ./constant-values.nix
        ];
        specialArgs ={
          inherit pkgs-stable;
          inherit pkgs-unstable;
          inherit pkgs-master;
        };
      };
    }; 
  };
 
}
