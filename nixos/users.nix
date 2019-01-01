{ config, ... }:

{
    users.users.cody = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };
}
