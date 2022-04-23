self: super:

{
  tmux = super.tmux.overrideAttrs ( old: rec {
    name = "sixel-tmux-${version}";
    version = "2.0";
    patches = [
      ( super.fetchpatch {
        url = "https://github.com/csdvrx/sixel-tmux/commit/0806db31743e1c372b072c12fc76898bbe59f8de.patch";
        sha256 = "sha256-oo9+8Dpu7Q1MgiXirX52Gc3cvBcTvIlLLE/byMLx2dU=";
      })
    ];
  });
}
