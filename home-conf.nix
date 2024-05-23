{ nixpkgs, nurpkgs, home-manager, ... }:
{
  main = home-manager.lib.homeManagerConfiguration rec {

    stateVersion = "21.03";
    configuration = import ./home.nix {
      inherit nur pkgs;
      inherit (pkgs) config lib stdenv;
    };
  };
}
