{ ... } : {
  imports = [
    ./system.nix
    ./network.nix
    ./user.nix
    ./locale.nix
    ./pipewire.nix
    ./packages.nix
    ./theme.nix
    ./fonts.nix
    ./nh.nix
    ./wayland.nix
    ./fcitx.nix 
    ./flatpak.nix
  ];
}