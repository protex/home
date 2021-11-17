{ config, pkgs, lib, ... }:

with builtins; {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "pmggio";
    homeDirectory = "/Users/pmggio";
    stateVersion = "21.11";

    packages = with pkgs; [
      ripgrep
      tmux
      tmuxinator
      neovim
      reattach-to-user-namespace
      jq
      hexedit
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
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
