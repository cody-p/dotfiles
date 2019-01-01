{ config, pkgs, ... }:

{
    services = {
        dbus.packages = [ pkgs.gnome3.dconf ];
        xserver = {
            enable = true;
            layout = "us";
            videoDrivers = [ "nvidia" ];
            desktopManager = {
                default = "";
                xterm.enable = false;
            };
            windowManager.i3 = {
                enable = true;
                extraPackages = with pkgs; [
                    dmenu
                    i3lock
                ];
            };
            libinput = {
                enable = true;
                accelProfile = "flat";
                accelSpeed = "-1";
            };
            displayManager = {
                # calibrate monitors 
                sessionCommands = ''
                    xrandr --output HDMI-1-3 --off --output DVI-D-0 --off --output HDMI-1-2 --off --output HDMI-1-1 --off --output DP-1-2 --mode 1600x900 --pos 3840x72 --rotate normal --output DP-1-1 --off --output                     HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off                 --output DP-0 --off
                '';
            };
        };
    };
}
