{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    unzip

    git
    git-lfs
    lazygit

    vim
    neovim
    tmux
    kitty
    ripgrep

    nodejs
    nodePackages.npm
    cargo
    dotnet-sdk_8
    gcc

    gnumake
    stow
  ];
}

    
