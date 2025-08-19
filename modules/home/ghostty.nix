{ inputs, pkgs, ... } : {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default;
    settings = {
      font-family = "Maple Mono NF";
      font-size = "16";

      cursor-style = "underline";
    

      window-decoration = "none";

      theme = "catppuccin-mocha";

    };
  };
}