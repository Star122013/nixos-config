{ pkgs, ... } : {
  home.packages = with pkgs;[
    chromium

    nautilus

    element-desktop
    vesktop
    ayugram-desktop

    gitkraken
  ];
}