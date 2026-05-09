# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
let
  # Fetch nix-flatpak
  pkgs = import <nixpkgs> {};
  nix-flatpak = pkgs.fetchFromGitHub {
    owner = "gmodena";
    repo = "nix-flatpak";
    rev = "v0.7.0";
    hash = "sha256-7ZCulYUD9RmJIDULTRkGLSW1faMpDlPKcbWJLYHoXcs=";
  };
in
{ config, pkgs, inputs, ... }:

{

    imports =
      [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./modules/locale.nix
        ./modules/swaps.nix
        ./modules/boot.nix
        ./modules/services.nix
        ./modules/networking.nix
        ./modules/packages.nix
        ./modules/maintainer.nix
        <home-manager/nixos>
        # Import the nix-flatpak NixOS module and install applications system wide.
        # HomeManager users should import `${nix-flatpak}/modules/home-manager.nix`
        # where appropriate.
        "${nix-flatpak}/modules/nixos.nix"
      ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sphalerite-system = {
    isNormalUser = true;
    description = "Sphalerite";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
