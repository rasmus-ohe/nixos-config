{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
    ./keymaps.nix
    ./options.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    tree-sitter
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.useGlobalPackages = true;

    luaLoader.enable = true;

    # Fix yanking via SSH
    opts.clipboard = "unnamedplus";
    extraConfigLua = ''
      vim.g.clipboard = {
        name = "osc52",
        copy = {
          ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
          ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
          ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
          ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
        },
      }
    '';
  };
}
