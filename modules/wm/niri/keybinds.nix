{ config, pkgs, ... } : 

let 
  apps = import ./applications.nix { inherit pkgs;};

in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Super+Return".action = spawn apps.terminal;
    "Super+Q".action = close-window;
    "Super+B".action = spawn apps.browser;
    "Super+E".action = spawn apps.fileManager;
    "Super+Space".action = spawn apps.appLauncher;

    "Super+F".action = fullscreen-window;
    "Super+T".action = toggle-window-floating;

    "Super+Left".action = focus-column-left;
    "Super+Right".action = focus-column-right;
    "Super+Down".action = focus-workspace-down;
    "Super+Up".action = focus-workspace-up;

    "Super+Shift+Left".action = move-column-left;
    "Super+Shift+Right".action = move-column-right;
    "Super+Shift+Down".action = move-column-to-workspace-down;
    "Super+Shift+Up".action = move-column-to-workspace-up;
    
    "Super+1".action = focus-workspace "browser";
    "Super+2".action = focus-workspace "vesktop";

    "Mod+Tab" = {
    action = toggle-overview;
    hotkey-overlay.title = "Open Overview";
  };
  };
}