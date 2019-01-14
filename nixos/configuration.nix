# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix # hardware-scan, do not modify.
        ./machines-enabled
    ];

    boot = {
        loader = { 
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };
    
    i18n = {
       consoleKeyMap = "us";
       defaultLocale = "en_US.UTF-8";
    };

    networking = {
        nameservers = [
            "8.8.8.8"
        ];
    };
    time.timeZone = "America/Los_Angeles";
    nixpkgs.config.allowUnfree = true;

    environment = {
        systemPackages = with pkgs; [
            firefox
            thunderbird
            pasystray
            pavucontrol
            wget
            git
            tint2 
            compton
            nano
            sudo
            pciutils
            neofetch
            killall
            keepassx2
            rsync
            glxinfo 
            nitrogen
            gparted
            equilux-theme
            lolcat
            cowsay
            fortune
            gksu
            arandr
            xfce.xfce4-taskmanager
            htop
            tilix
            python
            gnome3.gedit
            libreoffice
            figlet
            qdirstat
        ];
        interactiveShellInit = ''
            neofetch | lolcat
        '';
        variables = {
            EDITOR="gedit";
            TERMINAL="tilix";
        };
    };
    
    programs = {
        dconf.enable = true;
        ssh.askPassword = "";
    };

    sound.enable = true;
    system = {
        autoUpgrade = {
            enable = true;
            channel = https://nixos.org/channels/nixos-unstable;
        };
        stateVersion = "18.09";
    };
    
    services = {
        dbus.packages = with pkgs; [ 
            xfce.dconf
        ];
        xserver = {
            enable = true;
            layout = "us";
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
    
    hardware = {
        pulseaudio = {
            enable = true;
            support32Bit = true;
        };
    };
    
    users.users.cody = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };
}
