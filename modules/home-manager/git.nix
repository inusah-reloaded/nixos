{config, lib, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "Inusah Alhassan Bumbumnaa";
    userEmail = "inusah.reloaded@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
