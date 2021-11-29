{ config, pkgs, lib, ... }: {
  home.file."/Library/LaunchAgents/nix.yabai.plist".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Disabled</key>
        <false/>
        <key>Label</key>
        <string>yabai</string>
        <key>ProgramArguments</key>
        <array>
            <string>${config.home.homeDirectory}/.nix-profile/bin/yabai</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
            <key>PATH</key>
            <string>${config.home.homeDirectory}/.nix-profile/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
    </dict>
    </plist>
  '';

  home.file."/.yabairc".source = ./yabai/.yabairc;

  home.activation.yabai = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD launchctl remove yabai || true
    $DRY_RUN_CMD launchctl load ${config.home.homeDirectory}/Library/LaunchAgents/nix.yabai.plist
  '';
}
