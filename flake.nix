{
  description = "System Configuration";
  
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # change main branch

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  };

  outputs = { self, 
              nixpkgs, 
              nixpkgs-stable, 
              nixpkgs-unstable, 
              nixpkgs-master, 
              home-manager, 
              hyprland,
              hyprland-plugins, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    pkgs-master = nixpkgs-master.legacyPackages.${system};

  in {
    nixosConfigurations = {
      dovah = lib.nixosSystem {
        inherit system;
        modules = [
          ./dovah.nix
        ];
        specialArgs ={
          inherit pkgs-stable;
          inherit pkgs-unstable;
          inherit pkgs-master;
          inherit home-manager;
          inherit hyprland;
          inherit hyprland-plugins;
        };
      };
    }; 
  };
}
