{ config, pkgs, inputs, ... }:

{
    zramSwap = {

        enable = true;
        memoryPercent = 50;
    };
}
