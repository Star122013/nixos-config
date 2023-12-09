{...}:{
  programs.mako.enable = true;
  home.file."~/.config/mako" = {
    source = ./mako;
    recursive = true;
  };
}