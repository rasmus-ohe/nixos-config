{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/root";
    autoResize = true;
    fsType = "ext4";
  };
  
  # Mount from KVM
  fileSystems."/mnt/vm-share" = {
    device = "vm-share";
    fsType = "virtiofs";
    options = [
      "nofail"
      "x-systemd.automount"
    ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4*1024;
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
