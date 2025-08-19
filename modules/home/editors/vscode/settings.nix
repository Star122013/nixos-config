{ ... } : {
  programs.vscode.profiles.default.userSettings = {
    "explorer.confirmDragAndDrop" = false;
    "explorer.confirmDelete" = false;

    "workbench.colorTheme" =  "Catppuccin Mocha";
    "workbench.iconTheme" = "catppuccin-mocha";

    "editor.fontFamily" = "Maple Mono NF, Jetbrains Mono, Menlo, Consolas, monospace";
    "editor.fontLigatures" = "'calt'";

    # nix lsp
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd";
     "nixd" = {
      "formatting" = {
        "command" = ["nixfmt"];
      };
    };
  };
}