{ config, pkgs, ... }:
{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };  

  environment.systemPackages = with pkgs; [
 
  # Games
  lutris
  wineWowPackages.staging
  winetricks  
  gamemode
  mangohud
  retroarchFull
  dosbox-staging
  itch
  openmw

  ];
}

