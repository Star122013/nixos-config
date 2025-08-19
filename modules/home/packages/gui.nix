{ pkgs, ... } : {
  home.packages = with pkgs;[
    kdePackages.kate
    v2raya
    chromium

    nautilus

    element-desktop
    vesktop
    ayugram-desktop

    gitkraken
  ];
}