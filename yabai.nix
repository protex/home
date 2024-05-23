{ config, pkgs, lib, ... }: {
  launchd.agents.yabai = {
    enable = true;
    config = {
      RunAtLoad = true;
      KeepAlive = true;
      Label = "yabai";
      ProgramArguments = [
        "${pkgs.yabai}/bin/yabai"
        "--verbose"
      ];
      EnvironmentVariables = {
        PATH = "${pkgs.yabai}/bin/:/usr/bin:/bin:/usr/sbin:/sbin";
      };
      StandardOutPath = "${config.home.homeDirectory}/var/log/yabai/yabai.out.log";
      StandardErrorPath = "${config.home.homeDirectory}/var/log/yabai/yabai.err.log";
      ProcessType = "Interactive";
      Nice = 20;
    };
  };

  home.file."/.yabairc".source = ./yabai/.yabairc;

  home.activation.yabai = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p ${config.home.homeDirectory}/var/log/yabai
  '';
}
