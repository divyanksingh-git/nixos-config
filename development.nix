{ config, pkgs, ... }:
{
  # Virtualization
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf.enable = true;
    };
  };
  programs.virt-manager.enable = true;
  
  # Java
  programs.java = { enable = true; package = pkgs.openjdk17; };

  # Adb
  programs.adb.enable = true;
  
  environment.systemPackages = with pkgs; [
  
  # Utility
  termscp
  
  # Developemnt
  (vscodium.override { 
    commandLineArgs =["--enable-features=UseOzonePlatform --ozone-platform=x11"]; 
  })
  # Flutter Development
  flutter
  android-studio
  git
  
  # Game Development
  godot_4
  sfxr
  aseprite
  blender
  ];
}
