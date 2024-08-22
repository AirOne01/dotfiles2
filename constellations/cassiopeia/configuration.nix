{
  stars,
  inputs,
  ...
}: {
  networking.hostName = "cassiopeia";

  imports = with stars;
    [
      boot-plymouth
      cli-btop
      # cli-nvim
      cli-oh-my-posh
      cli-zsh
      core-pipewire
      dev-core
      gui-gnome
      gui-kitty
      hard-graphics
      hard-nvidia # nvidia tricks
      kbd-fr
      net-network-manager
    ]
    ++ [inputs.nvf.homeManagerModules.default];

  stars.mainUser = "r1";
  system.stateVersion = "24.05";
}
