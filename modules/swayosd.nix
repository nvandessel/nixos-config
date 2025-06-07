{pkgs, lib, ...}: let
  swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
in {
  ...

  config = {
    startup = [
      ...
      {command = lib.getExe' pkgs.swayosd "swayosd-server";}
    ];

    keybindings = {
      "XF86AudioRaiseVolume" = "exec ${swayosd} --output-volume raise";
      "XF86AudioLowerVolume" = "exec ${swayosd} --output-volume lower";
      "XF86AudioMute" = "exec ${swayosd} --output-volume mute-toggle";
    };
  };
}
