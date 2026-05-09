  { config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Enable kernel modules on boot for SD Card mounting
  boot.initrd.availableKernelModules = [ "mmc_block" "sdhci_pci" "sdhci" ];
}
