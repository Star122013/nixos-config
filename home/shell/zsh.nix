{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      nvim = "nix run ~/app-flakes/nixvim# --";
      eat = "eza -aT";
      rustInit = "nix flake init --template github:the-nix-way/dev-templates#rust";
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
