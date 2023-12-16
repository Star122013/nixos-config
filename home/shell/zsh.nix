{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      nvim = "nix run ~/app-flakes/nixvim# --";
      eat = "eza -aT";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "random";
    };
    zplug = {
      enable = true;
      plugins = [{
        name = "zsh-users/zsh-autosuggestions";
      } # Simple plugin installation
      ];
    };
  };
}
