{ config, pkgs, ... }:

{

  imports = [
    ./dev.nix
  ];
  home.username = "nacho";
  home.homeDirectory = "/home/nacho";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    neofetch
  ];

  programs.home-manager.enable = true;
}
