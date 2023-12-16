{
  description = "Hyy's flake for NixOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    waybar.url = "github:Alexays/Waybar";
    ags.url = "github:Aylur/ags";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    myRepo = {
      url = "github:star122013/nur_packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:/nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };
    catppuccin-btop = {
      url = "github:catppuccin/btop";
      flake = false;
    };
    catppuccin-fcitx5 = {
      url = "github:catppuccin/fcitx5";
      flake = false;
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    catppuccin-alacritty = {
      url = "github:catppuccin/alacritty";
      flake = false;
    };
    catppuccin-wezterm = {
      url = "github:catppuccin/wezterm";
      flake = false;
    };
    catppuccin-helix = {
      url = "github:catppuccin/helix";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, home-manager, nur, anyrun, ... }@inputs:
    let inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ({
              nixpkgs.overlays = [
                (final: prev: {
                  myRepo = inputs.myRepo.packages."${prev.system}";
                })
              ];
            })
            (args: { nixpkgs.overlays = import ./overlays args; })
            ./configuration.nix
            ./fonts
            ./modules
            ./hypr-env.nix
            ./flatpak-fonts.nix
            ./insecure.nix
            nur.nixosModules.nur
            # anyrun.homeManagerModules.default
            # 将 home-manager 配置为 nixos 的一个 module
            # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # 这里的 ryan 也得替换成你的用户名
              # 这里的 import 函数在前面 Nix 语法中介绍过了，不再赘述
              home-manager.users.hyy = import ./home;
              # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
              # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
              home-manager.extraSpecialArgs = { inherit inputs outputs self; };
            }
          ];
        };
      };
    };
}
