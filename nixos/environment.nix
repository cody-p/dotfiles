{ config, ... }:

{
    environment = {
        interactiveShellInit = ''
            neofetch | lolcat
        '';
        variables = {
            EDITOR="mousepad";
            TERMINAL="kitty";
        };
    };
}
