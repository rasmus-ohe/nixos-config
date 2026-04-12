{ pkgs, lib, imports, ... }:

{
  imports = [
    ./terminals
    ./nixvim
    ./yazi.nix
    ./git.nix
  ];
}
