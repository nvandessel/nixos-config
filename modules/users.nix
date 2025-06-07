{ config, pkgs, ... }:

{
    users.users.nic = {
        isNormalUser = true;
        description = "Nic";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    users.users.greeter = {
        isSystemUser = true;
        description = "Greeter user for greetd";
        home = "/var/empty";
        shell = pkgs.bash;
        extraGroups = [ "video" "input" ];
    };
}
