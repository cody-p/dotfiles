{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        firefox
        thunderbird
        pasystray
        pavucontrol
        wget
        git
        tilix
        tint2 
        compton
        nano
        sudo
        pciutils
        neofetch
        killall
        arandr
        keepassx2
        rsync
        glxinfo 
        nitrogen
        discord
        steam
        cargo
        krita
        gparted
        equilux-theme        
        #joke shit
        lolcat
        cowsay
        fortune

        # some things i use when i don't have a DE enabled
        #polkit_gnome
        #lxappearance-gtk3 
        gksu
    ];
}
