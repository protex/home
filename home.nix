{ config, pkgs, lib, darwin, xxd, Foundation, ... }:
let 
  pkgs = (import <nixpkgs> {
    # overlays = [
    #   (import (builtins.fetchTarball {
    #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    #   }))
    # ];
  });

  userConfig = import ./user.nix {};
  gitConfig = import ./git/git.nix {};

  yabai-v4 = pkgs.stdenv.mkDerivation rec {
    name = "yabai";
    version = "4.0.0";

    src = ./yabai;

    installPhase = ''
      mkdir -p $out/bin
      cp ./bin/yabai $out/bin/yabai
    '';
  };

  enpass-cli = pkgs.stdenv.mkDerivation rec {
    name = "enpass-cli";
    version = "1.4.0";

    src = pkgs.fetchzip {
      url = "https://github.com/hazcod/enpass-cli/releases/download/v${version}/enpass-cli_${version}_darwin_amd64.zip";
      sha256 = "sha256-uKH09kKfci2mQpU5leqo4UnJV/CMakzim98NXjxMxM0=";
    };

    installPhase = ''
      mkdir -p $out/bin
      cp ./enpasscli $out/bin/enpass
    '';
  };
in
with builtins; {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  launchd.enable = true;

  imports = [
    ./nvim.nix
    ./yabai.nix
    ./skhd.nix
    ./git/git.nix
  ];

  home = {
    stateVersion = "21.11";
    homeDirectory = userConfig.homeDirectory;
    username = userConfig.username;

    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      nmap
      ripgrep
      tmux
      tmuxinator
      neovim #-nightly
      reattach-to-user-namespace
      jq
      hexedit
      yabai-v4
      skhd
      sshpass
      yarn
      spotify-tui
      dig
      dive
      catimg
      gnugrep # needed by direnv
      vault
      yq
      asciinema
      enpass-cli
      gh
      (python39.withPackages (pp: with pp; [
        pynvim
      ]))
      gcc
    ];
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.config/ohmyzsh/custom";
      plugins = [ "git" "zsh-autosuggestions"];
      theme = "robbyrussell";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
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

}
