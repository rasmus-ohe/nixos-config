{ pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # disable greeting
      '';

      shellAbbrs = {
        nt = "sudo nixos-rebuild test --flake /home/ohert/nixos#nixos --show-trace";
        ns = "sudo nixos-rebuild switch --flake /home/ohert/nixos#nixos --show-trace";
        nr = "sudo nix-collect-garbage -d";
        nv = "nvim";
        v = "nvim";
      };

      plugins = [
        {
          name = "z";
          src = pkgs.fishPlugins.z.src;
        }
        {
          name = "fish-you-should-use";
          src = pkgs.fishPlugins.fish-you-should-use.src;
        }
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "pisces";
          src = pkgs.fishPlugins.pisces.src;
        }
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
      ];
    };
  };
}
