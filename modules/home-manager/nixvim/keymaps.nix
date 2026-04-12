{
  programs.nixvim = {
    keymaps = [
      # Quit
      {
        key = "<leader>qq";
        action = "<cmd>q<CR>";
        mode = "n";
        options.desc = "Quit NeoVim (current buffer)";
      }
      {
        key = "<leader>qa";
        action = "<cmd>qa<CR>";
        mode = "n";
        options.desc = "Quit NeoVim (all)";
      }

      # Save
      {
        key = "<leader>ww";
        action = "<cmd>w<CR>";
        mode = "n";
        options.desc = "Save current buffer";
      }
      {
        key = "<leader>wa";
        action = "<cmd>wa<CR>";
        mode = "n";
        options.desc = "Save all buffers";
      }
      {
        key = "<leader>wq";
        action = "<cmd>wq<CR>";
        mode = "n";
        options.desc = "Save and quit current buffer";
      }

      # Search
      {
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR><Esc>";
        mode = "n";
        options.desc = "Clear search highlight";
      }

      # Tabs
      {
        key = "<leader>tn";
        action = "<cmd>tabnew<CR>";
        mode = "n";
        options.desc = "Open new tab";
      }
      {
        key = "<leader>tq";
        action = "<cmd>tabclose<CR>";
        mode = "n";
        options.desc = "Close current tab";
      }
      {
        key = "<leader>tr";
        action = "<cmd>tabn<CR>";
        mode = "n";
        options.desc = "Go to tab: right";
      }
      {
        key = "<leader>tl";
        action = "<cmd>tabp<CR>";
        mode = "n";
        options.desc = "Go to tab: left";
      }
    ];
    globals.mapleader = " ";
  };
}
