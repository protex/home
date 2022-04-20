{ config, pkgs, lib, ... }: {
  # Add my config
  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  home.activation.nvim = lib.hm.dag.entryAfter ["writeBoundry"] ''
    $DRY_RUN_CMD nvim --headless -c 'lua require "plugin-config"' -c 'autocmd User PackerComplete quitall' -u NONE
  '';
}
