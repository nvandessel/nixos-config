{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unityhub

    jetbrains.rider

    dotnet-sdk_8
  ];
}

