{ users, config, pkgs, home-manager, stylix, ... }:
{
  imports = [ home-manager.nixosModules.home-manager ];
  
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vokun = {
    isNormalUser = true;
    description = "vokun";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" "video"];
  };
  
  # Users home manager
  
  home-manager.extraSpecialArgs = {
                                    stylix = stylix;
                                  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vokun = ./vokun/home.nix;
}
