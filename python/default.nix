let pkgs = import <nixpkgs> { };
in
let
  packageOverrides = pkgs.callPackage ./python-packages.nix {};
  python = pkgs.python3.override { inherit packageOverrides; };
  pythonWithPackages = python.withPackages(ps: [ ps.fastapi ]);   
in
pkgs.mkShell {
  buildInputs = [
    pythonWithPackages
  ];
}
