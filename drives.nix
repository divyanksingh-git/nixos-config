{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/mount/ehdd" =
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
 
    fileSystems."/mount/essd" =
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
