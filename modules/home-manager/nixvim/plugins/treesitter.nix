{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    
    autoinstall = false;
    nixvimInjections = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;
      autotag.enable = true;
      folding.enable = true;
      ensure_installed = [
        "bash"
        "c"
        "cpp"
        "css"
        "html"
        "javascript"
        "json"
        "lua"
        "markdown"
        "markdown_inline"
        "python"
        "regex"
        "rust"
        "toml"
        "tsx"
        "typescript"
        "vimdoc"
        "yaml"
        "nix"
        "vim"
      ];
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
      };
    };
  };
}
