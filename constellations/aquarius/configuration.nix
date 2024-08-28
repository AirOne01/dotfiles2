{stars, ...}: {
  networking.hostName = "aquarius";
  stars.mainUser = "rack";
  system.stateVersion = "24.05";
  boot.loader.grub = {
    enable = true;

    device = "/dev/sda";
    useOSProber = true;
  };
  time.timeZone = "Europe/Paris";

  imports = with stars;
    [
      cli-btop
      cli-eza
      cli-nvim
      cli-oh-my-posh
      cli-zellij
      cli-zsh
      dev-core
      dev-garnix
      net-caddy-custom # custom caddy compiled with modules
      net-network-manager
      r1-git
    ]
    ++ [
      ./services/caddy.nix
    ];
}
