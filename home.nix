let 
  pkgs = (import <nixpkgs> {});

  extraNodePackages = import ./node/default.nix { };
  userConfig = import ./user.nix {};
  gitConfig = import ./git/git.nix {};

  neuronSrc = pkgs.fetchFromGitHub {
    owner = "srid";
    repo = "neuron";
    rev = "10e3ea028c23e664e540d0460e9515bdf02ac51d";
    sha256 = "tHvgitxpGDqtLfKEuw3zQcNKd5g0gv/LooAqLt9OKg0=";
  };
  neuronPkg = (import neuronSrc).default;

in
{ config, pkgs, lib, ... }:
with builtins; {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
      neuronPkg
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

}
