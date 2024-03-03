{ users, config, pkgs, home-manager, hyprland-plugins, ... }:
{
  imports = [ home-manager.nixosModules.home-manager ];
  
  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vokun = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "vokun";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" "video"];
  };
  
  # Users home manager
  
  home-manager.extraSpecialArgs = { hyprland-plugins=hyprland-plugins; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vokun = ./vokun/home.nix;
}
