{ inputs, pkgs, ...} : {

  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell
  ];

  programs.dankMaterialShell = {
    enable = true;
    package = inputs.dankMaterialShell.packages.${pkgs.system}.default;
    enableSpawn = true;
  };
}