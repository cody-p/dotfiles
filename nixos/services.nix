{ config, pkgs, ... }:

{
    services = {
        dbus.packages = with pkgs; [ 
            xfce.dconf
        ];
        xserver = {
            enable = true;
            layout = "us";
            videoDrivers = [ "nvidia" ];
            desktopManager = {
                default = "xfce";
                xterm.enable = false;
                xfce = {
                    enable = true;
                    enableXfwm = false;
                    noDesktop = true;
                };
            };
            windowManager.i3 = {
                enable = true;
                extraPackages = with pkgs; [
                    dmenu
                    i3lock
                ];
            };
            libinput = {
                accelSpeed = 0;
                accelProfile = "flat";
            };
            displayManager = {
                # calibrate monitors - currently disabled because i'm using xfce which should handle this for me
                #sessionCommands = ''
                #    xrandr --output HDMI-1-3 --off --output DVI-D-0 --off --output HDMI-1-2 --off --output HDMI-1-1 --off --output DP-1-2 --mode 1600x900 --pos 3840x72 --rotate normal --output DP-1-1 --off --output                     HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off                 --output DP-0 --off
                #'';
                gdm = {
                    wayland = false;
                    enable = true;
                };
                setupCommands = ''
                    xrandr --output DVI-D-0 --mode 1600x900 --pos 3840x88 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
                '';
            };
        };
        
        openssh = {
            enable = true;
            allowSFTP = true;
            passwordAuthentication = false;
            permitRootLogin = "no";
            ports = [
                4292
            ];
        };
    };
}
