{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.initrd.kernelModules = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  #boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
}
