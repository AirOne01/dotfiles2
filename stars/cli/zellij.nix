{pkgs, ...}: {
  systemPackages = with pkgs; [zellij];

  homeConfiguration = _: {
    programs.zellij = {
      enable = true;

      settings = {
        theme = "tokyo-night";
      };
    };
  };
}
