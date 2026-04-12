{
  programs.nixvim.plugins.mini-move = {
    enable = true;

    settings = {
      mappings = {
        up = "<A-Up>";
        down = "<A-Down>";
        left = "<A-h>";
        right = "<A-l>";

        line_up = "<A-Up>";
        line_down = "<A-Down>";
        line_left = "<A-h>";
        line_right = "<A-l>";
      };
    };
  };
}
