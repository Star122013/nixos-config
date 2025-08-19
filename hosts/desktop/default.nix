{ ... } : {
  imports = [
    ./hardware-configuration.nix
    ./boot-grub.nix
    ./kernel.nix
    ./../../modules/core
    ./../../overlays
  ];
}