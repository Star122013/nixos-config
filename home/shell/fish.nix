{config, pkgs, ...}:{
  programs.fish = {
    enable = true;
     plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
     ];
     shellInit = ''
          neofetch
'';
  };
}