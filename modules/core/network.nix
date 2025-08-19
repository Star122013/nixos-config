{pkgs, host, ... } : {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
  };

  environment.systemPackages = with pkgs;[
      networkmanagerapplet
    ];

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    autoStart = false;
    tunMode = true;
  };
} 