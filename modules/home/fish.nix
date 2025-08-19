{ pkgs, ... } : {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    shellAliases = {
      cd = "z";
      "..."= "cd ../..";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";
    };
  };
}