{ config, lib, pkgs, ... }:

let
  cfg = config.services.cloneNixosConfig;
in {
  options.services.cloneNixosConfig = {
    enable = lib.mkEnableOption "Clone nixos-config repo on first boot";

    user = lib.mkOption {
      type = lib.types.str;
      description = "User to clone the repo as";
    };

    repoUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the nixos-config repository";
    };

    destination = lib.mkOption {
      type = lib.types.str;
      default = "/home/${cfg.user}/nixos-config";
      description = "Path to clone the repo into";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.clone-nixos-config = {
      description = "Clone nixos-config repo on first boot";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      serviceConfig = {
        Type = "oneshot";
        User = cfg.user;
      };
      script = ''
        if [ ! -d ${cfg.destination} ]; then
          ${pkgs.git}/bin/git clone ${cfg.repoUrl} ${cfg.destination}
        fi
      '';
    };
  };
}
