{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git-lfs

    unityhub

    jetbrains.rider

    dotnet-sdk_8
  ];
}

