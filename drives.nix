{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/home/vokun/Drive/ehdd" =
    { device = "/dev/disk/by-uuid/af6f8aa1-c751-4f16-aacc-13dde60248a0";
      fsType = "ext4";
      options = [
        "defaults"
        "auto"
        "nofail"
        "noatime"
        "rw"
      ];
    };
 
    fileSystems."/home/vokun/Drive/essd" =
    { device = "/dev/disk/by-uuid/2174726A31EB68ED";
      fsType = "ntfs-3g";
      options = [  
        "defaults"
        "auto"
        "nofail"
        "noatime"  
        "rw"
      ];
    };
}
