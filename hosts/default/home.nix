{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home = {
    username = "ohert";
    stateVersion = "25.11";
    sessionVariables = {};
  };
}
