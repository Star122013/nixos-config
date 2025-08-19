{ inputs, pkgs, ... } : {
  programs.quickshell = {
    enable = true;
    package = inputs.quickshell.packages.${pkgs.system}.default;
  };

  home.packages = with pkgs;[
    cava
    gpu-screen-recorder
    xdg-desktop-portal-gtk
    material-symbols
    swww
    wallust
  ];
}