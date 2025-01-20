{ config, pkgs, lib, ... }: 
let
  fixed-ghostscript = pkgs.ghostscript.overrideAttrs (oldAttrs: {
    preInstallCheck = ''
      DYLD_LIBRARY_PATH=$out/lib
      export DYLD_LIBRARY_PATH
    '';
  });
  fixed-matplotlib = pkgs.python311Packages.matplotlib.overrideAttrs (oldAttrs: {
    buildInputs = lib.remove pkgs.ghostscript oldAttrs.buildInputs ++ [ fixed-ghostscript ];
  });
  fixed-sphinxext-opengraph = pkgs.python311Packages.sphinxext-opengraph.override {
    matplotlib = fixed-matplotlib;
  };
  fixed-kitty = pkgs.kitty.overrideAttrs (oldAttrs: {
    nativeBuildInputs = lib.remove pkgs.python311Packages.sphinxext-opengraph oldAttrs.nativeBuildInputs ++ [ fixed-sphinxext-opengraph ];
  });
in
{
  home.packages = [
    fixed-kitty
  ];

  xdg.configFile.kitty = {
    source = ./config;
    recursive = true;
  };

  xdg.configFile."kitty/theme.conf".source = ./config/AlienBlood.conf;

  home.activation.kitty = lib.hm.dag.entryAfter ["writeBoundry"] ''
    $DRY_RUN_CMD [ -f ~/Applications/kitty.app ] && rm -rf ~/Applications/kitty.app
    $DRY_RUN_CMD cp -r ${fixed-kitty}/Applications/kitty.app/ ~/Applications
    $DRY_RUN_CMD chmod -R 755 ~/Applications/kitty.app
  '';
}

