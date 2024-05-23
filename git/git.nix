{ config, pkgs, lib, ... }:
let
  gitConfig = import ./user.nix {};
in
{
  home.file."/.config/git/.gitignore".source = ./globalignore;
  home.file.".gitconfig".text = ''
    [core]
    excludesfile = ${config.home.homeDirectory}/.config/git/.gitignore
    [alias]
    root = rev-parse --show-toplevel
    ggpush = push -u origin HEAD
    [include]
      path = ${config.home.homeDirectory}/.config/.secret/.gitconfig
  '';

  home.activation.git = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p ${config.home.homeDirectory}/.config/git/.secret
  '';
}
