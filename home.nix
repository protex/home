let 
  pkgs = (import <nixpkgs> {});
  extraNodePackages = import ./node/default.nix { };
  pip2nix = (import (pkgs.fetchFromGitHub{
    owner="nix-community";
    repo="pip2nix";
    rev = "3ded07fcb8a4a491f36f1b8aac9c9c9c402d99fe";
    sha256 = "CPcJRERr3vENqPvM6FsfxtAGw0/qgE7+0B/fBdNyDXM=";
  } + "/release.nix") {}).pip2nix;
in
{ config, pkgs, lib, ... }:
with builtins; {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./nvim.nix
    ./yabai.nix
    ./skhd.nix
    ./user.nix
  ];

  home = {
    stateVersion = "21.11";

    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      nmap
      ripgrep
      tmux
      tmuxinator
      neovim
      reattach-to-user-namespace
      jq
      hexedit
      nodejs-12_x
      nodePackages.node2nix
      extraNodePackages.lerna
      extraNodePackages.localtunnel
      yabai
      skhd
      sshpass
      yarn
      pip2nix.python39
    ];
  };

  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        custom = "$HOME/.config/ohmyzsh/custom";
        plugins = [ "git" "zsh-autosuggestions"];
        theme = "robbyrussell";
      };
    };
  };


  xdg.configFile.ohmyzsh = {
    source = ./ohmyzsh-config;
    recursive = true;
  };

  xdg.configFile."ohmyzsh/custom/plugins/zsh-autosuggestions" = {
    source = pkgs.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-autosuggestions";
      rev = "v0.4.0";
      sha256 = "bBqJCkhygrXqAfWBsvUNpXu9IrwLyn/ypmTRKSVP0Xw=";
    };
    recursive = true;
  };

  home.file.".tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.0.0";
      sha256 = "qYBMDLIEkgiTFxjlF8AHn31HZ4nt/ZoeerzX70SSBaM=";
    };
  };

  home.file.".tmux" = {
    source = ./tmux-config/tmux;
    recursive = true;
  };

  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.tmux/conf.d/tmux.conf";
  home.file.".gitignore".source = ./git/globalignore;
  home.file.".gitconfig".source = ./git/globalconfig;

}
