{ inputs, ... } : {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    starship.enable = true;
    fish.enable = true;
    fzf.enable = true;
    yazi.enable = true;
    fuzzel.enable = true;
    alacritty.enable = true;
    # ghostty.enable = true;
    fcitx5.enable = true;
  };
}