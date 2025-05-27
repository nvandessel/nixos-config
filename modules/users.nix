{ config, pkgs, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    description = "Nic";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
