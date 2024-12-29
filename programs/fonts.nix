{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    roboto-mono
    font-awesome
  ];
}
