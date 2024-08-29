{
  pkgs,
  lib,
  ...
}: {
  services.caddy = {
    enable = true;

    package = pkgs.caddy-custom.override {
      caddyModules =
        [
          {
            name = "cloudflare";
            repo = "github.com/caddy-dns/cloudflare";
            version = "89f16b99c18ef49c8bb470a82f895bce01cbaece";
          }
          {
            name = "cache-handler";
            repo = "github.com/caddyserver/cache-handler";
            version = "v0.13.0";
          }
        ]
        ++ (
          # Caddy Layer4 modules
          lib.lists.map (name: {
            inherit name;
            repo = "github.com/mholt/caddy-l4";
            version = "3d22d6da412883875f573ee4ecca3dbb3fdf0fd0";
          }) ["layer4" "modules/l4proxy" "modules/l4tls" "modules/l4proxyprotocol"]
        );
    };

    virtualHosts."https://air1.one".extraConfig = ''
      file_server ./static/*
    '';
  };
}
