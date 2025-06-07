{ config, pkgs, inputs, ... }:

{
  imports = [
    ./audio.nix
    ./hardware.nix
    ./packages.nix
    ../../modules/fonts.nix
    ../../modules/hyprland.nix
    ../../modules/localization.nix
    ../../modules/networking.nix
    ../../modules/terminal.nix
    ../../modules/users.nix
    ../../modules/unity.nix
  ];

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Keyboard configuration
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "caps:escape";
  };


  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
      HandleLidSwitch=suspend
      HandleLidSwitchDocked=suspend
      HandleLidSwitchExternalPower=suspend
      '';
  };

  # Printing
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
