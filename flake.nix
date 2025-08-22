{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/";

    catppuccin.url = "github:catppuccin/nix";

    niri.url = "github:sodiboo/niri-flake";

    wezterm.url = "github:wezterm/wezterm?dir=nix";

    yazi.url = "github:sxyazi/yazi";

    ghostty.url = "github:ghostty-org/ghostty";

    swww.url = "github:LGFae/swww";

    dankMaterialShell.url = "github:AvengeMedia/DankMaterialShell";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let 
      username = "hyy";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            ./hosts/desktop
          ];
          specialArgs = {
            host = "desktop";
            inherit self inputs username;
          };
        };
      };
    };
}