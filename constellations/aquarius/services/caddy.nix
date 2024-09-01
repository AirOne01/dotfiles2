{
  lib,
  pkgs,
  config,
  ...
}: {
  # Tell Caddy to load env file with token
  systemd.services.caddy.serviceConfig = {
    # EnvironmentFile = "${config.sops.secrets."net/caddy/cloudflare/token".path}";
    LoadCredential = "CLOUDFLARE_API_TOKEN:${config.sops.secrets."net/caddy/cloudflare/token".path}";
  };

  services.caddy = {
    enable = true;

    # Tell Caddy to get the use the ACME DNS API of CloudFlare
    globalConfig = "acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}";

    # Use a custom build of Caddy compiled with modules
    # See the corresponding overlay
    package = pkgs.caddy-custom.override {
      caddyModules =
        [
          {
            # CloudFlare DNS handler for ACME API
            name = "cloudflare";
            repo = "github.com/caddy-dns/cloudflare";
            version = "89f16b99c18ef49c8bb470a82f895bce01cbaece";
          }
          {
            # Caching which I will implement later
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

    ############ Actual Caddy config ############
    # It's the config hosted on my home server. #
    # More documentation on this will follow,   #
    # And maybe a wiki for all my stuff as well #
    #                                           #
    # This is my first step in becoming a chad  #
    # dev kek.                                  #
    #############################################
    virtualHosts."https://air1.one".extraConfig = ''
      respond `${builtins.readFile ./static/index.html}`
    '';
  };
}
