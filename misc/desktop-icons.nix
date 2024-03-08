{ config, pkgs, ... }:
let
  davinci-resolve-icon = pkgs.makeDesktopItem {
    name = "Davinci Resolve";
    desktopName = "davinci resolve video editor";
    icon = "${pkgs.davinci-resolve}/graphics/DV_Resolve.png"
    exec = "${pkgs.davinci-resolve}/bin/resolve %u";
    terminal = "true";
  };
in {
  environment.systemPackages = [
    davinci-resolve-icon
  ];
}
