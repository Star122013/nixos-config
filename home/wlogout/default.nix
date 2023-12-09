_:{
    progarms.wlogout = true;
    home.file."~/.config/wlogout" = {
      source = ./wlogout;
      recursive = true;
    };
}