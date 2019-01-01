# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix # hardware-scan, do not modify.
        ./boot.nix
        ./services.nix
        ./packages.nix
        ./user-hardware-config.nix
        ./environment.nix
        ./networking.nix
        ./users.nix
    ];

    i18n = {
       consoleKeyMap = "us";
       defaultLocale = "en_US.UTF-8";
    };

    time.timeZone = "America/LosAngeles";
    nixpkgs.config.allowUnfree = true;

    programs = {
        dconf.enable = true;
        ssh.askPassword = "";
    };

    sound.enable = true;
    system.stateVersion = "18.09";
}
