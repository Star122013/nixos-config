{ inputs, lib, config, pkgs, ... }: {
  home.username = "hyy";
  home.homeDirectory = "/home/hyy";
  imports = [
    ./hyprland
    ./rofi
    ./terminal
    ./neofetch
    ./direnv
    ./shell/zsh.nix
    ./shell/fish.nix
    ./packages
    ../dev-environments
    ./waybar
    ./eww
    ../wallpaper
    ./music
    ./dunst
    ./git
    ./mako
    ./wlogout
    ./scripts
    ./xdg.nix
    
  ];
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
