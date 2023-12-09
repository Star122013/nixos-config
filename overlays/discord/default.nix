{ pkgs, config, ... }:
("final:prev:" {
  discord = prev.discord.override {
    commanLineArgs = "--proxy-server=http://127.0.0.1:20121";
  };
})
