{ ... }:
{
  imports = [
    ./core/hardware-configuration.nix
    ./core/swap.nix
    ./core/graphics.nix
    ./core/boot.nix
    ./core/system.nix
    ./core/drives.nix
    ./core/constant-values.nix

    ./users/users.nix

    ./applications/desktop-environment.nix
    ./applications/development.nix
    ./applications/games.nix
    ./applications/applications.nix
          
    ./misc/scripts.nix
    ./misc/environment-variables.nix
    ./misc/desktop-icons.nix
  ];
}
