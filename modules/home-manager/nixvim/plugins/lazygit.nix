{
  programs.nixvim.plugins.lazygit = {
    enable = true;
    
    keybindings = [
      {
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        mode = "n";
        options.desc = "Open LazyGit";
      }
    ];
  };
}
