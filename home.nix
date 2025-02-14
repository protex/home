{ config, pkgs, ... }:
let 
  login_password = pkgs.stdenv.mkDerivation rec {
    name = "login_password";
    src = ./bin;
    installPhase = ''
    mkdir -p $out/bin
    cp ./login_password $out/bin/login_password
    '';
  };

  gitConfig = import ./git/git.nix {};

  yabai-v4 = pkgs.stdenv.mkDerivation rec {
    name = "yabai";
    version = "5.0.6";

    src = ./yabai;

    installPhase = ''
      mkdir -p $out/bin
      cp ./bin/yabai $out/bin/yabai
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
    ./kitty/kitty.nix
  ];

  home = {
    stateVersion = "21.11";

    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      nixVersions.latest
      python310
      python310Packages.pip
      python310Packages.virtualenv
      nmap
      awscli2
      ripgrep
      tmux
      tmuxinator
      neovim #-nightly
      reattach-to-user-namespace
      jq
      yabai-v4
      skhd
      sshpass
      yarn
      dig
      dive
      gnugrep # needed by direnv
      gcc
      nodejs
      nodePackages.typescript-language-server
      nodePackages.pyright
      utm
      mysql
      docker
    ];
  };

  xdg.configFile."nix/nix.conf".text = ''
experimental-features = nix-command flakes
trusted-substituters = https://cache.nixos.org https://srid.cachix.org
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= srid.cachix.org-1:MTQ6ksbfz3LBMmjyPh0PLmos+1x+CdtJxA/J2W+PQxI=
  '';

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
