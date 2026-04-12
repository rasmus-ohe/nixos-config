{
  imports = [
    ./autopairs.nix
    ./autotag.nix
    ./bufferline.nix
    ./cmp.nix
    ./colorizer.nix
    ./colorschemes.nix
    ./comment.nix
    ./conform.nix
    ./dressing.nix
    ./indent-blankline.nix
    ./lazygit.nix
    ./lint.nix
    ./lsp.nix
    ./lualine.nix
    ./mini-move.nix
    ./neoscroll.nix
    ./noice.nix
    ./nvim-tree.nix
    ./sleuth.nix
    ./telescope.nix
    ./treesitter.nix
    ./trouble.nix
    ./web-devicons.nix
    ./which-key.nix
  ];

  programs.nixvim.plugins.nix.enable = true;
}
