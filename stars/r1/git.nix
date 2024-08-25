_: {
  homeConfig = _: {
    programs.git = {
      userName = "AirOne01";
      userEmail = "21955960+AirOne01@users.noreply.github.com";

      aliases = {
        c = "checkout";
        cc = "commit";
        l = "log --all --graph --oneline";
        p = "pull";
        pp = "push";
      };
    };

    programs.gh = {
      gitCredentialHelper = {
        enable = true;
        hosts = ["https://github.com" "https://gist.github.com"];
      };
    };
  };
}
