_: {
  config = {config, ...}: {
    home-manager.users.${config.stars.mainUser}.home = {
      keyboard.layout = "fr";
    };
  };
}
