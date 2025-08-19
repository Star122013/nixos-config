{ pkgs, ... } : {
  programs.vscode.profiles.default.extensions = pkgs.nix4vscode.forVscode [
    "jnoortheen.nix-ide"

    "Catppuccin.catppuccin-vsc-icons"
    "Catppuccin.catppuccin-vsc"

    "mkhl.direnv"
  ]; 
}