# Boot options.

{ config, pkgs, ... }:

{
    boot = {
        #extraModprobeConfig = "options nvidia-drm modeset=1";
        loader = { 
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        initrd.kernelModules = [
            "nvidia"
            "nvidia_modeset"
            "nvidia_uvm"
            "nvidia_drm"
        ];
    };
}
