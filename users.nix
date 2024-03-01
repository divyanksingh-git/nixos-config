{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vokun = {
    isNormalUser = true;
    description = "vokun";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" ];
    packages = with pkgs; [
    
    ];
  };
}
