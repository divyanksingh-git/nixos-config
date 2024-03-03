{ config, pkgs, ... }:

let
  prime-run = pkgs.writeShellScriptBin "prime-run" ''
      __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
  '';
  
  rofi-power-menu = pkgs.writeShellScriptBin "rofi-power-menu" ''
      chosen=$(printf "󰐥 Power Off\n Restart\n Lock Screen\n󰍃 Log out" | ${pkgs.rofi-wayland}/bin/rofi "$@")
      case "$chosen" in 
        "󰐥 Power Off") shutdown now;;
        " Restart") reboot;;
        " Lock Screen") ${pkgs.hyprlock}/bin/hyprlock;;
        "󰍃 Log out") ${pkgs.hyprland}/bin/hyprctl dispatch exit 0;;
        *) exit 1 ;;
      esac
    '';
in {
  environment.systemPackages = [ 
    prime-run
    rofi-power-menu
  ];
}  
