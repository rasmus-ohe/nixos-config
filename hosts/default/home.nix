{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home = {
    username = "rasmuso";
    stateVersion = "25.11";
    sessionVariables = {};
  };
}
