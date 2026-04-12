{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "rasmus-ohe";
        email = "rassemichael@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
