{
  programs.nixvim.plugins.conform-nvim = {
    enable = false;
    autoLoad = true;

    settings = {
      formatters_by_ft = {
        bash = [
          "shellcheck"
	  "shellharden"
	  "shfmt"
        ];

        python = [
          "isort"
          "black"
        ];

        nix = [
          "nix_fmt"
        ];

        "_" = [
          "squeeze_blanks"
	  "trim_whitespace"
	  "trim_newlines"
        ];
      };
    };
  };
}
