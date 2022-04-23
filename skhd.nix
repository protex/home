{ config, pkgs, lib, ... }: {
  launchd.agents.skhd = {
    enable = true;
    config = {
      Label = "skhd";
      ProgramArguments = [
        "${config.home.homeDirectory}/.nix-profile/bin/skhd"
        "--verbose"
      ];
      EnvironmentVariables = {
        PATH = "${config.home.homeDirectory}/.nix-profile/bin/:/usr/local/bin";
      };
      RunAtLoad = true;
      StandardOutPath = "${config.home.homeDirectory}/var/log/skhd/skhd.out.log";
      StandardErrorPath = "${config.home.homeDirectory}/var/log/skhd/skhd.err.log";
      ProcessType = "Interactive";
      Nice = -20;
      KeepAlive = {
        Crashed = true;
      };
    };
  };

  home.file."/.skhdrc".source = ./skhd/.skhdrc;

  home.activation.skhd = lib.hm.dag.entryAfter ["writeBoundry"] ''
    $DRY_RUN_CMD mkdir -p ${config.home.homeDirectory}/var/log/skhd
  '';
}
