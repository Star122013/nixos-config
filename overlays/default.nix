{ inputs, ... } : {
  nixpkgs.overlays = 
    [ 
      inputs.niri.overlays.niri
      inputs.nix4vscode.overlays.forVscode 
    ];
}