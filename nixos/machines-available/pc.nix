{ config, pkgs, ... }:

{
    networking.hostName = "Yuuko";
    
    services = {
        #openssh.enable = true;
        xserver = {
            desktopManager.xfce = {
                noDesktop = true;
                enableXfwm = false;
            };
            videoDrivers = [ "nvidia" ];
            windowManager.i3 = {
                enable = true;
                extraPackages = with pkgs; [
                    dmenu
                    i3lock
                ];
            };
        };
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
        nvidia.modesetting.enable = true;
        opengl = {
            driSupport32Bit = true;
            extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
        };
    };
}
