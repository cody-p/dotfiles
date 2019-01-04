{ config, pkgs, ... }:

{
    fileSystems."/storage" =
    { device = "/dev/disk/by-label/storage";
        fsType = "ext4";
    };
    
    fileSystems."/backup" = {
        device = "/dev/disk/by-label/backup";
        options = [
            "nofail"
        ];
    };

    hardware = {
        cpu.intel.updateMicrocode = true;
        nvidia = {
            optimus_prime = {
                enable = true;
                nvidiaBusId = "PCI:02:00:0";
                intelBusId = "PCI:00:02:0";
            };
            modesetting.enable = true;
        };
        pulseaudio = {
            enable = true;
            support32Bit = true;
        };
        opengl = {
            driSupport32Bit = true;
            extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
        };
    };
}
