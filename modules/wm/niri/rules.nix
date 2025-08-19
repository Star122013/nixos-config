{ ... } : {
  programs.niri.settings = {
    layer-rules = [

    ];

    window-rules = [
      {
        matches = [
          { app-id = "chromium"; }
        ];
        open-on-workspace = "browser";
      }
      {
        matches = [
          { app-id = "vesktop"; }
        ];
        open-on-workspace = "vesktop";
      }
      {
        matches = [{}];
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
        draw-border-with-background = false;
      }

      {
        matches = [
          { app-id = "ghostty"; }
          { is-active = false; }
        ];
        
        opacity = 0.9;

      }
    ];
  };
}