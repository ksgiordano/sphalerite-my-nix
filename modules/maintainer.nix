{ config, pkgs, ... }:
{
  # Auto optimise store during each build
  nix.settings.auto-optimise-store = true;

  # Auto optimise store each week at 03:45 (default)
  nix.optimise = {
    automatic = true;
    persistent = true;
  };

  # Auto garbage-collect old generations each week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-generations +5";
    persistent = true;
  };

}
