{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  # Session variables for Wayland and cursor
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Capitaine-Cursors";
    XCURSOR_SIZE = "48";
  };

  # xdg-desktop-portal config for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "hyprland";
  };

  # Greetd setup with tuigreet launching Hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "nic";
      };
    };
  };

  # Supporting programs
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    fuzzel
    swww
    wl-clipboard
    xdg-desktop-portal-hyprland
    xwayland

    hyprlock

    hyprshot
    grim
    slurp
    libnotify

    kitty
    xfce.thunar

    capitaine-cursors
  ];
}
