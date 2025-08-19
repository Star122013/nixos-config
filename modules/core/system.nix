{ ... }:

{
  system.stateVersion = "25.05";
  nix = {
    settings = {
      download-buffer-size = 250000000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = ["https://wezterm.cachix.org"];
      trusted-public-keys = ["wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="];
    };
  };
  
  nixpkgs.config = { allowUnfree = true; };
}
