{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
