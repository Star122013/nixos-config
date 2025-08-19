{ ... } : {
  imports = [
    ./fish.nix
    ./fzf.nix
    ./zoxide.nix
    ./starship.nix
    ./fuzzel.nix
    ./alacritty.nix
    ./ghostty.nix
    ./swww.nix
    ./ssh.nix

    ./packages
    ./theme
    ./yazi
    ./quickshell
    ./editors
    ./dev
    ./../wm/niri
  ];
}