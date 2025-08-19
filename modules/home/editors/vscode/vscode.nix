{ pkgs, ... } : {
  programs.vscode = {
    enable = true;
    profiles.default.enableUpdateCheck = false;
    profiles.default.enableExtensionUpdateCheck = false;
    package = (pkgs.vscode.override{
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--ozone-platform-hint=auto"
        "--enable-wayland-ime"
        "--wayland-text-input-version=3"
      ];
    });
  };
}