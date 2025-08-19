{ ... } : {
  programs.niri.settings = {
    workspaces = {
      "browser" = {};
      "vesktop" = {};
    };

    layout = {
      focus-ring = {
          enable = false;
          width = 3;
        };

        gaps = 6;

        struts = {
          left = 20;
          right = 20;
          top = 20;
          bottom = 20;
        };

        border = {
          enable = true;
          width = 4;
          active.color = "#725eaeff";
          inactive.color = "#505050";
        };

        default-column-width = {
          proportion = 0.5;
        };

        background-color = "transparent";
    };

    input = {
      keyboard.xkb.layout = "us";
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus.enable = false;
    };

    outputs = {
      "DP-2" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 170.0000;
        };
        scale = 1.25;
        position = { x = 0; y = 0; };
      };
    };

      cursor = {
        size = 24;
        theme = "phinger-cursors-light";
      };

      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        DISPLAY = ":0";
        
      };
    };
}