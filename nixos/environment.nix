{ config, ... }:

{
    environment = {
        interactiveShellInit = ''
            fortune | cowsay | lolcat
        '';
        variables = {
            EDITOR="gedit";
            TERMINAL="tilix";
        };
    };
}
