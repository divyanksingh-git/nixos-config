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
  fd
  bat
  lsd
  grc
  wget
  
  # Application
  libreoffice
  krita
  inkscape
  tenacity
  lmms
  davinci-resolve
  obs-studio
  tor-browser-bundle-bin
  transmission
  ani-cli
  mangal
  mov-cli 
  gnome-secrets
  protonvpn-cli
  gimp-with-plugins
  
  # Misc
  glava
  ];
}
