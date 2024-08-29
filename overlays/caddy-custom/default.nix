_: prev: {
  # Updated Caddy with support for including extra modules
  #
  # Source: https://github.com/NixOS/nixpkgs/pull/259275
  # Also see: https://github.com/NixOS/nixpkgs/issues/14671#issuecomment-2312320822
  # The hacky solution: https://github.com/NixOS/nixpkgs/issues/14671#issuecomment-2316411251
  caddy-custom = prev.callPackage ./package.nix {};
}
