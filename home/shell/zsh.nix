{
 programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git"];
    theme = "random";
  };
zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
    ];
  };
};
}