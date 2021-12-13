{ config, pkgs, lib, ... }: {
  home.file."/Library/LaunchAgents/nix.skhd.plist".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Disabled</key>
      <false/>
      <key>Label</key>
      <string>skhd</string>
      <key>ProgramArguments</key>
      <array>
          <string>${config.home.homeDirectory}/.nix-profile/bin/skhd</string>
      </array>
      <key>EnvironmentVariables</key>
      <dict>
          <key>PATH</key>
          <string>${config.home.homeDirectory}/.nix-profile/bin/:/usr/bin:/bin:/usr/sbin:/sbin</string>
      </dict>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardOutPath</key>
      <string>${config.home.homeDirectory}/log/skhd/skhd.out.log</string>
      <key>StandardErrorPath</key>
      <string>${config.home.homeDirectory}/log/skhd/skhd.err.log</string>
      <key>ProcessType</key>
      <string>Interactive</string>
      <key>Nice</key>
      <integer>-20</integer>
    </dict>
    </plist>
  '';

  home.file."/.skhdrc".source = ./skhd/.skhdrc;

  home.activation.skhd = lib.hm.dag.entryAfter ["writeBoundry"] ''
    $DRY_RUN_CMD mkdir -p ${config.home.homeDirectory}/var/log/skhd
    $DRY_RUN_CMD launchctl remove skhd || true
    $DRY_RUN_CMD launchctl load ${config.home.homeDirectory}/Library/LaunchAgents/nix.skhd.plist
  '';
}
