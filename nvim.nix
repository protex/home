{ config, pkgs, lib, ... }: {
  # Add my config
  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  home.activation.nvim = lib.hm.dag.entryAfter ["installPackages"] ''
    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD nvim --headless -c 'autocmd User PackerComplete quitall' -c 'lua require "plugin-config"' -c "PackerSync" -u NONE
  '';
}
