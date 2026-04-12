{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>tt";
        action = "<cmd>ToggleTerm<CR>";
        mode = "n";
        options.desc = "Toggle terminal";
      }
    ]; 
  };
}
