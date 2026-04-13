{ config, pkgs, userName, ... }:

{
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home = {
    username = "${userName}";
    stateVersion = "25.11";
    sessionVariables = {};
  };
}
