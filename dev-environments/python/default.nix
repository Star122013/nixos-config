{pkgs, ...}:{
  home.packages = with pkgs;[
    python3
    pdm
    python310Packages.virtualenv
    python310Packages.pip
  ];
}