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

  home.packages = with pkgs; [
    lazygit
  ];
}