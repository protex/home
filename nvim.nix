{ config, pkgs, lib, ... }: {
  # Add my config
  xdg.configFile.nvim = {
    source = ./neovim-config;
    recursive = true;
  };

  # Install vim plug
  xdg.configFile."nvim/autoload/plug.vim" = {
    source = pkgs.fetchFromGitHub {
      owner = "junegunn";
      repo = "vim-plug";
      rev = "c9971346bb486ccff354aaee8606cc0d2d5a0c97";
      sha256 = "UZnVrX6P+RFlFilPJawVlKu8qJoU3GzlQm9wuZ2YWnA=";
    } + "/plug.vim";
  };

  home.activation.nvim = lib.hm.dag.entryAfter ["writeBoundry"] ''
    $DRY_RUN_CMD nvim --headless +'PlugClean!' +"PlugInstall --sync" +qa
  '';
}
