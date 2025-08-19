{ self, ... }: {
    nixpkgs.overlays = [ self.inputs.nix4vscode.overlays.forVscode ];
}