{ config, pkgs, inputs, lib, userName, hostName, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];
	
  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };
  
  # Networking
  networking = {
    hostName = "${hostName}";
    # networking = true; # Wireless network
    networkmanager.enable = true;

    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
    
    # Static QEMU network
    
    interfaces.enp1s0 = {
      ipv4.addresses = [{
	address = "192.168.122.200";
	prefixLength = 24;
      }];
    };
    defaultGateway = "192.168.122.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fi_FI.UTF-8";
      LC_IDENTIFICATION = "fi_FI.UTF-8";
      LC_MEASUREMENT = "fi_FI.UTF-8";
      LC_MONETARY = "fi_FI.UTF-8";
      LC_NAME = "fi_FI.UTF-8";
      LC_TELEPHONE = "fi_FI.UTF-8";
      LC_NUMERIC = "fi_FI.UTF-8";
      LC_PAPER = "fi_FI.UTF-8";
      LC_TIME = "fi_FI.UTF-8";
    };
  }; 
  
  services = {
    # Keyboard layout
    xserver.xkb = {
      layout = "fi";
      variant = "";  
    };
    
    # CUPS (printing)
    printing.enable = true;
    
    # SSH
    openssh = {
      enable = true;
      settings = {
	PasswordAuthentication = true;
	PermitRootLogin = "yes";
      };
    };
  };

  hardware = {
    # Bluetooth
    bluetooth.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${userName}" = {
    isNormalUser = true;
    description = "${userName}";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs userName; };
    users = {
      "${userName}" = import ./home.nix;
    };
  };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
	exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      vim
      wget
      curl
      wget
      lazygit
      fzf
      fd
      tree
      btop
      fastfetch
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
