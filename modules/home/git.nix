{ pkgs,... } : {
  programs.git = {
    enable = true;
    userName = "Star122013";
    userEmail = "star122013@outlook.com";
    ignores = [
      ".DS_Store"
      ".idea"
      "dist"
      "build"
      "coverage"
      "vendor"
      ".vscode"
      ".vscode-test"
      ".cache"
      ".next"
    ];
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        emaill = "hyy122013@outlook.com";
        name = "Ripples";
      };
    };
  };

  home.packages = with pkgs; [
    lazygit
  ];
}