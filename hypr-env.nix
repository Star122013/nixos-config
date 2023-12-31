{pkgs, hyprland, config, nur, ...}: {
  ##########################################################################################################
  #
  #  NixOS's Configuration for Hyprland Window Manager
  #
  #    i3wm: old and stable, only support X11
  #    sway: compatible with i3wm, support Wayland. do not support Nvidia GPU officially.
  #    hyprland: project starts from 2022, support Wayland, envolving fast, good looking, support Nvidia GPU.
  #
  ##########################################################################################################

  imports = [
     # hyprland.nixosModules.default
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  xdg.portal.config.common.default = "*";

  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };
    };
  };

  programs = {

    # monitor backlight control
    light.enable = true;

    # thunar file manager(part of xfce) related options
    thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = [
    pkgs.swaybg # the wallpaper
    pkgs.swayidle # the idle timeout
    pkgs.swaylock # locking the screen
    pkgs.wlogout # logout menu
    pkgs.wl-clipboard # copying and pasting
    pkgs.hyprpicker  # color picker

    pkgs.wf-recorder # creen recording
    pkgs.grim # taking screenshots
    pkgs.slurp # selecting a region to screenshot
    # TODO replace by `flameshot gui --raw | wl-copy`

    pkgs.mako # the notification daemon, the same as dunst
    pkgs.swww
    pkgs.yad # a fork of zenity, for creating dialogs
    pkgs.pavucontrol
    pkgs.light
    # audio
    pkgs.alsa-utils # provides amixer/alsamixer/...
   # for playing system sounds
    pkgs.mpc-cli # command-line mpd client
    pkgs.ncmpcpp # a mpd client with a UI
    pkgs.networkmanagerapplet # provide GUI app: nm-connection-editor
    pkgs.xfce.thunar # xfce4's file manager
    pkgs.swappy
    pkgs.jq
    pkgs.cpio
    pkgs.polkit
    pkgs.notify
    pkgs.libnotify
    pkgs.gcj
  ];


  # fix https://github.com/ryan4yin/nix-config/issues/10
  security.pam.services.swaylock = {};
}
