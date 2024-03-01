{ config, lib, pkgs, ... }:

{  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
    ]; 
  };
  
  services.xserver.videoDrivers = [ "nvidia" "intel" ];

  hardware.nvidia = {
    prime = {
      reverseSync.enable = true;
      allowExternalGpu = false;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  
  environment.systemPackages = with pkgs; [
  
  # Utility
  vulkan-tools
  glxinfo
  ];
}
