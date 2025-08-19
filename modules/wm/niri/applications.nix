{ pkgs, ... } : 
{
  browser = "${pkgs.chromium}/bin/chromium";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  fileManager = "${pkgs.nemo}/bin/nemo";
  appLauncher = "${pkgs.fuzzel}/bin/fuzzel";

}