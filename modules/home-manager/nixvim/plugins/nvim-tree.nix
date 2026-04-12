{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;

      settings = {
        view.relativenumber = true;
        renderer = {
          indent_markers.enable = true;
          icons.glyphs.folder = {
            arrow_closed = "";
            arrow_open = "";
          };
        };
        actions.open_file.window_picker.enable = true;
        git.ignore = false;
        filters.custom = [
          ".DS_Store"
        ];
      };
    };

    keymaps = [
      {
        key = "<leader>ee";
        action = "<cmd>NvimTreeToggle<CR>";
        mode = "n";
        options.desc = "Toggle file explorer";
      }
      {
        key = "<leader>ec";
        action = "<cmd>NvimTreeCollapse<CR>";
        mode = "n";
        options.desc = "Collapse file explorer";
      }
      {
        key = "<leader>er";
        action = "<cmd>NvimTreeRefresh<CR>";
        mode = "n";
        options.desc = "Refresh file explorer";
      }
    ];
  };
}
