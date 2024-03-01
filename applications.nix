{ config, pkgs, ... }:
{  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
  # Utility
  unrar
  unzip
  p7zip
  yt-dlp
  ffmpeg_5-full
  fzf
  wget 

  # Application
  libreoffice
  krita
  inkscape
  tenacity
  lmms
  kdenlive
  obs-studio
  tor-browser-bundle-bin
  transmission
  ani-cli
  mangal
  mov-cli 
  keepassxc
  protonvpn-cli
  gimp-with-plugins
  ];
}
