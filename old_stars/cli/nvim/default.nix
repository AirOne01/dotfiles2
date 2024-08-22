_: {
  config = {config, ...}: {
    home-manager.users.${config.stars.mainUser}.imports = [./home];
  };
}
