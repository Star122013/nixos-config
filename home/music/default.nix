{...}:{
  services.mpd = {
  enable = true;
  musicDirectory = "~/Music";
  extraConfig = ''
    # must specify one or more outputs in order to play audio!
    # (e.g. ALSA, PulseAudio, PipeWire), see next sections
    audio_output {
    type "pipewire"
    name "My PipeWire Output"
  }
  '';
  network.listenAddress = "any"; 
  };
  
   programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = null;
    };
  };
  home.file = {
    ".config/ncmpcpp/config".text = ''
      mpd_music_dir = ~/Music
    '';
};
}