{stars, ...}: {
  networking.hostName = "cassiopeia";

  imports = with stars; [
    boot-plymouth
    cli-btop
    cli-eza
    cli-nvim
    cli-oh-my-posh
    cli-zellij
    cli-zsh
    core-pipewire
    dev-core
    gui-gnome
    gui-kitty
    gui-schizofox
    hard-graphics
    hard-nvidia # nvidia tricks
    kbd-fr
    net-network-manager
  ];

  stars.mainUser = "r1";
  system.stateVersion = "24.05";
}
