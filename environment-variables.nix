{ config, pkgs, ... }:
{
  # Environment Variable
  environment.etc."xdg/user-dirs.defaults".text = ''
    XDG_DEVELOPMENT_DIR=Development
    XDG_GAMES_DIR=Games
    XDG_GIT_DIR=Git
    XDG_DRIVE_DIR=Drive
  '';

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
