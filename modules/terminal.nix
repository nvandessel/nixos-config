{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    unzip

    git
    lazygit

    vim
    neovim

    tmux
    kitty

    nodejs
    nodePackages.npm
    cargo
    dotnet-sdk_8
    gcc

    gnumake
    stow
  ];
}

    
