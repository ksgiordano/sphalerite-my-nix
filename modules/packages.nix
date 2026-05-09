{ config, pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure nix-flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "net.waterfox.waterfox"
      "dev.vencord.Vesktop"
    ];
  };

  programs.steam = {
    enable = true;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fastfetch
    nixfmt
    btop
    gparted
    libreoffice-fresh
    heroic
    vlc
    kdePackages.krohnkite
    kdePackages.plasma-browser-integration
    kdePackages.kcalc
    kdePackages.filelight
    #stoat-desktop
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kwallet
    kwalletmanager
    elisa
    qrca
    discover
  ];

}
