{ pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # disable greeting
      '';

      shellAbbrs = {
        # NixOS
        ntk = "sudo nixos-rebuild test --flake .#kvm --show-trace";
        nsk = "sudo nixos-rebuild switch --flake .#kvm --show-trace";
        nr = "sudo nix-collect-garbage -d";

        # Nvim
        nv = "nvim";
        v = "nvim";

        # Git
        ga = "git add -A";
        lg = "lazygit";
        lz = "lazygit";
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
