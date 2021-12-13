{pkgs}: 
let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.3.0";
  }) {
    python = "python39";
  };

  alohomora = mach-nix.buildPythonPackage {
    src = pkgs.fetchFromGitHub {
      owner = "Viasat";
      repo = "alohomora";
      rev = "5d138fb83b8ab933305e93623d1fd40e346b15be";
      sha256 = "0KZn1L8rbA1V43ZOLhw+qyyQWYyKIso3nnTffCh+rB0=";
    };
  };

  python = mach-nix.mkPython [
    alohomora
  ];
in {
  python = python;
}
