{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    meslo-lgs-nf
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
