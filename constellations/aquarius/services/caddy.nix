{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  # Use a custom build of Caddy compiled with modules
  # See https://github.com/crabdancing/nixos-caddy-with-plugins
  compiledCaddy = inputs.caddy-many.packages.${pkgs.system}.default.withPlugins {
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
    vendorHash = "sha256-NqfXipChaAGN4v//BgMAP2WmzUJNhu7yU8Cd6QiJYpg=";
  };
in {
  services.caddy = {
    enable = true;

    package = compiledCaddy;

    ############ Actual Caddy config ############
    # It's the config hosted on my home server. #
    # More documentation on this will follow,   #
    # and maybe a wiki for all my stuff as well #
    #############################################
    virtualHosts."https://air1.one".extraConfig = ''
      # Tell Caddy to get the use the ACME DNS API of CloudFlare
      tls {dns cloudflare {file.${config.sops.secrets."net/caddy/cloudflare/token".path}}}

      respond `${builtins.readFile ./static/index.html}`
    '';
  };

  environment.systemPackages = [compiledCaddy];
}
