{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
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
        discord
        steam
        cargo
        gcc
        krita
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
    ];
}
