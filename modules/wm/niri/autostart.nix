{ ... } : {
  programs.niri.settings.spawn-at-startup = [
    { command = ["systemctl" "--user" "start" "hyprpolkitagent"]; }
    { command = ["xwayland-satellite"]; }
    { command = ["swww-daemon"]; }
    { command = ["qs" "-c" "/home/hyy/nixos-config/modules/home/quickshell/quickshell"]; }
    { command = ["fcitx5"]; }
  ];
}