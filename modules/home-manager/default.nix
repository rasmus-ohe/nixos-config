{ pkgs, lib, imports, ... }:

{
  imports = [
    ./terminals
    ./nixvim
    ./yazi.nix
  ];
}
