_: {
  name = "oh-my-posh";

  config = {config, ...}: {
    home-manager.users.${config.stars.mainUser} = {
      programs.oh-my-posh = {
        enable = true;
        useTheme = "M365Princess";
      };
    };
  };
}
