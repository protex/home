let 
  extraNodePackages = import ./node/default.nix { };
in
{ config, pkgs, lib, ... }:
with builtins; {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./nvim.nix
    ./yabai.nix
    ./skhd.nix
  ];

  home = {
    stateVersion = "21.11";
    username = "pmggio";
    homeDirectory = "/Users/pmggio";

    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
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
      yabai
      skhd
      sshpass
      yarn
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
