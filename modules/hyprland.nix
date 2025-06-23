{ config, pkgs, ... }:

{
    programs.hyprland.enable = true;


# Session variables for Wayland and cursor
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        GTK_THEME = "Adwaita-dark";
    };
    environment.variables = {
        XCURSOR_THEME = "BreezeX-RosePine-Linux";
        XCURSOR_SIZE = "24"; # or 16/32/etc
    };

# xdg-desktop-portal config for Hyprland
    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        config.common.default = "hyprland";
    };

# Greetd setup with tuigreet launching Hyprland
    # services.greetd = {
    #     enable = true;
    #     settings = {
    #         default_session = {
    #             command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland";
    #             user = "nic";
    #         };
    #     };
    # };
    services.greetd = {
        enable = true;
        settings = {
            initial_session = {
                command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet --config /path/to/greetd/hyprland.conf";
                user = "greeter";
            };
            default_session = {
                command = "${pkgs.hyprland}/bin/Hyprland";
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

        greetd.gtkgreet
        cage
        hyprlock

        hyprshot
        grim
        slurp
        libnotify

        kitty

        xfce.thunar

        rose-pine-cursor

        redshift
    ];
}
