# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./proxychains.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
 
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.extraOptions =''
    warn-dirty = false
  '';

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
  };
   i18n.inputMethod = {
     enabled = "fcitx5";
     fcitx5.addons = with pkgs; [
       fcitx5-rime
       fcitx5-chinese-addons
     ];};

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  
  networking = {
  	hostName = "nixos";
    networkmanager.enable = true;
};

  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  nixpkgs.config.allowUnfree = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.hyy = {
     isNormalUser = true;
     extraGroups = [ "networkmanager" "wheel" "docker" "video" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       tree
       vscode
       cava
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     proxychains
     kitty
     rnix-lsp
     v2raya
     v2ray
     cmake
     bluetuith
     rofi-bluetooth
     gnumake
     libgcc
     libgccjit
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
	description = "polkit-gnome-authentication-agent-1";
	wantedBy = ["graphical-session.target"];
	wants = ["graphical-session.target"];
	after = ["graphical-session.target"];
	serviceConfig = {
		Type = "simple";
		ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
		Restart = "on-failure";
		RestartSec = 1;
		TimeoutStopSec = 10;
};
};
};
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.pathsToLink = ["/libexec"];  
  services.flatpak.enable = true;
  environment.variables.EDITOR = "nvim";
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.mpd.user = "hyy";
systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
};


}


