{ pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    
    # command line tools
    wget
    git
    eza
    unzip

    # nix language lsp
    nixd
    nil
    nixfmt
  ];
}