{pkgs, ...}: {
  systemPackages = with pkgs; [sops age ssh-to-age];

  config = {config, ...}: {
    # Those are the configs for the sops flake.
    # This does not configure the cli.
    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/${config.stars.mainUser}/.config/sops/age/keys.txt";

      secrets."net/caddy/cloudflare/token" = {
        owner = "caddy";
        sopsFile = ../../secrets/net/caddy.yaml;
      };
    };
  };
}
