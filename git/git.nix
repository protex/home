{ config, pkgs, lib, ... }:
let
  gitConfig = import ./user.nix {};
in
{
  home.file.".gitignore".source = ./globalignore;
  home.file.".gitconfig".text = ''
    [core]
    excludesfile = ${config.home.homeDirectory}/.gitignore
    [user]
    email = ${gitConfig.email}
    name = ${gitConfig.name}
    [alias]
    root = rev-parse --show-toplevel
  '';
}
