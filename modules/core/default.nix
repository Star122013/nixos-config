{ host, ... } : {
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
  ] ++
    (if host == "desktop" then [ ./wayland.nix ./fcitx.nix ] else null);
}