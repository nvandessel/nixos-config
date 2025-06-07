{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/swayosd.nix
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.acpid.enable = true;

  environment.systemPackages = with pkgs; [
    fprintd         # Fingerprint reader
    brightnessctl   # Brightness control
    pavucontrol     # Audio control GUI
    playerctl       # Play/Pause FF/Back
  ];
}
