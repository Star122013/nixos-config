{pkgs, ...}:{
  home.packages = with pkgs;[
    eww-wayland
  ];
  home.file.".config/eww" = {
    source = ./eww;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限
  };
}