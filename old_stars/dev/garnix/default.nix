{lib, ...}: let
  garnixStar = lib.mkStar {
    name = "garnix";

    extraConfig = {
      nix.settings = {
        substituters = ["https://cache.garnix.io"];
        trusted-public-keys = ["cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
      };
    };
  };
in {
  imports = [garnixStar];
}
