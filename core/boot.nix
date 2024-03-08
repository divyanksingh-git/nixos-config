{ config, pkgs, ... }:
{
  # Boot Config
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';
  
  boot.kernelParams = [ 
    "quiet"
    "loglevel=3"
  ];

  # Bootloader. 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
