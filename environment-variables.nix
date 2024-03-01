{ config, pkgs, ... }:
{
  # Environment Variable
  environment.etc."xdg/user-dirs.defaults".text = ''
    XDG_DESKTOP_DIR=Desktop
    XDG_DOWNLOAD_DIR=Downloads
    XDG_TEMPLATES_DIR=Templates
    XDG_PUBLICSHARE_DIR=Public
    XDG_DOCUMENTS_DIR=Documents
    XDG_MUSIC_DIR=Music
    XDG_PICTURES_DIR=Pictures
    XDG_VIDEOS_DIR=Videos
    XDG_DEVELOPMENT_DIR=Development
    XDG_GAMES_DIR=Games
    XDG_GIT_DIR=Git
    XDG_DRIVE_DIR=Drive
  '';

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    CHROME_EXECUTABLE="${pkgs.brave}/bin/brave";
    XCURSOR_SIZE="24";
  };
}