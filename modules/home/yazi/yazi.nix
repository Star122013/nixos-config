{ pkgs, inputs, ... } : {
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default.override{
      _7zz = pkgs._7zz-rar;
    };
    enableFishIntegration = true;
  };

}