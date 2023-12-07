{pkgs, config, nur,...}:{
  home.packages = [
    pkgs.appimage-run
    pkgs.google-chrome
    pkgs.dunst
    pkgs.qq
    pkgs.libreoffice
    pkgs.fzf
    pkgs.grc
    pkgs.jetbrains.pycharm-professional
    pkgs.gitSVN
    pkgs.unzip
    pkgs.wpsoffice-cn
    pkgs.obsidian
    pkgs.hexo-cli
    pkgs.devbox
    pkgs.lazygit
  ];
}