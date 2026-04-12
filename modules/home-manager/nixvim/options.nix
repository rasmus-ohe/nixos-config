{
  programs.nixvim.opts = {
    # Line numbers
    relativenumber = true;
    number = true;
    
    # Tabs and indentation
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;

    # Line warping
    wrap = true;

    # Search
    ignorecase = true;
    smartcase = true;

    # Cursos line
    cursorline = true;
  };
}
