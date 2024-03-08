{ config, pkgs, ... }:
let
  davinci-resolve-icon = pkgs.makeDesktopItem {
    name = "Davinci Resolve";
    desktopName = "Davinci Resolve";
    icon = "davinci-resolve";
    exec = "${pkgs.davinci-resolve}/bin/davinci-resolve %u";
  };
in {
  environment.systemPackages = [
    davinci-resolve-icon
  ];
}
