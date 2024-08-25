_: {
  name = "oh-my-posh";

  homeConfig = _: {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "M365Princess";
    };
  };
}
