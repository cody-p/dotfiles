{ config, pkgs, ... }:

{
    networking = {
        hostName = "Yuuko"; # Define your hostname.
        nameservers = [
            "8.8.8.8"
        ];
    };
}
