{ users, config, pkgs, home-manager, ... }:
{
  imports = [ home-manager.nixosModules.home-manager ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vokun = {
    isNormalUser = true;
    description = "vokun";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" ];
  };
  
  # Users home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vokun = ./home-vokun.nix;
}
