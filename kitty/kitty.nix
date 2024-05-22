{ config, pkgs, lib, ... }: {
  # home.packages = [ pkgs.kitty ];
  
  xdg.configFile.kitty = {
    source = ./config;
    recursive = true;
  };

  xdg.configFile."kitty/theme.conf".source = ./config/AlienBlood.conf;

  home.activation.kitty = lib.hm.dag.entryAfter ["writeBoundry"] ''
    # $DRY_RUN_CMD [ -f ~/Applications/kitty.app ] && rm -rf ~/Applications/kitty.app
    # $DRY_RUN_CMD cp -r ~/.nix-profile/Applications/kitty.app/ ~/Applications
    $DRY_RUN_CMD chmod -R 755 ~/Applications/kitty.app
  '';
}

