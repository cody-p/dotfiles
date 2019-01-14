{ config, pkgs, ... }:

{
    networking = {
        hostName = "Yuuko";
    };
    
    boot = {
        #extraModprobeConfig = "options nvidia-drm modeset=1";
        initrd.kernelModules = [
            "nvidia"
            "nvidia_modeset"
            "nvidia_uvm"
            "nvidia_drm"
        ];
    };
    
    environment.systemPackages = with pkgs; [
        krita
        discord
        steam
        rustup
        gcc
    ];
    
    services = {
        xserver = {
            videoDrivers = [ "nvidia" ];
         };
    };
    
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
            modesetting.enable = true;
        };
        opengl = {
            driSupport32Bit = true;
            extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
        };
    };
}
