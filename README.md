# sphalerite-my-nix
NixOS configuration for the Sphalerite System
very WIP, we are fairly new to NixOS and haven't even settled on a DE/WM right now. Currently on KDE and working on configuring it via plasma-manager to make it reproduceable...

You will need plasma-manager and nix flatpak (forget the name of the repo

Everything should live in /etc/nixos, except for home.nix which should be placed in ~/.config/home-manager once home-manager is installed.

Only tested on an MSI laptop with an i3-10110U and no dGPU. Working on updating this config for our desktop (i7-8086k, RTX 3070). Probably will switch to Nix on there (evetually, currently on Bazzite)
