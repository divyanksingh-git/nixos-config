{ config, ... }:
{
  swapDevices = [ { 
    device = "/swapfile"; 
    size = 8*1048; 
  } ];
}
