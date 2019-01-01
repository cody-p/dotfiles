{ config, ... }:

{
    environment = {
        interactiveShellInit = ''
            neofetch
        '';
        variables = {
            EDITOR="gedit";
            TERMINAL="tilix";
        };
    };
}
