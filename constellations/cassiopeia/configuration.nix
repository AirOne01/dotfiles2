{stars, ...}: {
  networking.hostName = "cassiopeia";
  stars.mainUser = "r1";
  system.stateVersion = "24.05";
  time.timeZone = "Europe/Paris";

  imports = with stars; [
    boot-plymouth
    cli-btop
    cli-eza
    cli-nvim
    cli-oh-my-posh
    cli-zellij
    cli-zsh
    core-font
    core-gh
    core-pipewire
    dev-core
    dev-garnix
    gui-gnome
    gui-kitty
    gui-firefox
    #gui-schizofox
    hard-graphics
    hard-nvidia # nvidia tricks
    kbd-fr
    net-network-manager
    r1-git
  ];
}
